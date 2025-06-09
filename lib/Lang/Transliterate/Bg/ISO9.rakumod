use Lang::Transliterate;

unit class Lang::Transliterate::Bg::ISO9 does Lang::Transliterate::Transliterator;

# Bulgarian ISO 9:1995 Transliteration
# This is the current ISO standard for Bulgarian Cyrillic
my %base-mappings = (
    # Bulgarian Cyrillic to Latin ISO 9:1995
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
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
    'ъ' => 'ʺ',  # U+02BA MODIFIER LETTER DOUBLE PRIME
    'ь' => 'ʹ',  # U+02B9 MODIFIER LETTER PRIME
    'ю' => 'û',
    'я' => 'â',
    
    # Archaic letters (if encountered)
    'ѫ' => 'ǎ',  # Big yus
    'ѣ' => 'ě',  # Yat
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ISO 9 is designed to be reversible
    # Return mappings in order of specificity
    return (
        # Multi-character mappings first
        'ʺ' => 'ъ',
        'ʹ' => 'ь',
        
        # Diacritical marks
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ŝ' => 'щ',
        'û' => 'ю',
        'â' => 'я',
        'ǎ' => 'ѫ',
        'ě' => 'ѣ',
        
        # Simple letters
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