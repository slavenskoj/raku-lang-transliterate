use Lang::Transliterate;

unit class Lang::Transliterate::Bg::BritishStandard does Lang::Transliterate::Transliterator;

# Bulgarian British Standard (1958) Transliteration
my %base-mappings = (
    # Bulgarian Cyrillic to Latin British Standard
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
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
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sht',
    'ъ' => 'ŭ',
    'ь' => 'ʼ',  # U+02BC MODIFIER LETTER APOSTROPHE
    'ю' => 'yu',
    'я' => 'ya',
    
    # Archaic letters
    'ѫ' => 'ū',
    'ѣ' => 'ê',
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # British Standard reverse mappings
    return (
        # Multi-character mappings first
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'sht' => 'щ',
        'yu' => 'ю',
        'ya' => 'я',
        
        # Diacritical marks
        'ĭ' => 'й',
        'ŭ' => 'ъ',
        'ū' => 'ѫ',
        'ê' => 'ѣ',
        'ʼ' => 'ь',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
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