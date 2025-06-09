use Lang::Transliterate;

unit class Lang::Transliterate::Bg::Danchev does Lang::Transliterate::Transliterator;

# Bulgarian Danchev Transliteration System
# An alternative phonetic-based system by Andrei Danchev
my %base-mappings = (
    # Bulgarian Cyrillic to Latin Danchev
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
    'ъ' => 'u',  # Note: different from other systems
    'ь' => '\'',  # apostrophe
    'ю' => 'yu',
    'я' => 'ya',
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Danchev reverse mappings
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
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
        'y' => 'й',
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',
        'u' => 'у',  # Note: 'u' can map to both 'у' and 'ъ'
        'f' => 'ф',
        'h' => 'х',
        '\'' => 'ь',
    );
}