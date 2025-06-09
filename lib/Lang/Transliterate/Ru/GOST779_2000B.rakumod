use Lang::Transliterate;

unit class Lang::Transliterate::Ru::GOST779_2000B does Lang::Transliterate::Transliterator;

# ISO 9:1995, ГОСТ 7.79—2000 System B Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin ISO 9:1995 System B
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'yo',     # Different from System A
    'ж' => 'zh',     # Different from System A
    'з' => 'z',
    'и' => 'i',
    'й' => 'j',
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
    'х' => 'x',      # Different from System A
    'ц' => 'cz',     # Different from System A - note: 'c' before e,i,y,j
    'ч' => 'ch',     # Different from System A
    'ш' => 'sh',     # Different from System A
    'щ' => 'shh',    # Different from System A
    'ъ' => '‶',      # Different character than System A
    'ы' => 'y‵',     # With prime mark
    'ь' => '‵',      # Different character than System A
    'э' => 'e‵',     # With prime mark
    'ю' => 'yu',     # Different from System A
    'я' => 'ya',     # Different from System A
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ě',      # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Override default to implement GOST 7.79-2000 System B context-dependent rules
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        my $lower = $char.lc;
        my $found = False;
        
        # Context-dependent rules for GOST 7.79-2000 System B
        given $lower {
            when 'ц' {
                # Рекомендуется использовать 'c' перед буквами e, i, y, j; и 'cz' — в остальных случаях
                my $next-char = ($i + 1 < @chars.elems) ?? @chars[$i + 1].lc !! '';
                if $next-char ~~ any(<e i y j>) {
                    $result ~= self!preserve-case($char, 'c');
                } else {
                    $result ~= self!preserve-case($char, 'cz');
                }
                $found = True;
            }
            default {
                # Use standard mapping
                if %base-mappings{$lower}:exists {
                    $result ~= self!preserve-case($char, %base-mappings{$lower});
                    $found = True;
                }
            }
        }
        
        unless $found {
            $result ~= $char;
        }
        $i++;
    }
    
    return $result;
}

method !preserve-case(Str $original, Str $replacement --> Str) {
    return $original ~~ /<:Lu>/ ?? $replacement.tc !! $replacement;
}

method get-reverse-mappings(--> List) {
    # ISO 9:1995 System B reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'yo' => 'ё',
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',
        'j' => 'й',
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
        'x' => 'х',
        'cz' => 'ц',
        'c' => 'ц',     # Alternative before e,i,y,j
        'ch' => 'ч',
        'sh' => 'ш',
        'shh' => 'щ',
        '‶' => 'ъ',
        'y‵' => 'ы',
        '‵' => 'ь',
        'e‵' => 'э',
        'yu' => 'ю',
        'ya' => 'я',
        'ě' => 'ѣ',
    );
}