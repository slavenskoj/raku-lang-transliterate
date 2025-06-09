use Lang::Transliterate;

unit class Lang::Transliterate::Ru::GOST779_2000A does Lang::Transliterate::Transliterator;

# ISO 9:1995, ГОСТ 7.79—2000 Система А Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin ISO 9:1995 System A
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'ë',
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
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'è',
    'ю' => 'û',
    'я' => 'â',
    
    # Historic letters (pre-1918)
    'і' => 'ì',      # и десятеричное with grave
    'ѣ' => 'ě',      # ять
    'ѳ' => 'f̀',      # фита with grave
    'ѵ' => 'ỳ',      # ижица with grave
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ISO 9:1995 System A reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'ë' => 'ё',
        'ž' => 'ж',
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
        'č' => 'ч',
        'š' => 'ш',
        'ŝ' => 'щ',
        'ʺ' => 'ъ',
        '"' => 'ъ',
        'y' => 'ы',
        'ʹ' => 'ь',
        "'" => 'ь',
        'è' => 'э',
        'û' => 'ю',
        'â' => 'я',
        'ì' => 'і',
        'ě' => 'ѣ',
        'f̀' => 'ѳ',
        'ỳ' => 'ѵ',
    );
}