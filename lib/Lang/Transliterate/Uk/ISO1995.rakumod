use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::ISO1995 does Lang::Transliterate::Transliterator;

# Ukrainian ISO 9:1995 transliteration
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => 'g̀',      # g with grave
    'д' => 'd',
    'е' => 'e',
    'є' => 'ê',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
    'і' => 'ì',      # i with grave
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
    'щ' => 'ŝ',
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'û',
    'я' => 'â',
    "'" => 'ˮ',      # Apostrophe
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian ISO 9:1995 reverse mapping
    return (
        # Special characters with diacritics
        'g̀' => 'ґ',
        'ê' => 'є',
        'ž' => 'ж',
        'ì' => 'і',
        'ï' => 'ї',
        'č' => 'ч',
        'š' => 'ш',
        'ŝ' => 'щ',
        'û' => 'ю',
        'â' => 'я',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
        'ˮ' => "'",
        '"' => "'",  # ASCII quote for apostrophe
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
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
    );
}