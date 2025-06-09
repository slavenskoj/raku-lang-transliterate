use Lang::Transliterate;

unit class Lang::Transliterate::Be::ISO9 does Lang::Transliterate::Transliterator;

# Belarusian ISO 9:1995 Transliteration
# Also Belarusian state standard GOST 7.79–2000
my %base-mappings = (
    # Belarusian Cyrillic to Latin ISO 9:1995
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'ґ' => 'g̀',  # g with combining grave accent
    'д' => 'd',
    'е' => 'e',
    'ё' => 'ë',
    'ж' => 'ž',
    'з' => 'z',
    'і' => 'ì',  # i with grave accent
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
    'ў' => 'ǔ',  # u with caron
    'ф' => 'f',
    'х' => 'h',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'ы' => 'y',
    'ь' => 'ʹ',  # U+02B9 MODIFIER LETTER PRIME
    'э' => 'è',
    'ю' => 'û',
    'я' => 'â',
    'ʼ' => 'ʼ',  # apostrophe preserved
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ISO 9 is designed to be reversible
    return (
        # Diacritical marks
        'g̀' => 'ґ',
        'ì' => 'і',
        'ë' => 'ё',
        'ž' => 'ж',
        'ǔ' => 'ў',
        'č' => 'ч',
        'š' => 'ш',
        'è' => 'э',
        'û' => 'ю',
        'â' => 'я',
        'ʹ' => 'ь',
        "'" => 'ь',  # ASCII alternative for soft sign
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
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
        'ʼ' => 'ʼ',
    );
}