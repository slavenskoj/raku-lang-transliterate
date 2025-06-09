use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Ru::MVD995_2015 does Lang::Transliterate::Transliterator;

# Driver's License system (Приказ МВД № 995, с 2015) Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin Driver's License (с 2015)
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Note: 'ye' after Ь
    'ё' => 'e',      # Note: 'ye' after Ь
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'i',      # Different from 2000 version
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
    'ъ' => 'ie',     # Different from 2000 version
    'ы' => 'y',
    'ь' => '',       # Not defined in standard
    'э' => 'e',
    'ю' => 'iu',     # Different from 2000 version
    'я' => 'ia',     # Different from 2000 version
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ie',     # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Override default to implement Driver's License (с 2015) context-dependent rules
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        my $lower = $char.lc;
        my $found = False;
        
        # Context-dependent rules for Driver's License (с 2015)
        given $lower {
            when 'е' {
                # 'ye' after Ь
                if $i > 0 && @chars[$i - 1].lc eq 'ь' {
                    $result ~= self!preserve-case($char, 'ye');
                } else {
                    $result ~= self!preserve-case($char, 'e');
                }
                $found = True;
            }
            when 'ё' {
                # 'ye' after Ь, otherwise 'e'
                if $i > 0 && @chars[$i - 1].lc eq 'ь' {
                    $result ~= self!preserve-case($char, 'ye');
                } else {
                    $result ~= self!preserve-case($char, 'e');
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
    # Driver's License (с 2015) reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ё, э
        'ye' => 'е',     # Alternative after Ь
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be й
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
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'ie' => 'ъ',     # Could also be ѣ
        'y' => 'ы',
        'iu' => 'ю',
        'ia' => 'я',
    );
}