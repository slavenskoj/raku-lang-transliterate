use Lang::Transliterate;

unit class Lang::Transliterate::Rue::Sci does Lang::Transliterate::Transliterator;

# Carpathian Rusyn Scientific Transliteration
# Based on the scientific transliteration standard

my %base-mappings = (
    # Rusyn Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',      # Note: Rusyn uses h for г
    'ґ' => 'g',      # Note: Rusyn uses g for ґ
    'д' => 'd',
    'е' => 'e',
    'є' => 'je',
    'ё' => 'jo',
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'y',      # Note: Rusyn uses y (with î as alternative)
    'і' => 'i',
    'ї' => 'ji',
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
    'х' => 'ch',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',
    'ъ' => 'ʺ',      # Hard sign (U+02BA MODIFIER LETTER DOUBLE PRIME)
    'ы' => 'ŷ',      # Note: ŷ is primary, y is alternative
    'ь' => 'ʹ',      # Soft sign (U+02B9 MODIFIER LETTER PRIME)
    'ю' => 'ju',
    'я' => 'ja',
    
    # Historic/archaic letters that may appear in Rusyn texts
    'ѣ' => 'ě',      # Yat
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Rusyn Scientific reverse mappings
    return (
        # Multi-character mappings first
        'je' => 'є',
        'jo' => 'ё',
        'ji' => 'ї',
        'ch' => 'х',
        'šč' => 'щ',
        'ju' => 'ю',
        'ja' => 'я',
        
        # Characters with diacritics
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ŷ' => 'ы',
        'ě' => 'ѣ',
        'ʺ' => 'ъ',
        'ʹ' => 'ь',
        
        # Simple letters (note the g/h swap)
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',      # h → г in Rusyn
        'g' => 'ґ',      # g → ґ in Rusyn
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'y' => 'и',      # y → и in Rusyn
        'î' => 'и',      # alternative: î → и
        'i' => 'і',      # i → і in Rusyn
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
        'c' => 'ц',
    );
}