use Lang::Transliterate;

unit class Lang::Transliterate::Bg::Official2006 does Lang::Transliterate::Transliterator;

# Bulgarian Official Transliteration System (2006)
# Bulgarian Law on Transliteration adopted in 2009
# Based on the Streamlined System
my %base-mappings = (
    # Bulgarian Cyrillic to Latin Official 2006
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'y',
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
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sht',
    'ъ' => 'a',
    'ь' => 'y',
    'ю' => 'yu',
    'я' => 'ya',
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Official 2006 reverse mappings
    # Multi-character mappings must come first
    return (
        # Multi-character mappings
        'zh' => 'ж',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'sht' => 'щ',
        'yu' => 'ю',
        'ya' => 'я',
        
        # Simple letters
        'a' => 'а',  # Note: 'a' maps to both 'а' and 'ъ'
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
        'y' => 'й',  # Note: 'y' maps to both 'й' and 'ь'
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
    );
}