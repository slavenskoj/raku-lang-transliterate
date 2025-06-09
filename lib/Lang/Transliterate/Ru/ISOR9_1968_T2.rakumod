use Lang::Transliterate;

unit class Lang::Transliterate::Ru::ISOR9_1968_T2 does Lang::Transliterate::Transliterator;

# ISO/R 9 (1968), ГОСТ 16876—71, СТ СЭВ 1362—78, ООН (1987) Таблица 2 Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin ISO/R 9 (1968) - Таблица 2
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'jo',     # Different from Таблица 1
    'ж' => 'zh',     # Different from Таблица 1
    'з' => 'z',
    'и' => 'i',
    'й' => 'jj',     # Different from Таблица 1
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
    'х' => 'kh',     # Different from Таблица 1
    'ц' => 'c',
    'ч' => 'ch',     # Different from Таблица 1
    'ш' => 'sh',     # Different from Таблица 1
    'щ' => 'shh',    # Different from Таблица 1
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'eh',     # Different from Таблица 1
    'ю' => 'ju',
    'я' => 'ja',
    
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
    # ISO/R 9 (1968) Таблица 2 reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'jo' => 'ё',
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
        'jj' => 'й',
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
        'kh' => 'х',
        'c' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shh' => 'щ',
        'ʺ' => 'ъ',
        'y' => 'ы',
        'ʹ' => 'ь',
        'eh' => 'э',
        'ju' => 'ю',
        'ja' => 'я',
        'ě' => 'ѣ',
    );
}