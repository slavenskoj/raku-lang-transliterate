use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Egy::Buurman1988 does Lang::Transliterate::Transliterator;

# Ancient Egyptian Buurman et al. 1988 Transliteration
# Based on the system for computer encoding of hieroglyphs
# Uses simple ASCII characters for easy computing

my %base-mappings = (
    # Egyptian hieroglyphs to Buurman et al. 1988 transliteration
    # Using Unicode hieroglyph code points
    "\c[0x13000]" => 'A',      # 𓄿 Egyptian vulture
    "\c[0x131CB]" => 'i',      # 𓇋 reed
    "\c[0x133ED]" => 'y',      # 𓏭 double reed
    "\c[0x131CC]" => 'y',      # 𓇌 double reed (alternative)
    "\c[0x13090]" => 'a',      # 𓂝 arm
    "\c[0x13171]" => 'w',      # 𓅱 quail chick
    "\c[0x130C0]" => 'b',      # 𓃀 foot
    "\c[0x132AA]" => 'p',      # 𓊪 reed mat
    "\c[0x130C1]" => 'f',      # 𓆑 horned viper
    "\c[0x13153]" => 'm',      # 𓅓 owl
    "\c[0x13216]" => 'n',      # 𓈖 water ripple
    "\c[0x13091]" => 'r',      # 𓂋 mouth
    "\c[0x13254]" => 'h',      # 𓉔 reed shelter
    "\c[0x1325B]" => 'H',      # 𓎛 twisted wick (capital H)
    "\c[0x1330D]" => 'x',      # 𓐍 placenta
    "\c[0x13121]" => 'X',      # 𓄡 belly and tail (capital X)
    "\c[0x13283]" => 'z',      # 𓊃 folded cloth
    "\c[0x13284]" => 's',      # 𓋴 pool
    "\c[0x132F9]" => 'S',      # 𓈙 garden pool (capital S)
    "\c[0x131CE]" => 'q',      # 𓈎 hill slope
    "\c[0x133A1]" => 'k',      # 𓎡 basket
    "\c[0x133BC]" => 'g',      # 𓎼 stand
    "\c[0x1337F]" => 't',      # 𓏏 bread loaf
    "\c[0x133FF]" => 'T',      # 𓍿 pestle (capital T)
    "\c[0x130A7]" => 'd',      # 𓂧 hand
    "\c[0x131D3]" => 'D',      # 𓆓 snake (capital D)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Egyptian Buurman et al. 1988 reverse mappings
    return (
        # Capital letters (special characters)
        'A' => "\c[0x13000]",
        'H' => "\c[0x1325B]",
        'X' => "\c[0x13121]",
        'S' => "\c[0x132F9]",
        'T' => "\c[0x133FF]",
        'D' => "\c[0x131D3]",
        
        # Lowercase letters
        'i' => "\c[0x131CB]",
        'y' => "\c[0x133ED]",  # Could also be 𓇌
        'a' => "\c[0x13090]",
        'w' => "\c[0x13171]",
        'b' => "\c[0x130C0]",
        'p' => "\c[0x132AA]",
        'f' => "\c[0x130C1]",
        'm' => "\c[0x13153]",
        'n' => "\c[0x13216]",
        'r' => "\c[0x13091]",
        'h' => "\c[0x13254]",
        'x' => "\c[0x1330D]",
        'z' => "\c[0x13283]",
        's' => "\c[0x13284]",
        'q' => "\c[0x131CE]",
        'k' => "\c[0x133A1]",
        'g' => "\c[0x133BC]",
        't' => "\c[0x1337F]",
        'd' => "\c[0x130A7]",
    );
}