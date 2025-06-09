use Lang::Transliterate;

unit class Lang::Transliterate::Be::Sci does Lang::Transliterate::Transliterator;

# Belarusian Scientific Transliteration
my %base-mappings = (
    # Belarusian Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'ë',
    'ж' => 'ž',
    'з' => 'z',
    'і' => 'i',
    'й' => 'j',
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
    'ў' => 'ŭ',
    'ф' => 'f',
    'х' => 'x',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'ы' => 'y',
    'ь' => 'ʹ',  # U+02B9 MODIFIER LETTER PRIME
    'э' => 'è',
    'ю' => 'ju',
    'я' => 'ja',
    'ʼ' => 'ʼ',
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Scientific transliteration has some ambiguities
    # This provides a best-effort reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
        'd' => 'д',
        'e' => 'е',
        'ë' => 'ё',
        'ž' => 'ж',
        'z' => 'з',
        'i' => 'і',
        'j' => 'й',
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
        'ŭ' => 'ў',
        'f' => 'ф',
        'x' => 'х',
        'c' => 'ц',
        'č' => 'ч',
        'š' => 'ш',
        'y' => 'ы',
        'ʹ' => 'ь',
        'è' => 'э',
        'ju' => 'ю',
        'ja' => 'я',
        'ʼ' => 'ʼ',
    );
}