use Lang::Transliterate;

unit class Lang::Transliterate::Ru::Telegrams does Lang::Transliterate::Transliterator;

# International Telegrams Romanization for Russian
# From Wikipedia comparison table
my %base-mappings = (
    # Russian Cyrillic to Latin International Telegrams
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'e',
    'ж' => 'j',      # Different from other systems
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
    'х' => 'h',      # Different from other systems
    'ц' => 'c',      # Different from other systems
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sc',     # Different from other systems
    'ъ' => '',       # Not transliterated (correspondence not established)
    'ы' => 'y',
    'ь' => '',       # Not transliterated (correspondence not established)
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
    # International Telegrams reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ё, э
        'j' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be й
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
        'ch' => 'ч',
        'sh' => 'ш',
        'sc' => 'щ',
        'y' => 'ы',
        'iu' => 'ю',
        'ia' => 'я',
        'ie' => 'ѣ',
    );
}