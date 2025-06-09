use Lang::Transliterate;

unit class Lang::Transliterate::Uk::Sci does Lang::Transliterate::Transliterator;

# Ukrainian Scientific Transliteration
my %base-mappings = (
    # Ukrainian Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'ji',
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
    'ф' => 'f',
    'х' => 'x',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',
    'ь' => 'ʹ',
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
        'je' => 'є',
        'ž' => 'ж',
        'z' => 'з',
        'y' => 'и',
        'i' => 'і',
        'ji' => 'ї',
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
        'f' => 'ф',
        'x' => 'х',
        'c' => 'ц',
        'č' => 'ч',
        'š' => 'ш',
        'šč' => 'щ',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ju' => 'ю',
        'ja' => 'я',
        'ʼ' => 'ʼ',
    );
}