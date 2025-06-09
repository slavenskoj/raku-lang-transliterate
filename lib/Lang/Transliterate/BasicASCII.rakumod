use Lang::Transliterate;
use Lang::Transliterate::ISO9_1995;
use Lang::Transliterate::Grc::Scientific;
use Lang::Transliterate::Ar::ISO233;
use Lang::Transliterate::He::ISO259;
use Lang::Transliterate::Fa::UN;

unit class Lang::Transliterate::BasicASCII does Lang::Transliterate::Transliterator;

# Basic ASCII Transliteration
# Language-independent conversion to ASCII using Unicode NFD normalization
# followed by diacritic removal. This is NOT reversible.
# For Cyrillic text, uses ISO 9:1995 transliteration first
# For Greek text, uses Scientific transliteration first
# For Arabic text, uses ISO 233 transliteration first
# For Hebrew text, uses ISO 259 transliteration first
# For Persian characters not covered by Arabic, uses UN transliteration

# Common Latin letter substitutions for non-decomposable characters
my %fallback-mappings = (
    # Latin letters with strokes/hooks that don't decompose
    'Ø' => 'O', 'ø' => 'o',  # O with stroke
    'Đ' => 'D', 'đ' => 'd',  # D with stroke
    'Ł' => 'L', 'ł' => 'l',  # L with stroke
    'Ħ' => 'H', 'ħ' => 'h',  # H with stroke
    'Ŧ' => 'T', 'ŧ' => 't',  # T with stroke
    'Ð' => 'D', 'ð' => 'd',  # Eth
    'Þ' => 'Th', 'þ' => 'th', # Thorn
    'Ŋ' => 'N', 'ŋ' => 'n',  # Eng
    'Œ' => 'OE', 'œ' => 'oe', # OE ligature
    'Æ' => 'AE', 'æ' => 'ae', # AE ligature
    'ß' => 'ss',             # German eszett
    'ĸ' => 'k',              # Kra
    'ı' => 'i',              # Dotless i
    'ȷ' => 'j',              # Dotless j
    
    # Greek handled by Scientific transliteration
    
    # Cyrillic handled by ISO 9:1995 - but keep modifier letters
    'ʺ' => '-',  # Hard sign modifier from ISO 9
    'ʹ' => '-',  # Soft sign modifier from ISO 9
    
    # Arabic handled by ISO 233 - but convert special markers
    'ʼ' => "-",  # Modifier letter apostrophe (alif/hamza)
    'ʻ' => "-",  # Modifier letter turned comma (ayn)
    'ʾ' => "-",  # Right half ring (hamza)
    'ʿ' => "-",  # Left half ring (ayn)
    
    # Common symbols
    '№' => 'No.',
    '™' => 'TM',
    '©' => '(c)',
    '®' => '(R)',
    '°' => 'deg',
    '±' => '+/-',
    '×' => 'x',
    '÷' => '/',
    '≈' => '~',
    '≠' => '!=',
    '≤' => '<=',
    '≥' => '>=',
    '«' => '"',
    '»' => '"',
    '‹' => "'",
    '›' => "'",
    '"' => '"',
    '"' => '"',
    ''' => "'",
    ''' => "'",
    '–' => '-',
    '—' => '--',
    '…' => '...',
    '•' => '*',
    '€' => 'EUR',
    '£' => 'GBP',
    '¥' => 'JPY',
    '¢' => 'c',
    '§' => 'S',
    '¶' => 'P',
    '†' => '+',
    '‡' => '++',
    '‰' => 'o/oo',
    '′' => "'",
    '″' => '"',
    '‴' => "'''",
);

method get-mappings(--> Hash) {
    # This module doesn't use direct mappings in the traditional sense
    # Instead it uses NFD normalization + fallbacks
    return %fallback-mappings;
}

method get-reverse-mappings(--> List) {
    # This transliteration is explicitly NOT reversible
    return ();
}

