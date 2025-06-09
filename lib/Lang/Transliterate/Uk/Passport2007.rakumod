use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::Passport2007 does Lang::Transliterate::Transliterator;

# Ukrainian Passport system 2007
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'ie',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'i',
    'й' => 'i',
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
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shch',
    'ь' => '',       # Soft sign not transliterated
    'ю' => 'iu',
    'я' => 'ia',
    "'" => '',       # Apostrophe not transliterated
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian Passport 2007 reverse mapping
    return (
        # Multi-character mappings first
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'ie' => 'є',
        'iu' => 'ю',
        'ia' => 'я',
        # Single mappings
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',  # Could also be ґ
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'y' => 'и',
        'i' => 'і',  # Could also be ї, й
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
    );
}