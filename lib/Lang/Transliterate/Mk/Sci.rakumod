use Lang::Transliterate;

unit class Lang::Transliterate::Mk::Sci does Lang::Transliterate::Transliterator;

# Macedonian Scientific Transliteration
my %base-mappings = (
    # Macedonian Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'ѓ' => 'ǵ',
    'е' => 'e',
    'ж' => 'ž',
    'з' => 'z',
    'ѕ' => 'dz',
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
    'ќ' => 'ḱ',
    'у' => 'u',
    'ф' => 'f',
    'х' => 'x',
    'ц' => 'c',
    'ч' => 'č',
    'џ' => 'dž',
    'ш' => 'š',
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Scientific reverse mappings
    return (
        # Multi-character mappings first
        'dž' => 'џ',
        'dz' => 'ѕ',
        'lj' => 'љ',
        'nj' => 'њ',
        
        # Characters with diacritics
        'ǵ' => 'ѓ',
        'ḱ' => 'ќ',
        'ž' => 'ж',
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
        'x' => 'х',
        'h' => 'х',    # Also accept h for х
        'c' => 'ц',
    );
}