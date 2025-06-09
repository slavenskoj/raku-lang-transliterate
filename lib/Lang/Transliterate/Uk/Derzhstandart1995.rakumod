use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::Derzhstandart1995 does Lang::Transliterate::Transliterator;

# Ukrainian Derzhstandart 1995
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'gh',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'ji',
    'й' => 'j',      # Word-initial, after vowels or apostrophe
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
    'ц' => 'c',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shh',
    'ь' => 'j',      # After consonants
    'ю' => 'ju',
    'я' => 'ja',
    "'" => 'ʹ',      # U+02B9 ʹ modifier letter prime before iotated letters
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
        
        # Special handling for soft sign after consonants
        if $lower eq 'ь' && $i > 0 && @chars[$i - 1] ~~ /<:L>/ && @chars[$i - 1].lc !~~ /[аеєиіїоуюя]/ {
            $result ~= 'j';
            $found = True;
        }
        # Handle й contextually
        elsif $lower eq 'й' {
            # Word-initial, after vowels or apostrophe
            if $i == 0 || @chars[$i - 1] ~~ /\s/ || @chars[$i - 1] ~~ /[аеєиіїоуюя']/ {
                $result ~= self!preserve-case($char, 'j', $i, @chars);
            } else {
                $result ~= self!preserve-case($char, 'j', $i, @chars);
            }
            $found = True;
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
    # Ukrainian Derzhstandart 1995 reverse mapping
    return (
        # Multi-character mappings first
        'zh' => 'ж',
        'gh' => 'г',
        'kh' => 'х',
        'ch' => 'ч',
        'sh' => 'ш',
        'shh' => 'щ',
        'je' => 'є',
        'ji' => 'ї',
        'ju' => 'ю',
        'ja' => 'я',
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'ґ',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'y' => 'и',
        'i' => 'і',
        'j' => 'й',  # Could also be ь
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
        'c' => 'ц',
        'ʹ' => '\'',
        '\'' => '\'',  # ASCII apostrophe
    );
}