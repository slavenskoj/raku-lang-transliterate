use Lang::Transliterate;

unit class Lang::Transliterate::Ru::HarvardKyoto does Lang::Transliterate::Transliterator;

# Harvard-Kyoto method for modern Russian language
# From Wikipedia: maintains Russian orthography with single letter correspondence
# No diacritical signs needed, prevents digraph confusion
my %base-mappings = (
    # Russian Cyrillic to Latin Harvard-Kyoto
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # automatically palatalizes previous consonant; iotated at beginning/after vowel
    'ё' => 'O',      # iotated ⟨o⟩; automatically palatalizes previous consonant
    'ж' => 'Z',      # romanized slavic ⟨ž⟩
    'з' => 'z',
    'и' => 'i',      # automatically palatalizes previous consonant
    'й' => 'Y',      # iot, treated as consonant
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
    'х' => 'h',      # thick as Spanish "México"
    'ц' => 'c',      # traditionally Latin ⟨c⟩, Russian "це" (tse)
    'ч' => 'C',      # ch
    'ш' => 'S',      # sh
    'щ' => 'T',      # palatalized form of ⟨sh⟩
    'ъ' => 'J',      # hard sign - disjuncts word, forces next vowel to be iotated
    'ы' => 'I',      # wide, open ⟨i⟩ or ⟨u⟩; IPA ⟨ɨ⟩
    'ь' => 'j',      # soft sign - palatalizes previous consonant
    'э' => 'E',      # wide, open ⟨e⟩
    'ю' => 'U',      # iotated ⟨u⟩; automatically palatalizes previous consonant
    'я' => 'A',      # iotated ⟨a⟩; automatically palatalizes previous consonant
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'e',      # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # Note: H-K doesn't preserve case, but framework handles capitalization
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Harvard-Kyoto uses specific uppercase letters for specific sounds
    # We need to handle Russian uppercase by using the circumflex (^) notation
    # ^b = Б, but ё always maps to O regardless of case
    
    my $result = '';
    my @chars = $text.comb;
    
    for @chars -> $char {
        my $lower = $char.lc;
        
        if %base-mappings{$lower}:exists {
            my $hk-char = %base-mappings{$lower};
            
            # Check if original was uppercase
            if $char ~~ /<:Lu>/ {
                # Special cases: these letters use specific uppercase in H-K system
                given $lower {
                    when any(<ё ж й ч ш щ ъ ы э ю я>) {
                        # These map to specific uppercase letters in H-K, use ^
                        $result ~= "^$hk-char";
                    }
                    default {
                        # Regular letters: if they map to lowercase, add ^
                        if $hk-char ~~ /<:Ll>/ {
                            $result ~= "^$hk-char";
                        } else {
                            # Already uppercase in mapping, add ^
                            $result ~= "^$hk-char";
                        }
                    }
                }
            } else {
                # Apply H-K mapping directly for lowercase
                $result ~= $hk-char;
            }
        } else {
            # Keep non-Cyrillic characters as-is
            $result ~= $char;
        }
    }
    
    return $result;
}

method get-reverse-mappings(--> List) {
    # Harvard-Kyoto reverse mapping with circumflex support
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ѣ
        'O' => 'ё',      # Uppercase O specifically for ё
        'Z' => 'ж',      # Uppercase Z specifically for ж
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
        'Y' => 'й',      # Uppercase Y specifically for й
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
        'h' => 'х',
        'c' => 'ц',
        'C' => 'ч',      # Uppercase C specifically for ч
        'S' => 'ш',      # Uppercase S specifically for ш
        'T' => 'щ',      # Uppercase T specifically for щ
        'J' => 'ъ',      # Uppercase J specifically for ъ
        'I' => 'ы',      # Uppercase I specifically for ы
        'j' => 'ь',      # Lowercase j specifically for ь
        'E' => 'э',      # Uppercase E specifically for э
        'U' => 'ю',      # Uppercase U specifically for ю
        'A' => 'я',      # Uppercase A specifically for я
        
        # Circumflex notation for uppercase letters
        '^a' => 'А',
        '^b' => 'Б',
        '^v' => 'В',
        '^g' => 'Г',
        '^d' => 'Д',
        '^e' => 'Е',
        '^O' => 'Ё',     # ^O for uppercase Ё
        '^Z' => 'Ж',     # ^Z for uppercase Ж
        '^z' => 'З',
        '^i' => 'И',
        '^Y' => 'Й',     # ^Y for uppercase Й
        '^k' => 'К',
        '^l' => 'Л',
        '^m' => 'М',
        '^n' => 'Н',
        '^o' => 'О',
        '^p' => 'П',
        '^r' => 'Р',
        '^s' => 'С',
        '^t' => 'Т',
        '^u' => 'У',
        '^f' => 'Ф',
        '^h' => 'Х',
        '^c' => 'Ц',
        '^C' => 'Ч',     # ^C for uppercase Ч
        '^S' => 'Ш',     # ^S for uppercase Ш
        '^T' => 'Щ',     # ^T for uppercase Щ
        '^J' => 'Ъ',     # ^J for uppercase Ъ
        '^I' => 'Ы',     # ^I for uppercase Ы
        '^j' => 'Ь',     # ^j for uppercase Ь
        '^E' => 'Э',     # ^E for uppercase Э
        '^U' => 'Ю',     # ^U for uppercase Ю
        '^A' => 'Я',     # ^A for uppercase Я
    );
}