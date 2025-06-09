use Lang::Transliterate;

unit class Lang::Transliterate::Ru::ICAO does Lang::Transliterate::Transliterator;

# ICAO (2012—2016) Romanization for Russian
# International Civil Aviation Organization standard
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin ICAO (2012—2016)
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'e',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'i',
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
    'ъ' => 'ie',     # Hard sign as 'ie' in ICAO
    'ы' => 'y',
    'ь' => '',       # Soft sign not defined/omitted in ICAO
    'э' => 'e',
    'ю' => 'iu',
    'я' => 'ia',
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ie',     # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ICAO reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ё, э
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be й, і, ѵ
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
        'ie' => 'ъ',     # Could also be ѣ
        'y' => 'ы',
        'iu' => 'ю',
        'ia' => 'я',
    );
}