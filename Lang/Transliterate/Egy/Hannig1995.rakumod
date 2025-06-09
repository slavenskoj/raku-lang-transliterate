use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Egy::Hannig1995 does Lang::Transliterate::Transliterator;

# Ancient Egyptian Hannig 1995 Transliteration
# Based on Rainer Hannig's system from Großes Handwörterbuch Ägyptisch-Deutsch
# This standard uses 'z' instead of 's' for 𓊃 and 'j' for 𓇋

my %base-mappings = (
    # Egyptian hieroglyphs to Hannig 1995 transliteration
    # Using Unicode hieroglyph code points
    "\c[0x13000]" => 'ꜣ',      # 𓄿 Egyptian vulture
    "\c[0x131CB]" => 'j',      # 𓇋 reed
    "\c[0x133ED]" => 'j',      # 𓏭 double reed
    "\c[0x131CC]" => 'y',      # 𓇌 double reed (alternative)
    "\c[0x13090]" => 'ꜥ',      # 𓂝 arm
    "\c[0x13171]" => 'w',      # 𓅱 quail chick
    "\c[0x130C0]" => 'b',      # 𓃀 foot
    "\c[0x132AA]" => 'p',      # 𓊪 reed mat
    "\c[0x130C1]" => 'f',      # 𓆑 horned viper
    "\c[0x13153]" => 'm',      # 𓅓 owl
    "\c[0x13216]" => 'n',      # 𓈖 water ripple
    "\c[0x13091]" => 'r',      # 𓂋 mouth
    "\c[0x13254]" => 'h',      # 𓉔 reed shelter
    "\c[0x1325B]" => 'ḥ',      # 𓎛 twisted wick
    "\c[0x1330D]" => 'ḫ',      # 𓐍 placenta
    "\c[0x13121]" => 'ẖ',      # 𓄡 belly and tail
    "\c[0x13283]" => 'z',      # 𓊃 folded cloth (z not s)
    "\c[0x13284]" => 's',      # 𓋴 pool
    "\c[0x132F9]" => 'š',      # 𓈙 garden pool
    "\c[0x131CE]" => 'q',      # 𓈎 hill slope
    "\c[0x133A1]" => 'k',      # 𓎡 basket
    "\c[0x133BC]" => 'g',      # 𓎼 stand
    "\c[0x1337F]" => 't',      # 𓏏 bread loaf
    "\c[0x133FF]" => 'ṯ',      # 𓍿 pestle
    "\c[0x130A7]" => 'd',      # 𓂧 hand
    "\c[0x131D3]" => 'ḏ',      # 𓆓 snake
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Egyptian Hannig 1995 reverse mappings
    return (
        # Single characters with special marks
        'ꜣ' => "\c[0x13000]",
        'ꜥ' => "\c[0x13090]",
        'ḥ' => "\c[0x1325B]",
        'ḫ' => "\c[0x1330D]",
        'ẖ' => "\c[0x13121]",
        'š' => "\c[0x132F9]",
        'ṯ' => "\c[0x133FF]",
        'ḏ' => "\c[0x131D3]",
        
        # Basic letters
        'j' => "\c[0x131CB]",  # Could also be 𓏭
        'y' => "\c[0x131CC]",
        'w' => "\c[0x13171]",
        'b' => "\c[0x130C0]",
        'p' => "\c[0x132AA]",
        'f' => "\c[0x130C1]",
        'm' => "\c[0x13153]",
        'n' => "\c[0x13216]",
        'r' => "\c[0x13091]",
        'h' => "\c[0x13254]",
        'z' => "\c[0x13283]",
        's' => "\c[0x13284]",
        'q' => "\c[0x131CE]",
        'k' => "\c[0x133A1]",
        'g' => "\c[0x133BC]",
        't' => "\c[0x1337F]",
        'd' => "\c[0x130A7]",
    );
}