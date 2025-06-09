use Lang::Transliterate;

unit class Lang::Transliterate::Mk::BGNPCGN does Lang::Transliterate::Transliterator;

# BGN/PCGN 2013 Macedonian transliteration
# U.S. Board on Geographic Names / Permanent Committee on Geographical Names

my %base-mappings = (
    # Basic Cyrillic to Latin mappings
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'ѓ' => 'gj',    # BGN/PCGN 2013 uses digraph
    'е' => 'e',
    'ж' => 'zh',    # BGN/PCGN uses digraphs
    'з' => 'z',
    'ѕ' => 'dz',
    'и' => 'i',
    'ј' => 'j',
    'к' => 'k',
    'л' => 'l',
    'љ' => 'lj',
    'м' => 'm',
    'н' => 'n',
    'њ' => 'nj',
    'о' => 'o',
    'п' => 'p',
    'р' => 'r',
    'с' => 's',
    'т' => 't',
    'ќ' => 'kj',    # BGN/PCGN 2013 uses digraph
    'у' => 'u',
    'ф' => 'f',
    'х' => 'h',
    'ц' => 'ts',    # BGN/PCGN uses ts
    'ч' => 'ch',
    'џ' => 'dzh',
    'ш' => 'sh',
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # BGN/PCGN reverse mappings
    return (
        # Multi-character mappings first (longest first)
        'dzh' => 'џ',
        'gj' => 'ѓ',
        'kj' => 'ќ',
        'zh' => 'ж',
        'dz' => 'ѕ',
        'lj' => 'љ',
        'nj' => 'њ',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',
        'j' => 'ј',
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
    );
}