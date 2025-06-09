use Lang::Transliterate;

unit class Lang::Transliterate::Ru::YandexMaps does Lang::Transliterate::Transliterator;

# Yandex Maps transliteration system
# Based on https://iuliia.ru/yandex-maps/
# Used by Yandex Maps for geographic names and addresses
my %base-mappings = (
    # Russian Cyrillic to Latin Yandex Maps
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Context-dependent: ye/e
    'ё' => 'yo',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
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
    'щ' => 'sch',
    'ъ' => '',       # Generally omitted
    'ы' => 'y',      # Exception: -ый endings
    'ь' => '',       # Soft sign omitted
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

method !is-vowel(Str $char --> Bool) {
    return so $char ~~ /<[аеёиоуыэюяaeiouy]>/;
}

method !preserve-case(Str $original, Str $replacement --> Str) {
    if $original ~~ /<:Lu>/ {
        return $replacement.tc;
    }
    return $replacement;
}

method transliterate-context-aware(Str $text --> Str) {
    # Yandex Maps has specific rules for е, ъ, and -ый endings
    
    my $result = '';
    my @chars = $text.comb;
    my $length = @chars.elems;
    
    loop (my $i = 0; $i < $length; $i++) {
        my $char = @chars[$i];
        my $lower = $char.lc;
        
        if %base-mappings{$lower}:exists {
            given $lower {
                when 'е' {
                    # е → ye at word start or after vowels, otherwise e
                    if $i == 0 || ($i > 0 && self!is-vowel(@chars[$i - 1].lc)) {
                        $result ~= self!preserve-case($char, 'ye');
                    } else {
                        $result ~= self!preserve-case($char, 'e');
                    }
                }
                when 'ъ' {
                    # ъ generally omitted, but ъе → ye
                    if $i + 1 < $length && @chars[$i + 1].lc eq 'е' {
                        # Handle ъе as ye combination
                        $result ~= self!preserve-case(@chars[$i + 1], 'ye');
                        $i++; # Skip the е since we handled it
                    }
                    # Otherwise ъ is omitted (empty string from mapping)
                }
                when 'ы' {
                    # Check for -ый ending: ый → iy
                    if $i + 1 < $length && @chars[$i + 1].lc eq 'й' {
                        # This is -ый ending, handle as -iy
                        $result ~= self!preserve-case($char, 'i');
                        # Skip the next й, we'll handle it here
                        $i++;
                        $result ~= self!preserve-case(@chars[$i], 'y');
                    } else {
                        # Regular ы → y
                        $result ~= self!preserve-case($char, 'y');
                    }
                }
                default {
                    # Apply regular mapping
                    my $mapping = %base-mappings{$lower};
                    if $mapping ne '' {
                        $result ~= self!preserve-case($char, $mapping);
                    }
                    # If mapping is empty string (ъ, ь), nothing is added
                }
            }
        } else {
            # Keep non-Cyrillic characters as-is
            $result ~= $char;
        }
    }
    
    return $result;
}

method get-reverse-mappings(--> List) {
    # Yandex Maps reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be э
        'ye' => 'е',     # Context-dependent form
        'yo' => 'ё',
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
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
        'f' => 'ф',      # Could also be ѳ
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'sch' => 'щ',
        'yu' => 'ю',
        'ya' => 'я',
        
        # Special case for -iy ending
        'iy' => 'ый',    # -ий ending reconstructed as -ый
    );
}