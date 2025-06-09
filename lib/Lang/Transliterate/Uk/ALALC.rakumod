use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Uk::ALALC does Lang::Transliterate::Transliterator;

# Ukrainian ALA-LC (American Library Association - Library of Congress)
# From Wikipedia comparison table
my %base-mappings = (
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'ґ' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'i͡e',    # With ligature tie
    'ж' => 'z͡h',    # With ligature tie
    'з' => 'z',
    'и' => 'y',
    'і' => 'i',
    'ї' => 'ï',
    'й' => 'ĭ',
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
    'ц' => 't͡s',    # With ligature tie
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shch',
    'ь' => 'ʹ',      # Soft sign
    'ю' => 'i͡u',    # With ligature tie
    'я' => 'i͡a',    # With ligature tie
    "'" => '',       # Apostrophe not transliterated
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ukrainian ALA-LC reverse mapping
    return (
        # Multi-character mappings first (with ligature ties)
        'i͡e' => 'є',
        'z͡h' => 'ж',
        't͡s' => 'ц',
        'i͡u' => 'ю',
        'i͡a' => 'я',
        # Multi-character without ligatures
        'ie' => 'є',
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'iu' => 'ю',
        'ia' => 'я',
        # Special characters
        'ï' => 'ї',
        'ĭ' => 'й',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII apostrophe for soft sign
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