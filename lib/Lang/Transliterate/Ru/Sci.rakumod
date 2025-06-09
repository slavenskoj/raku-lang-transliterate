use Lang::Transliterate;

unit class Lang::Transliterate::Ru::Sci does Lang::Transliterate::Transliterator;

# Russian Scientific Transliteration
# Used in linguistics and academic publications
my %base-mappings = (
    # Russian Cyrillic to Latin Scientific
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
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
    'х' => 'x',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'šč',
    'ъ' => 'ʺ',
    'ы' => 'y',
    'ь' => 'ʹ',
    'э' => 'è',
    'ю' => 'ju',
    'я' => 'ja',
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ě',      # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
    
    # Pre-18th century letters
    'є' => 'ê',     # Ukrainian ye (Scholarly: "ê (j)e")
    'ѥ' => 'ẹ',     # iotated e
    'ѕ' => 'dz',     # zelo (Scholarly: "dz (ʒ)")
    'ѧ' => 'ę',      # little yus (Scholarly: "ę (ja)")
    'ѩ' => 'ję',     # iotated little yus (Scholarly: "ję (ja)")
    'ѫ' => 'ą',      # big yus (Scholarly: "ą (u)")
    'ѭ' => 'ją',     # iotated big yus (Scholarly: "ją (ju)")
    'ѯ' => 'ks',      # ksi
    'ѱ' => 'ps',     # psi
    'ѡ' => 'ô',      # omega (Scholarly: "ô (o)")
    'ѿ' => 'ôt',     # ot (Scholarly: "ôt (ot)")
    'ꙋ' => 'u',      # uk
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Scientific transliteration reverse mapping with alternative forms
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
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
        'x' => 'х',
        'c' => 'ц',
        'č' => 'ч',
        'š' => 'ш',
        'šč' => 'щ',
        'ʺ' => 'ъ',
        'y' => 'ы',
        'ʹ' => 'ь',
        'è' => 'э',
        'ju' => 'ю',
        'ja' => 'я',
        'ě' => 'ѣ',
        
        # Alternative forms for pre-18th century letters
        'ê' => 'є',
#        'je' => 'є',      # Alternative: (j)e
        'ẹ' => 'ѥ',
        'dz' => 'ѕ',
        'ʒ' => 'ѕ',      # Alternative form
        'ę' => 'ѧ',
#        'ja' => 'ѧ',      # Alternative: (ja) - note: conflict with я
        'ję' => 'ѩ',
        'ją' => 'ѭ',
        'ą' => 'ѫ',
#        'u' => 'ѫ',       # Alternative: (u) - note: conflict with у
#        'ju' => 'ѭ',      # Alternative: (ju) - note: conflict with ю
#        'ps' => 'ѱ',
        'ô' => 'ѡ',
#        'o' => 'ѡ',       # Alternative: (o) - note: conflict with о
        'ôt' => 'ѿ',
#        'ot' => 'ѿ',      # Alternative: (ot)
    );
}