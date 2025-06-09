use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::BGNPCGN does Lang::Transliterate::Transliterator;

# Ukrainian BGN/PCGN 1965 (superseded by Ukrainian National system in 2020)
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
    'и' => 'y',
    'і' => 'i',
    'ї' => 'yi',
    'й' => 'y',
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
        
        # Handle special sequences with midpoint notation
        # зг = z·h, кг = k·h, сг = s·h, тс = t·s, цг = ts·h
        if $i + 1 < @chars.elems {
            my $next = @chars[$i + 1].lc;
            if ($lower eq 'з' && $next eq 'г') || 
               ($lower eq 'к' && $next eq 'г') ||
               ($lower eq 'с' && $next eq 'г') ||
               ($lower eq 'т' && $next eq 'с') ||
               ($lower eq 'ц' && $next eq 'г') {
                my $mapping = %base-mappings{$lower};
                $result ~= self!preserve-case($char, $mapping);
                $result ~= '·';
                $i++;
                $found = True;
            }
        }
        
        unless $found {
            if %base-mappings{$lower}:exists {
                $result ~= self!preserve-case($char, %base-mappings{$lower});
            } else {
                $result ~= $char;
            }
        }
        
        $i++;
    }
    
    return $result;
}

method !preserve-case(Str $original, Str $replacement --> Str) {
    return $original ~~ /<:Lu>/ ?? $replacement.tc !! $replacement;
}

method get-reverse-mappings(--> List) {
    # Ukrainian BGN/PCGN reverse mapping
    return (
        # Multi-character mappings first
        'z·h' => 'зг',
        'k·h' => 'кг',
        's·h' => 'сг',
        't·s' => 'тс',
        'ts·h' => 'цг',
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
        'y' => 'и',  # Could also be й
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