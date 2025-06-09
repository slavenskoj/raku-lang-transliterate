use Lang::Transliterate;

unit class Lang::Transliterate::Sr::Sci does Lang::Transliterate::Transliterator;

# Serbian Scientific Transliteration
# Based on the scientific transliteration standard
my %base-mappings = (
    # Serbian Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'ђ' => 'đ',
    'е' => 'e',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
    'ј' => 'j',
    'к' => 'k',
    'л' => 'l',
    'љ' => 'lj',
    'м' => 'm',
    'н' => 'n',
    'њ' => 'nj',
    'о' => 'o',
    'п' => 'p',
    'р' => 'r',
    'с' => 's',
    'т' => 't',
    'ћ' => 'ć',
    'у' => 'u',
    'ф' => 'f',
    'х' => 'h',
    'ц' => 'c',
    'ч' => 'č',
    'џ' => 'dž',
    'ш' => 'š',
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Serbian Scientific reverse mappings
    return (
        # Multi-character mappings first
        'dž' => 'џ',
        'lj' => 'љ',
        'nj' => 'њ',
        'dj' => 'ђ',  # Alternative for đ
        
        # Characters with diacritics
        'đ' => 'ђ',
        'ž' => 'ж',
        'ć' => 'ћ',
        'č' => 'ч',
        'š' => 'ш',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
        'j' => 'ј',
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
        'x' => 'х',  # Also accept x for х
        'c' => 'ц',
    );
}