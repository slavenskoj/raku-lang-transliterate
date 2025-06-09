use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::GOST1986 does Lang::Transliterate::Transliterator;

# Ukrainian GOST 1986
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => '',       # Not defined in GOST 1986
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
    'і' => 'i',
    'ї' => 'i',
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
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'ju',
    'я' => 'ja',
    "'" => 'ʺ',      # Hard sign (apostrophe)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian GOST 1986 reverse mapping
    return (
        # Multi-character mappings first
        'je' => 'є',
        'ju' => 'ю',
        'ja' => 'я',
        'šč' => 'щ',
        # Special characters
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ʺ' => "'",
        '"' => "'",  # ASCII quote for hard sign
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',  # Could also be і, ї
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
    );
}