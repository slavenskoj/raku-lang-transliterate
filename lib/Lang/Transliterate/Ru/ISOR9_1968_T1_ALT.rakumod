use Lang::Transliterate;

unit class Lang::Transliterate::Ru::ISOR9_1968_T1_ALT does Lang::Transliterate::Transliterator;

# ISO/R 9 (1968), ГОСТ 16876—71, СТ СЭВ 1362—78, ООН (1987) Таблица 1 Alternatives
# From Wikipedia comparison table - using the alternative variants (допустимые альтернативные варианты)
my %base-mappings = (
    # Russian Cyrillic to Latin ISO/R 9 (1968) - Таблица 1 with alternatives
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'je',     # Alternative form (footnote: допустимые альтернативные варианты)
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
    'у' => 'u',      # Alternative (footnote: допустимые альтернативные варианты)
    'ф' => 'f',
    'х' => 'ch',     # Alternative form (footnote: допустимые альтернативные варианты)
    'ц' => 'ts',     # Alternative form
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',     # Alternative form (footnote: допустимые альтернативные варианты)
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'è',
    'ю' => 'ju',     # Alternative form (footnote: допустимые альтернативные варианты)
    'я' => 'ja',     # Alternative form (footnote: допустимые альтернативные варианты)
    
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
    # ISO/R 9 (1968) Таблица 1 alternatives reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'je' => 'е',     # Alternative form
        'e' => 'е',      # Standard form also accepted
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
        'ch' => 'х',     # Alternative form
        'h' => 'х',      # Standard form also accepted
        'ts' => 'ц',     # Alternative form
        'c' => 'ц',      # Standard form also accepted
        'č' => 'ч',
        'š' => 'ш',
        'šč' => 'щ',     # Alternative form
        'ŝ' => 'щ',      # Standard form also accepted
        'ʺ' => 'ъ',
        '"' => 'ъ',
        'y' => 'ы',
        'ʹ' => 'ь',
        "'" => 'ь',
        'è' => 'э',
        'ju' => 'ю',     # Alternative form
        'û' => 'ю',      # Standard form also accepted
        'ja' => 'я',     # Alternative form
        'â' => 'я',      # Standard form also accepted
        'ě' => 'ѣ',
    );
}