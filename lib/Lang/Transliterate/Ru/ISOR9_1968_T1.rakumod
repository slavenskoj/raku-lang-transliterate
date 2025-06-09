use Lang::Transliterate;

unit class Lang::Transliterate::Ru::ISOR9_1968_T1 does Lang::Transliterate::Transliterator;

# ISO/R 9 (1968), ГОСТ 16876—71, СТ СЭВ 1362—78, ООН (1987) Таблица 1 Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin ISO/R 9 (1968) - Таблица 1
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Note: 'je' as alternative (допустимые альтернативные варианты)
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
    'х' => 'h',      # Note: 'ch' as alternative (допустимые альтернативные варианты)
    'ц' => 'c',      # Note: 'ts' as alternative 
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'ŝ',      # Note: 'šč' as alternative
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'è',
    'ю' => 'û',      # Note: 'ju' as alternative
    'я' => 'â',      # Note: 'ja' as alternative
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ě',      # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ISO/R 9 (1968) reverse mapping with alternatives
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'je' => 'е',     # Alternative form
        'ë' => 'ё',
        'ž' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
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
        'f' => 'ф',      # Could also be ѳ
        'h' => 'х',
        'ch' => 'х',     # Alternative form
        'c' => 'ц',
        'ts' => 'ц',     # Alternative form
        'č' => 'ч',
        'š' => 'ш',
        'ŝ' => 'щ',
        'šč' => 'щ',     # Alternative form
        'ʺ' => 'ъ',
        '"' => 'ъ',
        'y' => 'ы',
        'ʹ' => 'ь',
        "'" => 'ь',
        'è' => 'э',
        'û' => 'ю',
        'ju' => 'ю',     # Alternative form
        'â' => 'я',
        'ja' => 'я',     # Alternative form
        'ě' => 'ѣ',
    );
}