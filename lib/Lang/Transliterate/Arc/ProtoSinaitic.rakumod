use Lang::Transliterate;

unit class Lang::Transliterate::Arc::ProtoSinaitic does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Proto-Sinaitic Script Conversion
# Based on the Wikipedia comparison table
# Note: Proto-Sinaitic doesn't have dedicated Unicode block
# Using descriptive transliteration based on Egyptian hieroglyphic origins

my %base-mappings = (
    # Imperial Aramaic to Proto-Sinaitic mappings
    # Using symbolic representations since Unicode lacks Proto-Sinaitic block
    "\c[0x10840]" => "𓃾",    # 𐡀 Aleph → ox head (Proto-Sinaitic aleph)
    "\c[0x10841]" => "𓉐",    # 𐡁 Beth → house (Proto-Sinaitic beth)
    "\c[0x10842]" => "𓃡",    # 𐡂 Gamal → throw stick/camel (Proto-Sinaitic gimel)
    "\c[0x10843]" => "𓇯",    # 𐡃 Dalath → door (Proto-Sinaitic daleth)
    "\c[0x10844]" => "𓀠",    # 𐡄 He → man with raised arms (Proto-Sinaitic he)
    "\c[0x10845]" => "𓏲",    # 𐡅 Waw → hook/peg (Proto-Sinaitic waw)
    "\c[0x10846]" => "𓏭",    # 𐡆 Zayn → weapon/sword (Proto-Sinaitic zayin)
    "\c[0x10847]" => "𓉗",    # 𐡇 Heth → fence/courtyard (Proto-Sinaitic heth)
    "\c[0x10848]" => "𓇰",    # 𐡈 Teth → wheel/cart (Proto-Sinaitic teth)
    "\c[0x10849]" => "𓂝",    # 𐡉 Yodh → arm/hand (Proto-Sinaitic yodh)
    "\c[0x1084A]" => "𓂧",    # 𐡊 Kaph → palm of hand (Proto-Sinaitic kaph)
    "\c[0x1084B]" => "𓌳",    # 𐡋 Lamadh → shepherd's crook (Proto-Sinaitic lamedh)
    "\c[0x1084C]" => "𓈖",    # 𐡌 Mim → water (Proto-Sinaitic mem)
    "\c[0x1084D]" => "𓆓",    # 𐡍 Nun → snake/fish (Proto-Sinaitic nun)
    "\c[0x1084E]" => "𓊃",    # 𐡎 Semkath → fish/support (Proto-Sinaitic samekh)
    "\c[0x1084F]" => "𓁹",    # 𐡏 Ayn → eye (Proto-Sinaitic ayin)
    "\c[0x10850]" => "𓂋",    # 𐡐 Pe → mouth (Proto-Sinaitic pe)
    "\c[0x10851]" => "𓈎",    # 𐡑 Sadhe → plant/papyrus (Proto-Sinaitic tsade)
    "\c[0x10852]" => "𓈎",    # 𐡒 Qoph → back of head (Proto-Sinaitic qoph)
    "\c[0x10853]" => "𓁶",    # 𐡓 Resh → head (Proto-Sinaitic resh)
    "\c[0x10854]" => "𓌙",    # 𐡔 Shin → tooth/sharp (Proto-Sinaitic shin)
    "\c[0x10855]" => "𓏴",    # 𐡕 Taw → mark/cross (Proto-Sinaitic taw)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Proto-Sinaitic to Imperial Aramaic reverse mappings
    return (
        "𓃾" => "\c[0x10840]",   # ox head → 𐡀 Aleph
        "𓉐" => "\c[0x10841]",   # house → 𐡁 Beth
        "𓃡" => "\c[0x10842]",   # throw stick → 𐡂 Gamal
        "𓇯" => "\c[0x10843]",   # door → 𐡃 Dalath
        "𓀠" => "\c[0x10844]",   # man with arms → 𐡄 He
        "𓏲" => "\c[0x10845]",   # hook → 𐡅 Waw
        "𓏭" => "\c[0x10846]",   # weapon → 𐡆 Zayn
        "𓉗" => "\c[0x10847]",   # fence → 𐡇 Heth
        "𓇰" => "\c[0x10848]",   # wheel → 𐡈 Teth
        "𓂝" => "\c[0x10849]",   # arm → 𐡉 Yodh
        "𓂧" => "\c[0x1084A]",   # palm → 𐡊 Kaph
        "𓌳" => "\c[0x1084B]",   # crook → 𐡋 Lamadh
        "𓈖" => "\c[0x1084C]",   # water → 𐡌 Mim
        "𓆓" => "\c[0x1084D]",   # snake → 𐡍 Nun
        "𓊃" => "\c[0x1084E]",   # fish → 𐡎 Semkath
        "𓁹" => "\c[0x1084F]",   # eye → 𐡏 Ayn
        "𓂋" => "\c[0x10850]",   # mouth → 𐡐 Pe
        "𓈎" => "\c[0x10851]",   # plant → 𐡑 Sadhe (also used for Qoph)
        "𓁶" => "\c[0x10853]",   # head → 𐡓 Resh
        "𓌙" => "\c[0x10854]",   # tooth → 𐡔 Shin
        "𓏴" => "\c[0x10855]",   # mark → 𐡕 Taw
    );
}