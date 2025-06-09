use Lang::Transliterate;

unit class Lang::Transliterate::Bg::BGNPCGN does Lang::Transliterate::Transliterator;

# Bulgarian BGN/PCGN Romanization
# Board on Geographic Names / Permanent Committee on Geographical Names
# This implements the 2013 version
my %base-mappings = (
    # Bulgarian Cyrillic to Latin BGN/PCGN 2013
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'y',
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
    'щ' => 'sht',
    'ъ' => 'a',
    'ь' => 'y',
    'ю' => 'yu',
    'я' => 'ya',
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # BGN/PCGN reverse mappings
    # Multi-character mappings must come first
    return (
        # Multi-character mappings
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'sht' => 'щ',
        'yu' => 'ю',
        'ya' => 'я',
        
        # Simple letters
        'a' => 'а',  # Note: 'a' maps to both 'а' and 'ъ'
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
        'y' => 'й',  # Note: 'y' maps to both 'й' and 'ь'
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
    );
}

# Note: Pre-2013 BGN/PCGN had different mappings:
# 'й' => 'y' (same)
# 'ъ' => 'ŭ' (now 'a')
# 'ь' => ' (omitted) (now 'y')