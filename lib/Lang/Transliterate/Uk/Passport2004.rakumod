use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::Passport2004 does Lang::Transliterate::Transliterator;

# Ukrainian Passport system 2004
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',      # Also 'w' in some cases
    'г' => 'h',      # Also 'g' in some cases
    'ґ' => 'g',      # Also 'h' in some cases
    'д' => 'd',
    'е' => 'e',
    'є' => 'ie',     # 'ye' at beginning of word
    'ж' => 'zh',     # Also 'j' in some cases
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'i',      # 'yi' at beginning of word
    'й' => 'i',      # 'y' at beginning of word
    'к' => 'k',      # Also 'c' in some cases
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
    'ь' => '',       # Soft sign represented by apostrophe
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
        
        # Context-dependent rules for word-initial positions
        if self!is-word-initial($i, @chars) {
            given $lower {
                when 'є' { $result ~= self!preserve-case($char, 'ye'); $found = True; }
                when 'ї' { $result ~= self!preserve-case($char, 'yi'); $found = True; }
                when 'й' { $result ~= self!preserve-case($char, 'y'); $found = True; }
                when 'ю' { $result ~= self!preserve-case($char, 'yu'); $found = True; }
                when 'я' { $result ~= self!preserve-case($char, 'ya'); $found = True; }
            }
        }
        
        unless $found {
            if %base-mappings{$lower}:exists {
                my $mapped = %base-mappings{$lower};
                if $mapped && $lower eq 'ь' {
                    # Soft sign represented as apostrophe in some contexts
                    $result ~= "'";
                } else {
                    $result ~= self!preserve-case($char, $mapped);
                }
            } else {
                $result ~= $char;
            }
        }
        
        $i++;
    }
    
    return $result;
}

method !is-word-initial(Int $pos, @chars --> Bool) {
    return $pos == 0 || (@chars[$pos - 1] ~~ /\s/ || @chars[$pos - 1] ~~ /\W/);
}

method !preserve-case(Str $original, Str $replacement --> Str) {
    return $original ~~ /<:Lu>/ ?? $replacement.tc !! $replacement;
}

method get-reverse-mappings(--> List) {
    # Ukrainian Passport 2004 reverse mapping
    return (
        # Multi-character mappings first
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
        'w' => 'в',
        'h' => 'г',
        'g' => 'ґ',  # Could also be г
        'd' => 'д',
        'e' => 'е',
        'ie' => 'є',
        'j' => 'ж',
        'z' => 'з',
        'y' => 'и',  # Could also be й
        'i' => 'і',  # Could also be ї, й
        'k' => 'к',
        'c' => 'к',
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
        "'" => 'ь',
    );
}