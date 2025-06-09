use Lang::Transliterate;

unit class Lang::Transliterate::Mk::ALALC does Lang::Transliterate::Transliterator;

# ALA-LC Macedonian transliteration
# American Library Association - Library of Congress romanization

my %base-mappings = (
    # Basic Cyrillic to Latin mappings
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'ѓ' => 'ǵ',     # g with acute
    'е' => 'e',
    'ж' => 'ž',     # z with caron
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
    'ќ' => 'ḱ',     # k with acute
    'у' => 'u',
    'ф' => 'f',
    'х' => 'h',
    'ц' => 'c',
    'ч' => 'č',     # c with caron
    'џ' => 'dž',    # d with z-caron
    'ш' => 'š',     # s with caron
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ALA-LC reverse mappings
    return (
        # Multi-character mappings first
        'dž' => 'џ',
        'dz' => 'ѕ',
        'lj' => 'љ',
        'nj' => 'њ',
        
        # Characters with diacritics
        'ǵ' => 'ѓ',
        'ḱ' => 'ќ',
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        
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
        'c' => 'ц',
    );
}