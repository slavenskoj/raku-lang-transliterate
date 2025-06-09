use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::ALALCModified does Lang::Transliterate::Transliterator;

# Ukrainian Modified Library of Congress (for personal and place names)
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'ie',     # 'ye' at beginning of word
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'i',
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
        
        # Context-dependent rules for word-initial positions
        if self!is-word-initial($i, @chars) {
            given $lower {
                when 'є' { $result ~= self!preserve-case($char, 'ye'); $found = True; }
                when 'й' { $result ~= self!preserve-case($char, 'y'); $found = True; }
                when 'ю' { $result ~= self!preserve-case($char, 'yu'); $found = True; }
                when 'я' { $result ~= self!preserve-case($char, 'ya'); $found = True; }
            }
        }
        # Special handling for surname endings
        elsif $i >= 2 && @chars[$i - 2].lc ne 'і' && @chars[$i - 1].lc ~~ /[иі]/ && $lower eq 'й' && $i == @chars.elems - 1 {
            # Surname endings -ий and -ій simplified to -y
            $result = $result.substr(0, * - 1) ~ 'y';
            $found = True;
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
    # Ukrainian Modified ALA-LC reverse mapping
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
        'yu' => 'ю',
        'ya' => 'я',
        # Regular mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
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
    );
}