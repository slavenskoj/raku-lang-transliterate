use Lang::Transliterate;

unit class Lang::Transliterate::Cu::ALALC does Lang::Transliterate::Transliterator;

# Church Slavonic ALA-LC (American Library Association - Library of Congress) Transliteration
# Based on: https://www.loc.gov/catdir/cpso/romanization/churchsl.pdf

my %base-mappings = (
    # Basic Cyrillic letters
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'e',      # Ukrainian Ye in Church Slavonic context
    'ж' => 'zh',
    'з' => 'z',
    'ѕ' => 'ż',      # Zelo
    'и' => 'i',
    'і' => 'i',      # Decimal I
    'ї' => 'i',      # Yi
    'й' => 'ĭ',      # Short I
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
    'ц' => 't͡s',    # with tie
    'ꙡ' => 't͡s',    # Reversed tse (Old Novgorodian, same as ц)
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sht',
    'ъ' => 'ʺ',      # Hard sign → double prime (U+02BA)
    'ы' => 'y',      # Primary form (alternative ȳ)
    'ь' => 'ʹ',      # Soft sign → prime (U+02B9)
    'ѣ' => 'ě',      # Yat
    'ю' => 'i͡u',    # with tie
    'я' => 'ja',     # Not shown in table but standard
    
    # Special Church Slavonic letters
    'ѡ' => 'ō',      # Omega (with macron)
    'ꙍ' => 'ō',      # Broad omega (with macron)
    'ѿ' => 'ō͡t',    # Ot ligature (with tie)
    'ᲂ' => 'o',      # Narrow o (U+1C82)
    'ᲂу' => 'u',     # Narrow o + u digraph
    'ᲈ' => 'ū',      # Unblended uk (U+1C88) - with macron like monograph
    'ѻ' => 'o',      # Broad o (word initial)
    'ꚛ' => 'o',      # Crossed o (for окрестъ, округъ)
    'ꙩ' => 'o',      # Monocular o / eyed o (for око)
    'ꙫ' => 'o',      # Binocular o variant 1
    'ꙭ' => 'o',      # Binocular o variant 2
    'ꙮ' => 'o',      # Multiocular o (for многоочитый)
    'оу' => 'u',     # Uk digraph (recommended Unicode composition)
    'Оу' => 'U',     # Uk digraph uppercase
    'ОУ' => 'U',     # Uk digraph all caps
    'ѹ' => 'u',      # Deprecated uk ligature (U+0479)
    'Ѹ' => 'U',      # Deprecated uk ligature capital (U+0478)
    'ꙋ' => 'ū',      # Monograph uk (with macron)
    'Ꙋ' => 'Ū',      # Monograph uk capital (with macron)
    
    # Iotated letters
    'ꙗ' => 'i͡a',    # Iotated A (with tie)
    'ѥ' => 'i͡e',    # Iotated E (with tie)
    
    # Yuses
    'ѧ' => 'ę',      # Small yus
    'ѩ' => 'i͡ę',    # Iotified small yus (with tie)
    'ѫ' => 'ǫ',      # Big yus
    'ѭ' => 'i͡ǫ',    # Iotified big yus (with tie)
    
    # Greek-derived letters
    'ѯ' => 'k͡s',    # Ksi (with tie)
    'ѱ' => 'p͡s',    # Psi (with tie)
    'ѳ' => 'ḟ',      # Fita (f with dot above)
    'ѵ' => 'ẏ',      # Izhitsa (y with dot above, alternative v̇)
    
    # Rare/variant forms
    'ѻ' => 'o',      # Round omega
    'ꙑ' => 'y',      # Alternative form of yery
    'ѷ' => 'ẏ',      # Izhitsa with diaeresis
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Church Slavonic ALA-LC reverse mappings
    return (
        # Multi-character with ties first
        'i͡a' => 'ꙗ',
        'i͡e' => 'ѥ',
        'i͡u' => 'ю',
        'i͡ę' => 'ѩ',
        'i͡ǫ' => 'ѭ',
        'k͡s' => 'ѯ',
        'p͡s' => 'ѱ',
        't͡s' => 'ц',
        'ō͡t' => 'ѿ',
        
        # Multi-character without ties
        'zh' => 'ж',
        'kh' => 'х',
        'ch' => 'ч',
        'sh' => 'ш',
        'sht' => 'щ',
        'ja' => 'я',
        
        # Characters with diacritics
        'ż' => 'ѕ',
        'ĭ' => 'й',
        'ě' => 'ѣ',
        'ō' => 'ѡ',
        'ū' => 'ꙋ',
        'ę' => 'ѧ',
        'ǫ' => 'ѫ',
        'ḟ' => 'ѳ',
        'ẏ' => 'ѵ',
        'ȳ' => 'ы',      # Alternative for yery
        'v̇' => 'ѵ',      # Alternative for izhitsa
        
        # Modifier letters
        'ʺ' => 'ъ',      # Double prime
        'ʹ' => 'ь',      # Prime
        '″' => 'ъ',      # Alternative double prime
        '′' => 'ь',      # Alternative prime
        '\'' => 'ь',     # Apostrophe as alternative
        
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
        'y' => 'ы',      # Primary mapping for y
    );
}