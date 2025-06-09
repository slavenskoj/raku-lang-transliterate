use Lang::Transliterate;

unit class Lang::Transliterate::Be::BritishStandard does Lang::Transliterate::Transliterator;

# Belarusian British Standard 2979:1958
# Diacritics may be omitted when back-transliteration is not required
my %base-mappings = (
    # Belarusian Cyrillic to Latin British Standard
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',  # Ge with upturn (not standard Belarusian)
    'д' => 'd',
    'е' => 'e',
    'ё' => 'ë',
    'ж' => 'zh',
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
    'тс' => 't-s',  # special digraph
    'у' => 'u',
    'ў' => 'w',
    'ф' => 'f',
    'х' => 'kh',
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'ы' => 'ȳ',
    'ь' => 'ʼ',  # U+02BC MODIFIER LETTER APOSTROPHE
    'э' => 'é',
    'ю' => 'yu',
    'я' => 'ya',
    'ʼ' => 'ˮ',  # U+02EE MODIFIER LETTER DOUBLE APOSTROPHE
    
    # Historical letters
    'ъ' => 'ˮ',  # U+02EE MODIFIER LETTER DOUBLE APOSTROPHE
    'ѣ' => 'ê',  # yat
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # British Standard reverse mappings
    return (
        # Multi-character mappings first
        't-s' => 'тс',
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'yu' => 'ю',
        'ya' => 'я',
        
        # Diacritical marks
        'ë' => 'ё',
        'ĭ' => 'й',
        'ȳ' => 'ы',
        'é' => 'э',
        'ê' => 'ѣ',
        'ˮ' => 'ʼ',  # could also be ъ
        'ʼ' => 'ь',
        
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
        'w' => 'ў',
        'f' => 'ф',
    );
}