use Lang::Transliterate;

unit class Lang::Transliterate::Ru::BritishStandard does Lang::Transliterate::Transliterator;

# British Standard (1958) Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin British Standard (1958)
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'ë',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'ĭ',      # With breve
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
    'щ' => 'shch',
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'ȳ',      # With macron (ui alternative noted in table)
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'é',      # With acute accent
    'ю' => 'yu',
    'я' => 'ya',
    
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
    # British Standard reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'ë' => 'ё',
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
        'ĭ' => 'й',
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
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'ʺ' => 'ъ',
        '"' => 'ъ',
        'ȳ' => 'ы',
        'ui' => 'ы',     # Alternative form
        'ʹ' => 'ь',
        "'" => 'ь',
        'é' => 'э',
        'yu' => 'ю',
        'ya' => 'я',
        'ě' => 'ѣ',
    );
}