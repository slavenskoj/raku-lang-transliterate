use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::National1996 does Lang::Transliterate::Transliterator;

# Ukrainian National system 1996
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',      # 'gh' in зг combination
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
    'щ' => 'sch',
    'ь' => 'ʹ',      # Soft sign as modifier letter prime
    'ю' => 'iu',     # 'yu' at beginning of word
    'я' => 'ia',     # 'ya' at beginning of word
    "'" => 'ˮ',      # Apostrophe as modifier letter double apostrophe
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
            $result ~= self!preserve-case($char, 'z');
            $result ~= self!preserve-case(@chars[$i + 1], 'gh');
            $i += 2;
            $found = True;
        }
        # Context-dependent rules for word-initial positions
        elsif self!is-word-initial($i, @chars) {
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
                $result ~= self!preserve-case($char, %base-mappings{$lower});
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
    # Ukrainian National 1996 reverse mapping
    return (
        # Multi-character mappings first
        'zgh' => 'зг',
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'sch' => 'щ',
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
        'i' => 'і',  # Could also be ї, й
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
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ˮ' => "'",
        '"' => "'",  # ASCII quote for apostrophe
    );
}