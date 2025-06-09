use Lang::Transliterate;

unit class Lang::Transliterate::Ru::ALALCSimplified does Lang::Transliterate::Transliterator;

# ALA-LC Romanization for Russian (simplified version without diacritics)
# This is the version often used in practice where diacritics are omitted
# Based on the 2012 Russian table

my %base-mappings = (
    # Modern Russian Cyrillic to Latin ALA-LC Simplified
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'e',      # Simplified: ë → e
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'i',      # Simplified: ĭ → i
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
    'ц' => 'ts',     # Simplified: t͡s → ts
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shch',
    'ъ' => 'ʺ',      # Hard sign (U+02BA MODIFIER LETTER DOUBLE PRIME)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 MODIFIER LETTER PRIME)
    'э' => 'e',      # Simplified: ė → e
    'ю' => 'iu',     # Simplified: i͡u → iu
    'я' => 'ia',     # Simplified: i͡a → ia
    
    # Letters eliminated in 1918 reform
    'і' => 'i',      # Simplified: ī → i
    'ѣ' => 'ie',     # Simplified: i͡e → ie
    'ѳ' => 'f',      # Simplified: ḟ → f
    'ѵ' => 'y',      # Simplified: ẏ → y
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ALA-LC Simplified reverse mappings
    # This has more ambiguities due to the lack of diacritics
    return (
        # Multi-character mappings
        'zh' => 'ж',
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'iu' => 'ю',
        'ia' => 'я',
        'ie' => 'ѣ',
        
        # Modifier letters
        'ʺ' => 'ъ',
        'ʹ' => 'ь',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ё, э
        'z' => 'з',
        'i' => 'и',      # Could also be й, і
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
        'y' => 'ы',      # Could also be ѵ
    );
}