use Lang::Transliterate;

unit class Lang::Transliterate::Arc::ImperialAramaicToPhoenician does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Phoenician Script Conversion
# Based on the Wikipedia table - both scripts share the same Northwest Semitic origin
my %base-mappings = (
    # Imperial Aramaic to Phoenician
    "\c[0x10840]" => "\c[0x10900]",  # 𐡀 → 𐤀 Aleph
    "\c[0x10841]" => "\c[0x10901]",  # 𐡁 → 𐤁 Beth
    "\c[0x10842]" => "\c[0x10902]",  # 𐡂 → 𐤂 Gimel
    "\c[0x10843]" => "\c[0x10903]",  # 𐡃 → 𐤃 Daleth
    "\c[0x10844]" => "\c[0x10904]",  # 𐡄 → 𐤄 He
    "\c[0x10845]" => "\c[0x10905]",  # 𐡅 → 𐤅 Waw
    "\c[0x10846]" => "\c[0x10906]",  # 𐡆 → 𐤆 Zayin
    "\c[0x10847]" => "\c[0x10907]",  # 𐡇 → 𐤇 Heth
    "\c[0x10848]" => "\c[0x10908]",  # 𐡈 → 𐤈 Teth
    "\c[0x10849]" => "\c[0x10909]",  # 𐡉 → 𐤉 Yodh
    "\c[0x1084A]" => "\c[0x1090A]",  # 𐡊 → 𐤊 Kaph
    "\c[0x1084B]" => "\c[0x1090B]",  # 𐡋 → 𐤋 Lamedh
    "\c[0x1084C]" => "\c[0x1090C]",  # 𐡌 → 𐤌 Mim
    "\c[0x1084D]" => "\c[0x1090D]",  # 𐡍 → 𐤍 Nun
    "\c[0x1084E]" => "\c[0x1090E]",  # 𐡎 → 𐤎 Samekh
    "\c[0x1084F]" => "\c[0x1090F]",  # 𐡏 → 𐤏 Ayin
    "\c[0x10850]" => "\c[0x10910]",  # 𐡐 → 𐤐 Pe
    "\c[0x10851]" => "\c[0x10911]",  # 𐡑 → 𐤑 Tsade
    "\c[0x10852]" => "\c[0x10912]",  # 𐡒 → 𐤒 Qoph
    "\c[0x10853]" => "\c[0x10913]",  # 𐡓 → 𐤓 Resh
    "\c[0x10854]" => "\c[0x10914]",  # 𐡔 → 𐤔 Shin
    "\c[0x10855]" => "\c[0x10915]",  # 𐡕 → 𐤕 Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Phoenician to Imperial Aramaic reverse mappings
    return (
        "\c[0x10900]" => "\c[0x10840]",  # 𐤀 → 𐡀
        "\c[0x10901]" => "\c[0x10841]",  # 𐤁 → 𐡁
        "\c[0x10902]" => "\c[0x10842]",  # 𐤂 → 𐡂
        "\c[0x10903]" => "\c[0x10843]",  # 𐤃 → 𐡃
        "\c[0x10904]" => "\c[0x10844]",  # 𐤄 → 𐡄
        "\c[0x10905]" => "\c[0x10845]",  # 𐤅 → 𐡅
        "\c[0x10906]" => "\c[0x10846]",  # 𐤆 → 𐡆
        "\c[0x10907]" => "\c[0x10847]",  # 𐤇 → 𐡇
        "\c[0x10908]" => "\c[0x10848]",  # 𐤈 → 𐡈
        "\c[0x10909]" => "\c[0x10849]",  # 𐤉 → 𐡉
        "\c[0x1090A]" => "\c[0x1084A]",  # 𐤊 → 𐡊
        "\c[0x1090B]" => "\c[0x1084B]",  # 𐤋 → 𐡋
        "\c[0x1090C]" => "\c[0x1084C]",  # 𐤌 → 𐡌
        "\c[0x1090D]" => "\c[0x1084D]",  # 𐤍 → 𐡍
        "\c[0x1090E]" => "\c[0x1084E]",  # 𐤎 → 𐡎
        "\c[0x1090F]" => "\c[0x1084F]",  # 𐤏 → 𐡏
        "\c[0x10910]" => "\c[0x10850]",  # 𐤐 → 𐡐
        "\c[0x10911]" => "\c[0x10851]",  # 𐤑 → 𐡑
        "\c[0x10912]" => "\c[0x10852]",  # 𐤒 → 𐡒
        "\c[0x10913]" => "\c[0x10853]",  # 𐤓 → 𐡓
        "\c[0x10914]" => "\c[0x10854]",  # 𐤔 → 𐡔
        "\c[0x10915]" => "\c[0x10855]",  # 𐤕 → 𐡕
    );
}