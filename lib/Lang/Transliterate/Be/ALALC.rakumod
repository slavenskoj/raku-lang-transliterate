use Lang::Transliterate;

unit class Lang::Transliterate::Be::ALALC does Lang::Transliterate::Transliterator;

# Belarusian ALA-LC Romanization
# American Library Association - Library of Congress
my %base-mappings = (
    # Belarusian Cyrillic to Latin ALA-LC
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',  # Ge with upturn (not standard Belarusian)
    'д' => 'd',
    'е' => 'e',
    'ё' => 'i͡o',  # i with combining double breve + o
    'ж' => 'z͡h',  # z with combining double breve + h
    'з' => 'z',
    'і' => 'i',
    'й' => 'ĭ',
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
    'ў' => 'ŭ',  # u with breve
    'ф' => 'f',
    'х' => 'kh',
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'ы' => 'y',
    'ь' => 'ʹ',  # U+02B9 MODIFIER LETTER PRIME
    'э' => 'ė',
    'ю' => 'i͡u',  # i with combining double breve + u
    'я' => 'i͡a',  # i with combining double breve + a
    'ʼ' => '',  # apostrophe (not shown in system)
    
    # Historical letters
    'и' => 'ī',
    'щ' => 'shch',
    'ъ' => 'ʺ',  # U+02BA MODIFIER LETTER DOUBLE PRIME
    'ѣ' => 'ě',  # yat
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ALA-LC reverse mappings
    # Multi-character mappings must come first
    return (
        # Complex mappings first
        'i͡o' => 'ё',
        'z͡h' => 'ж',
        'i͡u' => 'ю',
        'i͡a' => 'я',
        
        # Multi-character mappings
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        
        # Diacritical marks
        'ĭ' => 'й',
        'ŭ' => 'ў',
        'ė' => 'э',
        'ī' => 'и',
        'ě' => 'ѣ',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII alternative for soft sign
        'ʺ' => 'ъ',
        '"' => 'ъ',  # ASCII alternative for hard sign
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'і',
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
        'y' => 'ы',
    );
}