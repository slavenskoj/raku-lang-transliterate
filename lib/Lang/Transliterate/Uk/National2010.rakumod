use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::National2010 does Lang::Transliterate::Transliterator;

# Ukrainian National system 2010 (also "BGN/PCGN 2019")
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',      # Note: 'gh' is used in зг combination
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'ie',     # 'ye' at beginning of word
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'i',      # 'yi' at beginning of word
    'й' => 'i',      # 'y' at beginning of word
    'к' => 'k',
    'л' => 'l',
    'м' => 'm',
    'н' => 'n',
    'о' => 'o',
    'п' => 'p',
    'р' => 'r',
    'с' => 's',
    'т' => 't',
    'у' => 'u',
    'ф' => 'f',
    'х' => 'kh',
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shch',
    'ь' => '',       # Soft sign not transliterated
    'ю' => 'iu',     # 'yu' at beginning of word
    'я' => 'ia',     # 'ya' at beginning of word
    "'" => '',       # Apostrophe not transliterated
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        my $lower = $char.lc;
        my $found = False;
        
        # Special handling for зг combination (zgh)
        if $lower eq 'з' && $i + 1 < @chars.elems && @chars[$i + 1].lc eq 'г' {
            $result ~= self!preserve-case($char, 'z', $i, @chars);
            $result ~= self!preserve-case(@chars[$i + 1], 'gh', $i, @chars);
            $i += 2;
            $found = True;
        }
        # Context-dependent rules for word-initial positions
        elsif self!is-word-initial($i, @chars) {
            given $lower {
                when 'є' { $result ~= self!preserve-case($char, 'ye', $i, @chars); $found = True; }
                when 'ї' { $result ~= self!preserve-case($char, 'yi', $i, @chars); $found = True; }
                when 'й' { $result ~= self!preserve-case($char, 'y', $i, @chars); $found = True; }
                when 'ю' { $result ~= self!preserve-case($char, 'yu', $i, @chars); $found = True; }
                when 'я' { $result ~= self!preserve-case($char, 'ya', $i, @chars); $found = True; }
            }
        }
        
        unless $found {
            if %base-mappings{$lower}:exists {
                $result ~= self!preserve-case($char, %base-mappings{$lower}, $i, @chars);
            } else {
                $result ~= $char;
            }
        }
        
        $i++;
    }
    
    return $result;
}

method !is-word-initial(Int $pos, @chars --> Bool) {
    return $pos == 0 || ?(@chars[$pos - 1] ~~ /\s/ || @chars[$pos - 1] ~~ /\W/);
}

method !preserve-case(Str $original, Str $replacement, Int $pos, @chars --> Str) {
    # If original is not uppercase, return as-is
    return $replacement unless $original ~~ /<:Lu>/;
    
    # For multi-character replacements, check if we're in all-caps context
    if $replacement.chars > 1 {
        my $all-caps = False;
        
        # Check surrounding context
        if $pos > 0 && $pos + 1 < @chars.elems {
            # Middle of word: check both neighbors
            $all-caps = @chars[$pos - 1] ~~ /<:Lu>/ && @chars[$pos + 1] ~~ /<:Lu>/;
        } elsif $pos == 0 && $pos + 1 < @chars.elems {
            # Start of word: check next char
            $all-caps = @chars[$pos + 1] ~~ /<:Lu>/;
        } elsif $pos + 1 == @chars.elems && $pos > 0 {
            # End of word: check previous char
            $all-caps = @chars[$pos - 1] ~~ /<:Lu>/;
        }
        
        return $all-caps ?? $replacement.uc !! $replacement.tc;
    }
    
    # Single character replacement
    return $replacement.uc;
}

method get-reverse-mappings(--> List) {
    # Ukrainian National 2010 reverse mapping
    return (
        # Multi-character mappings first
        'zgh' => 'зг',
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        # Word-initial variants
        'ye' => 'є',
        'yi' => 'ї',
        'yu' => 'ю',
        'ya' => 'я',
        # Regular mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
        'gh' => 'г',
        'd' => 'д',
        'e' => 'е',
        'ie' => 'є',
        'z' => 'з',
        'y' => 'и',  # Could also be й
        'i' => 'і',  # Could also be ї
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',
        'u' => 'у',
        'f' => 'ф',
        'iu' => 'ю',
        'ia' => 'я',
    );
}