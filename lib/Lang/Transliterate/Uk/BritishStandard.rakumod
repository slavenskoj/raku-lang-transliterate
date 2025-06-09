use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::BritishStandard does Lang::Transliterate::Transliterator;

# Ukrainian British Standard
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'ye',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'ȳ',
    'і' => 'i',
    'ї' => 'yi',
    'й' => 'ĭ',
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
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'yu',
    'я' => 'ya',
    "'" => 'ˮ',      # Hard sign
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
        
        # Special handling for тс sequence (t-s, not ts)
        if $lower eq 'т' && $i + 1 < @chars.elems && @chars[$i + 1].lc eq 'с' {
            $result ~= self!preserve-case($char, 't', $i, @chars);
            $result ~= '-';
            $result ~= self!preserve-case(@chars[$i + 1], 's', $i, @chars);
            $i += 2;
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
    # Ukrainian British Standard reverse mapping
    return (
        # Multi-character mappings first
        't-s' => 'тс',
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'ye' => 'є',
        'yi' => 'ї',
        'yu' => 'ю',
        'ya' => 'я',
        # Special characters
        'ȳ' => 'и',
        'ĭ' => 'й',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ˮ' => "'",
        '"' => "'",  # ASCII quote for hard sign
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'і',
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
    );
}