use Lang::Transliterate;

unit class Lang::Transliterate::Bg::Sci does Lang::Transliterate::Transliterator;

# Bulgarian Scientific Transliteration (ISO 9:1968)
my %base-mappings = (
    # Bulgarian Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
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
    'х' => 'h',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'št',
    'ъ' => 'ǎ',
    'ь' => 'j',  # Different from ISO 9:1995
    'ю' => 'ju',
    'я' => 'ja',
    
    # Archaic letters
    'ѫ' => 'ȧ',  # Big yus
    'ѣ' => 'ě',  # Yat
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Scientific transliteration is mostly reversible
    # This provides a best-effort reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'ž' => 'ж',
        'z' => 'з',
        'i' => 'и',
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
        'h' => 'х',
        'c' => 'ц',
        'č' => 'ч',
        'š' => 'ш',
        'št' => 'щ',
        'ǎ' => 'ъ',
        'j' => 'ь',
        'ȧ' => 'ѫ',
        'ě' => 'ѣ',
        'ju' => 'ю',
        'ja' => 'я',
    );
}