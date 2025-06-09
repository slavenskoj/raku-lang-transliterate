use Lang::Transliterate;

unit class Lang::Transliterate::Ru::GOSTR52290_2004 does Lang::Transliterate::Transliterator;

# GOST R 52290-2004 Road Signs Romanization for Russian
# From Wikipedia transliteration table
my %base-mappings = (
    # Russian Cyrillic to Latin Road Signs (GOST R 52290-2004)
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'yo',
    'ж' => 'zh',
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
    'х' => 'x',
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shh',    # Double h for road signs
    'ъ' => 'ʼ',      # Modifier letter apostrophe (U+02BC)
    'ы' => 'y',
    'ь' => 'ʼ',      # Modifier letter apostrophe (U+02BC)
    'э' => 'e',
    'ю' => 'yu',
    'я' => 'ya',
    
    # Historic letters (pre-1918) - not applicable for road signs
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ye',     # ять
    'ѳ' => 'fh',     # фита
    'ѵ' => 'yh',     # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Road Signs reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be э
        'yo' => 'ё',
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і
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
        'x' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shh' => 'щ',
        'ʼ' => 'ъ',      # Could also be ь
        'y' => 'ы',
        'yu' => 'ю',
        'ya' => 'я',
        'ye' => 'ѣ',
        'fh' => 'ѳ',
        'yh' => 'ѵ',
    );
}