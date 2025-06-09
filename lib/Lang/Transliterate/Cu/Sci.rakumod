use Lang::Transliterate;

unit class Lang::Transliterate::Cu::Sci does Lang::Transliterate::Transliterator;

# Church Slavonic Scientific Transliteration
# Based on the scientific transliteration standard

my %base-mappings = (
    # Basic Cyrillic letters
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Note: є also maps to 'e' in Church Slavonic
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
    'і' => 'i',      # Both и and і map to 'i'
    'ї' => 'i',      # Also maps to 'i' in Church Slavonic
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
    'х' => 'x',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'št',
    'ъ' => 'ъ',      # Keep as is (with alternative ǔ)
    'ы' => 'y',      # Primary mapping (with alternative ū)
    'ь' => 'ь',      # Keep as is (with alternative ǐ)
    'ѣ' => 'ě',      # Yat
    'ю' => 'ju',
    'я' => 'ja',
    
    # Special Church Slavonic letters
    'є' => 'e',      # Ukrainian Ye in Church Slavonic context
    'ѕ' => 'ʒ',      # Zelo (with alternative 'dz')
    'ћ' => 'ǵ',      # Tshe
    'ѡ' => 'o',      # Omega (with alternative ô)
    'оу' => 'u',     # Uk digraph
    'ꙋ' => 'u',      # Monograph uk
    
    # Yuses
    'ѧ' => 'ę',      # Small yus
    'ѩ' => 'ję',     # Iotified small yus
    'ѫ' => 'ǫ',      # Big yus
    'ѭ' => 'jǫ',     # Iotified big yus
    
    # Greek-derived letters
    'ѯ' => 'ks',     # Ksi
    'ѱ' => 'ps',     # Psi
    'ѳ' => 'th',     # Fita (with alternative θ)
    'ѵ' => 'ü',      # Izhitsa
    
    # Additional iotated letters
    'ѥ' => 'je',     # Iotated E
    'ꙗ' => 'ja',     # Iotated A
    
    # Rare/variant forms
    'ѿ' => 'ot',     # Ot ligature
    'ѻ' => 'o',      # Round omega
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Church Slavonic Scientific reverse mappings
    return (
        # Multi-character mappings first
        'ję' => 'ѩ',
        'jǫ' => 'ѭ',
        'ju' => 'ю',
        'ja' => 'я',     # Primary mapping for ja
        'je' => 'є',     # Primary mapping for je (could also be ѥ)
        'ks' => 'ѯ',
        'ps' => 'ѱ',
        'th' => 'ѳ',
        'št' => 'щ',
        'ot' => 'ѿ',
        
        # Diacritical and special characters
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ě' => 'ѣ',
        'ę' => 'ѧ',
        'ǫ' => 'ѫ',
        'ʒ' => 'ѕ',
        'ǵ' => 'ћ',
        'ü' => 'ѵ',
        'θ' => 'ѳ',      # Alternative for th
        'ô' => 'ѡ',      # Alternative mapping for omega
        'dz' => 'ѕ',     # Alternative for zelo
        'ǔ' => 'ъ',      # Alternative for hard sign
        'ū' => 'ы',      # Alternative for yery
        'ǐ' => 'ь',      # Alternative for soft sign
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',      # Primary mapping for i
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',      # Primary mapping for o
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',
        'u' => 'у',      # Primary mapping for u
        'f' => 'ф',
        'x' => 'х',
        'c' => 'ц',
        'y' => 'ы',
        'ъ' => 'ъ',      # Direct mapping
        'ь' => 'ь',      # Direct mapping
    );
}