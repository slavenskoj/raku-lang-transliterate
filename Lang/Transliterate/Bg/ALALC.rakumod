use Lang::Transliterate;

unit class Lang::Transliterate::Bg::ALALC does Lang::Transliterate::Transliterator;

# Bulgarian ALA-LC Romanization
# American Library Association - Library of Congress
my %base-mappings = (
    # Bulgarian Cyrillic to Latin ALA-LC
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
    'ц' => 't͡s',  # t-s ligature (with combining double inverted breve U+0361)
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sht',
    'ъ' => 'ŭ',   # ʺ in final position (pre-1945 texts)
    'ь' => 'ʹ',   # U+02B9 MODIFIER LETTER PRIME
    'ю' => 'i͡u',  # i-u ligature (with combining double inverted breve U+0361)
    'я' => 'i͡a',  # i-a ligature (with combining double inverted breve U+0361)
    
    # Archaic letters
    'ѫ' => 'u̐',   # u with combining candrabindu
    'ѣ' => 'i͡e',  # i-e ligature (with combining double inverted breve U+0361)
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ALA-LC reverse mappings
    # Multi-character mappings must come first
    return (
        # Complex mappings first
        'i͡u' => 'ю',
        'i͡a' => 'я',
        'i͡e' => 'ѣ',
        't͡s' => 'ц',
        'u̐' => 'ѫ',
        
        # Multi-character mappings
        'zh' => 'ж',
        'kh' => 'х',
        'ch' => 'ч',
        'sh' => 'ш',
        'sht' => 'щ',
        
        # Diacritical marks
        'ĭ' => 'й',
        'ŭ' => 'ъ',
        'ʹ' => 'ь',
        
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