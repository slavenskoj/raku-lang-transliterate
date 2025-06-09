use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::ISO1968Ukrainian does Lang::Transliterate::Transliterator;

# Ukrainian ISO 1968 Ukrainian variant transliteration
# From Wikipedia comparison table
my %base-mappings = (
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
    'ї' => 'ï',
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
    'х' => 'ch',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'ju',
    'я' => 'ja',
    "'" => 'ʺ',      # Hard sign
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian ISO 1968 Ukrainian variant reverse mapping
    return (
        # Multi-character mappings first
        'šč' => 'щ',
        'ch' => 'х',
        'je' => 'є',
        'ju' => 'ю',
        'ja' => 'я',
        # Special characters
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ï' => 'ї',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ʺ' => "'",
        '"' => "'",  # ASCII quote for hard sign
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'g' => 'ґ',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'y' => 'и',
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
        'f' => 'ф',
        'c' => 'ц',
    );
}