method transliterate(Str $text --> Str) {
    # Step 0: Check for scripts that need special handling
    my $working-text = $text;
    
    # Check if text contains Hebrew and transliterate with ISO 259 first
    if $text ~~ /<:Hebrew>/ {
        # Contains Hebrew characters - use ISO 259 transliteration
        my $hebrew-iso = Lang::Transliterate::He::ISO259.new;
        $working-text = $hebrew-iso.transliterate($working-text);
    }
    
    # Check if text contains Arabic and transliterate with ISO 233 first
    if $working-text ~~ /<:Arabic>/ {
        # Contains Arabic characters - use ISO 233 transliteration
        my $arabic-iso = Lang::Transliterate::Ar::ISO233.new;
        $working-text = $arabic-iso.transliterate($working-text);
        
        # Check for Persian characters that may not be covered by Arabic ISO 233
        # Persian-specific characters: پ چ ژ گ ک (and Persian digits)
        if $working-text ~~ /[\c[0x067E]|\c[0x0686]|\c[0x0698]|\c[0x06AF]|\c[0x06A9]|\c[0x06F0..0x06F9]]/ {
            # Contains Persian-specific characters - use UN transliteration
            my $persian-un = Lang::Transliterate::Fa::UN.new;
            $working-text = $persian-un.transliterate($working-text);
        }
    }
    
    # Check if text contains Greek and transliterate with Scientific
    if $working-text ~~ /<:Greek>/ {
        # Contains Greek characters - use Scientific transliteration
        my $greek-sci = Lang::Transliterate::Grc::Scientific.new;
        $working-text = $greek-sci.transliterate($working-text);
    }
    
    # Check if text contains Cyrillic and transliterate with ISO 9:1995
    if $working-text ~~ /<:Cyrillic>/ {
        # Contains Cyrillic characters - use ISO 9:1995
        my $iso9 = Lang::Transliterate::ISO9_1995.new;
        $working-text = $iso9.transliterate($working-text);
    }
    
    # Step 1: Apply NFD (Canonical Decomposition)
    my $nfd = $working-text.NFD;
    
    # Step 2: Remove combining diacritical marks
    my $stripped = $nfd.subst(/<:M>/, '', :g);  # Remove all Mark characters (Mn, Mc, Me)
    
    # Step 3: Apply fallback mappings for characters that don't decompose well
    my $result = '';
    for $stripped.comb -> $char {
        if %fallback-mappings{$char}:exists {
            $result ~= %fallback-mappings{$char};
        } elsif $char.ord < 128 {
            # Already ASCII
            $result ~= $char;
        } elsif $char ~~ /<:L>/ {
            # Letter that we don't have a mapping for - use question mark
            $result ~= '?';
        } elsif $char ~~ /<:N>/ {
            # Number that we don't have a mapping for - keep if possible
            $result ~= $char.uniname ~~ /DIGIT\s+(\w+)/ ?? ~$0 !! '?';
        } elsif $char ~~ /<:P>/ || $char ~~ /<:S>/ {
            # Punctuation or symbol - try to approximate
            given $char {
                when /\s/ { $result ~= ' ' }
                when /<:Pd>/ { $result ~= '-' }
                when /<:Ps>/ { $result ~= '(' }
                when /<:Pe>/ { $result ~= ')' }
                when /<:Pi>/ { $result ~= '"' }
                when /<:Pf>/ { $result ~= '"' }
                default { $result ~= '?' }
            }
        } elsif $char ~~ /\s/ {
            # Whitespace
            $result ~= ' ';
        } else {
            # Everything else becomes question mark
            $result ~= '?';
        }
    }
    
    # Step 4: Clean up multiple spaces and question marks
    $result = $result.subst(/\s+/, ' ', :g);
    $result = $result.subst(/\?+/, '?', :g);
    
    return $result;
}

# Override detransliterate to return text as-is (not reversible)
method detransliterate(Str $text --> Str) {
    return $text;
}