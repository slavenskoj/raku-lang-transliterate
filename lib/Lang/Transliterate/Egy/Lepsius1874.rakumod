use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Egy::Lepsius1874 does Lang::Transliterate::Transliterator;

# Ancient Egyptian Lepsius 1874 Transliteration
# Based on Karl Richard Lepsius's 1874 system
# This was a widely-used early standard for Egyptian hieroglyphic transliteration

my %base-mappings = (
    # Egyptian hieroglyphs to Lepsius 1874 transliteration
    # Using Unicode hieroglyph code points
    "\c[0x13000]" => 'a',      # 𓄿 Egyptian vulture
    "\c[0x131CB]" => 'ȧ',      # 𓇋 reed
    "\c[0x133ED]" => 'i',      # 𓏭 double reed
    "\c[0x131CC]" => 'ī',      # 𓇌 double reed (alternative)
    "\c[0x13090]" => 'ā',      # 𓂝 arm
    "\c[0x13171]" => 'u',      # 𓅱 quail chick
    "\c[0x130C0]" => 'b',      # 𓃀 foot
    "\c[0x132AA]" => 'p',      # 𓊪 reed mat
    "\c[0x130C1]" => 'f',      # 𓆑 horned viper
    "\c[0x13153]" => 'm',      # 𓅓 owl
    "\c[0x13216]" => 'n',      # 𓈖 water ripple
    "\c[0x13091]" => 'r',      # 𓂋 mouth
    "\c[0x13254]" => 'h',      # 𓉔 reed shelter
    "\c[0x1325B]" => 'ḥ',      # 𓎛 twisted wick
    "\c[0x1330D]" => 'χ',      # 𓐍 placenta
    "\c[0x13121]" => 'χ',      # 𓄡 belly and tail
    "\c[0x13283]" => 's',      # 𓊃 folded cloth
    "\c[0x13284]" => 's',      # 𓋴 pool (alternative s)
    "\c[0x132F9]" => 'š',      # 𓈙 garden pool
    "\c[0x131CE]" => 'q',      # 𓈎 hill slope
    "\c[0x133A1]" => 'k',      # 𓎡 basket
    "\c[0x133BC]" => 'ḳ',      # 𓎼 stand
    "\c[0x1337F]" => 't',      # 𓏏 bread loaf
    "\c[0x133FF]" => 'θ',      # 𓍿 pestle
    "\c[0x130A7]" => 'ṭ',      # 𓂧 hand
    "\c[0x131D3]" => 't′',     # 𓆓 snake
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Egyptian Lepsius 1874 reverse mappings
    return (
        # Multi-character mappings first
        't′' => "\c[0x131D3]",
        
        # Single characters with diacritics
        'ȧ' => "\c[0x131CB]",
        'ī' => "\c[0x131CC]",
        'ā' => "\c[0x13090]",
        'ḥ' => "\c[0x1325B]",
        'š' => "\c[0x132F9]",
        'ḳ' => "\c[0x133BC]",
        'θ' => "\c[0x133FF]",
        'ṭ' => "\c[0x130A7]",
        
        # Basic letters
        'a' => "\c[0x13000]",
        'i' => "\c[0x133ED]",
        'u' => "\c[0x13171]",
        'b' => "\c[0x130C0]",
        'p' => "\c[0x132AA]",
        'f' => "\c[0x130C1]",
        'm' => "\c[0x13153]",
        'n' => "\c[0x13216]",
        'r' => "\c[0x13091]",
        'h' => "\c[0x13254]",
        'χ' => "\c[0x1330D]",  # Could also be 𓄡
        's' => "\c[0x13283]",  # Could also be 𓋴
        'q' => "\c[0x131CE]",
        'k' => "\c[0x133A1]",
        't' => "\c[0x1337F]",
    );
}