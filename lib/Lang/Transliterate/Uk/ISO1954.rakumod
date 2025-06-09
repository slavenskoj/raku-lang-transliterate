use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::ISO1954 does Lang::Transliterate::Transliterator;

# Ukrainian ISO 1954 transliteration
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => 'ġ',      # g with dot above
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
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
    'х' => 'h',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',
    'ь' => 'ʹ',      # Soft sign as modifier letter prime
    'ю' => 'ju',
    'я' => 'ja',
    "'" => 'ʺ',      # Apostrophe as double prime or apostrophe
    # Historical letters
    'ъ' => 'ʺ',      # Yer
    'ы' => 'y',
    'ѣ' => 'i',      # Yat
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian ISO 1954 reverse mapping
    return (
        # Multi-character mappings first
        'šč' => 'щ',
        'je' => 'є',
        'ji' => 'ї',
        'ju' => 'ю',
        'ja' => 'я',
        # Special characters
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ġ' => 'ґ',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ʺ' => "'",  # Could also be ъ
        '"' => "'",  # ASCII quote for hard sign
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',  # Could also be і, ѣ
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
        'y' => 'ы',
    );
}