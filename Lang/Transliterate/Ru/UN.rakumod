use Lang::Transliterate;

unit class Lang::Transliterate::Ru::UN does Lang::Transliterate::Transliterator;

# UN (1987) Romanization for Russian  
# United Nations system - same as ISO/R 9 (1968) Таблица 2
# Note: Geographic names use only e, h, c, šč, ju, ja (per 1983 order)
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin UN (1987) - same as ISO/R 9 Таблица 2
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Geographic names: only 'e' (per 1983 order)
    'ё' => 'jo',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'jj',     # Double j in UN system
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
    'ц' => 'c',      # Geographic names: only 'c' (per 1983 order)
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shh',    # Double h in UN system
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'eh',
    'ю' => 'ju',     # Geographic names: only 'ju' (per 1983 order)
    'я' => 'ja',     # Geographic names: only 'ja' (per 1983 order)
    
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
    # UN (1987) reverse mapping
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
        '"' => 'ъ',
        'y' => 'ы',
        'ʹ' => 'ь',
        "'" => 'ь',
        'eh' => 'э',
        'ju' => 'ю',
        'ja' => 'я',
        'ě' => 'ѣ',
    );
}