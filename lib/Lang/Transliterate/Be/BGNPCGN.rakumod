use Lang::Transliterate;

unit class Lang::Transliterate::Be::BGNPCGN does Lang::Transliterate::Transliterator;

# Belarusian BGN/PCGN Romanization (1979)
# Board on Geographic Names / Permanent Committee on Geographical Names
my %base-mappings = (
    # Belarusian Cyrillic to Latin BGN/PCGN
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',  # Ge with upturn (not standard Belarusian)
    'д' => 'd',
    'е' => 'ye',
    'ё' => 'yo',
    'ж' => 'zh',
    'з' => 'z',
    'і' => 'i',
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
    'тс' => 't·s',  # t + middle dot + s
    'у' => 'u',
    'ў' => 'w',
    'ф' => 'f',
    'х' => 'kh',
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'ы' => 'y',
    'ь' => 'ʹ',  # U+02B9 MODIFIER LETTER PRIME
    'э' => 'e',
    'ю' => 'yu',
    'я' => 'ya',
    'ʼ' => 'ʺ',  # U+02BA MODIFIER LETTER DOUBLE PRIME (for apostrophe)
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # BGN/PCGN reverse mappings
    return (
        # Multi-character mappings first
        't·s' => 'тс',
        'ye' => 'е',
        'yo' => 'ё',
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'yu' => 'ю',
        'ya' => 'я',
        
        # Modifier letters
        'ʹ' => 'ь',
        'ʺ' => 'ʼ',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
        'd' => 'д',
        'e' => 'э',
        'z' => 'з',
        'i' => 'і',
        'y' => 'й',  # Note: 'y' maps to both 'й' and 'ы'
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
        'w' => 'ў',
        'f' => 'ф',
    );
}