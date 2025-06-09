use Lang::Transliterate;

unit class Lang::Transliterate::Ru::ALALC does Lang::Transliterate::Transliterator;

# ALA-LC Romanization for Russian (formal version with diacritics)
# American Library Association - Library of Congress romanization system
# Based on the 2012 Russian table and 2011 Church Slavic table
# https://www.loc.gov/catdir/cpso/romanization/russian.pdf

my %base-mappings = (
    # Modern Russian Cyrillic to Latin ALA-LC
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
    'й' => 'ĭ',
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
    'ц' => 't͡s',    # t with combining double breve above + s
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shch',
    'ъ' => 'ʺ',      # Hard sign (U+02BA MODIFIER LETTER DOUBLE PRIME)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 MODIFIER LETTER PRIME)
    'э' => 'ė',      # e with dot above
    'ю' => 'i͡u',    # i with combining double breve above + u
    'я' => 'i͡a',    # i with combining double breve above + a
    
    # Letters eliminated in 1918 reform
    'і' => 'ī',      # и десятеричное - i with macron
    'ѣ' => 'i͡e',    # ять - i with combining double breve above + e
    'ѳ' => 'ḟ',      # фита - f with dot above
    'ѵ' => 'ẏ',      # ижица - y with dot above
    
    # Other obsolete letters (from Church Slavic)
    'є' => 'ē',      # є - e with macron
    'ѥ' => 'i͡e',    # ѥ - same as ѣ
    'ѕ' => 'ż',      # ѕ (zelo) - z with dot above
    'ꙋ' => 'ū',      # ꙋ (uk) - u with macron
    'ѿ' => 'ō͡t',    # ѿ - o with macron and combining double breve + t
    'ѡ' => 'ō',      # ѡ (omega) - o with macron
    'ѧ' => 'ę',      # ѧ (little yus) - e with ogonek
    'ѯ' => 'k͡s',    # ѯ (ksi) - k with combining double breve above + s
    'ѱ' => 'p͡s',    # ѱ (psi) - p with combining double breve above + s
    'ѫ' => 'ǫ',      # ѫ (big yus) - o with ogonek
    'ѩ' => 'i͡ę',    # ѩ (iotated little yus) - i with combining double breve + e with ogonek
    'ѭ' => 'i͡ǫ',    # ѭ (iotated big yus) - i with combining double breve + o with ogonek
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ALA-LC reverse mappings
    # Multi-character and complex mappings must come first
    return (
        # Complex tie-character mappings
        'i͡u' => 'ю',
        'i͡a' => 'я',
        'i͡e' => 'ѣ',    # Primary mapping for i͡e
        't͡s' => 'ц',
        'k͡s' => 'ѯ',
        'p͡s' => 'ѱ',
        'ō͡t' => 'ѿ',
        'i͡ę' => 'ѩ',
        'i͡ǫ' => 'ѭ',
        
        # Multi-character mappings
        'zh' => 'ж',
        'kh' => 'х',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        
        # Diacritical marks
        'ë' => 'ё',
        'ĭ' => 'й',
        'ė' => 'э',
        'ī' => 'і',
        'ḟ' => 'ѳ',
        'ẏ' => 'ѵ',
        'ē' => 'є',
        'ż' => 'ѕ',
        'ū' => 'ꙋ',
        'ō' => 'ѡ',
        'ę' => 'ѧ',
        'ǫ' => 'ѫ',
        'ʺ' => 'ъ',
        '"' => 'ъ',
        'ʹ' => 'ь',
        "'" => 'ь',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
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
        'y' => 'ы',
    );
}