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
    'й' => 'j',      # Short I
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
    'х' => 'x',      # Primary: x, alternative: ch
    'ц' => 'c',
    'ꙡ' => 'c',      # Reversed tse (Old Novgorodian, same as ц)
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'št',
    'ъ' => 'ъ',      # Keep as is (alternatives: ǔ, ŏ, ŭ)
    'ы' => 'y',      # Primary: y, alternative: ū
    'ь' => 'ь',      # Keep as is (alternatives: ǐ, ĕ, ĭ)
    'ѣ' => 'ě',      # Yat
    'ю' => 'ju',     # Primary: ju, alternative: û
    'я' => 'ja',     # Primary: ja, alternative: â
    
    # Special Church Slavonic letters
    'є' => 'e',      # Ukrainian Ye in Church Slavonic context
    'ѕ' => 'ʒ',      # Zelo (alternative: dz)
    'ћ' => 'ǵ',      # Tshe
    'ѡ' => 'o',      # Omega (alternative: ô, ō)
    'ꙍ' => 'o',      # Broad omega (U+A64D)
    'ᲂ' => 'o',      # Narrow o (U+1C82)
    'ᲂу' => 'u',     # Narrow o + u digraph
    'ᲈ' => 'u',      # Unblended uk (U+1C88)
    'ѻ' => 'o',      # Broad o (word initial)
    'ꚛ' => 'o',      # Crossed o (for окрестъ, округъ)
    'ꙩ' => 'o',      # Monocular o / eyed o (for око)
    'ꙫ' => 'o',      # Binocular o variant 1
    'ꙭ' => 'o',      # Binocular o variant 2
    'ꙮ' => 'o',      # Multiocular o (for многоочитый)
    'оу' => 'u',     # Uk digraph (recommended Unicode composition)
    'Оу' => 'U',     # Uk digraph uppercase
    'ОУ' => 'U',     # Uk digraph all caps
    'ꙋ' => 'u',      # Monograph uk (U+A64B)
    'Ꙋ' => 'U',      # Monograph uk capital (U+A64A)
    
    # Variant forms of basic letters
    'ꙃ' => 'dz',     # Early form of zelo
    'ꙁ' => 'z',      # Early form of з
    'ѹ' => 'u',      # Deprecated uk ligature (U+0479)
    'Ѹ' => 'U',      # Deprecated uk ligature capital (U+0478)
    'оѵ' => 'u',     # Uk digraph with izhitsa
    
    # Yuses and their variants
    'ѧ' => 'ę',      # Little yus
    'ѩ' => 'ję',     # Iotified little yus
    'ѫ' => 'ǫ',      # Big yus
    'ѭ' => 'jǫ',     # Iotified big yus
    'ꙛ' => 'ǫ',      # Blended yus
    'ꙙ' => 'ę',      # Closed little yus
    'ꙝ' => 'ję',     # Iotated closed little yus
    
    # Various forms of yery
    'ꙑ' => 'y',      # Alternative form of yery
    'ъї' => 'y',     # Yery ligature
    'ъи' => 'y',     # Yery ligature
    'ьї' => 'y',     # Yery ligature
    'ьи' => 'y',     # Yery ligature
    
    # Greek-derived letters
    'ѯ' => 'ks',     # Ksi (alternative: ξ)
    'ѱ' => 'ps',     # Psi (alternative: ψ)
    'ѳ' => 'th',     # Fita (alternatives: θ, t, f, ph)
    'ѵ' => 'ü',      # Izhitsa (alternatives: y, i, v)
    'ѷ' => 'ü',      # Izhitsa with diaeresis
    
    # Additional iotated letters
    'ѥ' => 'je',     # Iotated E
    'ꙗ' => 'ja',     # Iotated A
    
    # Rare/variant forms
    'ѿ' => 'ot',     # Ot ligature (alternative: ōt)
    'ѻ' => 'o',      # Round omega
    'ҁ' => 'ҁ',      # Koppa - no phonetic value, kept as is
    'ꙉ' => 'ǵ',      # Djerv - Serbian regional variant
    'ꙕ' => 'ju',     # Reversed yu - early variant
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
        'dz' => 'ꙃ',     # Maps to early form of zelo
        'ch' => 'х',     # Alternative for х
        'ōt' => 'ѿ',     # Alternative for ot ligature
        'ph' => 'ѳ',     # Alternative for fita
        
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
        
        # Alternative forms for yers
        'ǔ' => 'ъ',      # Alternative for hard sign
        'ŏ' => 'ъ',      # Alternative for hard sign
        'ŭ' => 'ъ',      # Alternative for hard sign
        'ǐ' => 'ь',      # Alternative for soft sign
        'ĕ' => 'ь',      # Alternative for soft sign
        'ĭ' => 'ь',      # Alternative for soft sign
        'ū' => 'ы',      # Alternative for yery
        
        # Alternative forms for other letters
        'ô' => 'ѡ',      # Alternative for omega
        'ō' => 'ѡ',      # Alternative for omega
        'û' => 'ю',      # Alternative for yu
        'â' => 'я',      # Alternative for ya
        
        # Greek letter alternatives
        'θ' => 'ѳ',      # Greek theta
        'ξ' => 'ѯ',      # Greek xi
        'ψ' => 'ѱ',      # Greek psi
        'υ' => 'ѵ',      # Greek upsilon
        'ω' => 'ѡ',      # Greek omega
        'ϙ' => 'ҁ',      # Greek koppa
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',      # Primary mapping for i
        'j' => 'й',      # Short i
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',      # Primary mapping for o
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',      # Note: in some contexts could be ѳ
        'u' => 'у',      # Primary mapping for u
        'f' => 'ф',      # Note: in some contexts could be ѳ
        'x' => 'х',
        'c' => 'ц',
        'y' => 'ы',      # Note: in some contexts could be ѵ
        'ъ' => 'ъ',      # Direct mapping
        'ь' => 'ь',      # Direct mapping
    );
}