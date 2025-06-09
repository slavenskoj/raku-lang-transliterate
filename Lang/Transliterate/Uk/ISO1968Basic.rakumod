use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::ISO1968Basic does Lang::Transliterate::Transliterator;

# Ukrainian ISO 1968 basic transliteration
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
    'і' => 'ī',      # i with macron
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
    'х' => 'h',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'ju',
    'я' => 'ja',
    "'" => 'ʺ',      # Hard sign
    # Historical letters
    'ъ' => 'ʺ',      # Yer
    'ы' => 'y',
    'ѣ' => 'i',      # Yat
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian ISO 1968 basic reverse mapping
    return (
        # Multi-character mappings first
        'šč' => 'щ',
        'je' => 'є',
        'ju' => 'ю',
        'ja' => 'я',
        # Special characters
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ī' => 'і',
        'ï' => 'ї',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ʺ' => "'",  # Could also be ъ
        '"' => "'",  # ASCII quote for hard sign
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',  # Could also be ґ
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',  # Could also be ѣ
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