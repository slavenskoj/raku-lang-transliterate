use Lang::Transliterate;

unit class Lang::Transliterate::Mk::ISO9 does Lang::Transliterate::Transliterator;

# ISO 9:1995 Macedonian transliteration
# Modern ISO 9 standard

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
    'ѕ' => 'ẑ',     # z with circumflex (different from 1968)
    'и' => 'i',
    'ј' => 'j',
    'к' => 'k',
    'л' => 'l',
    'љ' => 'l̂',     # l with circumflex
    'м' => 'm',
    'н' => 'n',
    'њ' => 'n̂',     # n with circumflex
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
    'џ' => 'ĉ',     # c with circumflex
    'ш' => 'š',     # s with caron
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ISO 9:1995 reverse mappings
    return (
        # Characters with diacritics
        'ǵ' => 'ѓ',
        'ḱ' => 'ќ',
        'ž' => 'ж',
        'ẑ' => 'ѕ',
        'l̂' => 'љ',
        'n̂' => 'њ',
        'č' => 'ч',
        'ĉ' => 'џ',
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