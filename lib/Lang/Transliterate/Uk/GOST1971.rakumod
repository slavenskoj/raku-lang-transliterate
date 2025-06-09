use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::GOST1971 does Lang::Transliterate::Transliterator;

# Ukrainian GOST 1971
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => '',       # Not defined in GOST 1971
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ж' => 'zh',
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
    'х' => 'kh',
    'ц' => 'c',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shh',
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'ju',
    'я' => 'ja',
    "'" => '*',      # Apostrophe
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian GOST 1971 reverse mapping
    return (
        # Multi-character mappings first
        'zh' => 'ж',
        'kh' => 'х',
        'ch' => 'ч',
        'sh' => 'ш',
        'shh' => 'щ',
        'je' => 'є',
        'ji' => 'ї',
        'ju' => 'ю',
        'ja' => 'я',
        # Special characters
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        '*' => "'",
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',  # Could also be і
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