use Lang::Transliterate;

unit class Lang::Transliterate::Ru::Passport2000 does Lang::Transliterate::Transliterator;

# Driver's License system (Приказ МВД № 782, 2000—2015) Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin Driver's License (2000-2015)
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Note: 'ye' at start of words and after vowels, Ь, Ъ
    'ё' => 'e',      # Note: context-dependent - 'e' after Ч,Ш,Щ,Ж; 'yo' at start/after vowels; 'ye' after other consonants  
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',      # Note: 'yi' after Ь
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
    'ъ' => "'",      # Apostrophe
    'ы' => 'y',
    'ь' => "'",      # Apostrophe
    'э' => 'e',
    'ю' => 'yu',
    'я' => 'ya',
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ye',     # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Override default to implement Driver's License (2000-2015) context-dependent rules
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        my $lower = $char.lc;
        my $found = False;
        
        # Context-dependent rules for Driver's License (2000-2015)
        given $lower {
            when 'е' {
                # 'ye' at start of words and after vowels, Ь, Ъ
                if $i == 0 || self!is-vowel(@chars[$i - 1]) || @chars[$i - 1].lc ~~ any(<ь ъ>) {
                    $result ~= self!preserve-case($char, 'ye');
                } else {
                    $result ~= self!preserve-case($char, 'e');
                }
                $found = True;
            }
            when 'ё' {
                my $prev-char = $i > 0 ?? @chars[$i - 1].lc !! '';
                
                # Context-dependent: 'e' after Ч,Ш,Щ,Ж; 'yo' at start/after vowels; 'ye' after other consonants
                if $prev-char ~~ any(<ч ш щ ж>) {
                    $result ~= self!preserve-case($char, 'e');
                } elsif $i == 0 || self!is-vowel(@chars[$i - 1]) || $prev-char ~~ any(<ь ъ>) {
                    $result ~= self!preserve-case($char, 'yo');
                } else {
                    $result ~= self!preserve-case($char, 'ye');
                }
                $found = True;
            }
            when 'и' {
                # 'yi' after Ь
                if $i > 0 && @chars[$i - 1].lc eq 'ь' {
                    $result ~= self!preserve-case($char, 'yi');
                } else {
                    $result ~= self!preserve-case($char, 'i');
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

method !is-vowel(Str $char --> Bool) {
    my $lower = $char.lc;
    return $lower ~~ any(<а е ё и о у ы э ю я a e i o u>);
}

method !preserve-case(Str $original, Str $replacement --> Str) {
    return $original ~~ /<:Lu>/ ?? $replacement.tc !! $replacement;
}

method get-reverse-mappings(--> List) {
    # Driver's License (2000-2015) reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ё, э
        'ye' => 'е',     # Alternative form
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',
        'yi' => 'и',     # Alternative after Ь
        'y' => 'й',      # Could also be ы
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
        "'" => 'ъ',      # Could also be ь
        'yu' => 'ю',
        'ya' => 'я',
    );
}