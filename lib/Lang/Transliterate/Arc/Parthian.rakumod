use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Parthian does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Inscriptional Parthian Script Conversion
# Based on the Wikipedia comparison table
# Inscriptional Parthian alphabet (U+10B40-U+10B5F)

my %base-mappings = (
    # Imperial Aramaic to Inscriptional Parthian mappings
    "\c[0x10840]" => "\c[0x10B40]",   # 𐡀 Aleph → 𐭀 Parthian Aleph
    "\c[0x10841]" => "\c[0x10B41]",   # 𐡁 Beth → 𐭁 Parthian Beth
    "\c[0x10842]" => "\c[0x10B42]",   # 𐡂 Gamal → 𐭂 Parthian Gimel
    "\c[0x10843]" => "\c[0x10B43]",   # 𐡃 Dalath → 𐭃 Parthian Daleth
    "\c[0x10844]" => "\c[0x10B44]",   # 𐡄 He → 𐭄 Parthian He
    "\c[0x10845]" => "\c[0x10B45]",   # 𐡅 Waw → 𐭅 Parthian Waw
    "\c[0x10846]" => "\c[0x10B46]",   # 𐡆 Zayn → 𐭆 Parthian Zayin
    "\c[0x10847]" => "\c[0x10B47]",   # 𐡇 Heth → 𐭇 Parthian Heth
    "\c[0x10848]" => "\c[0x10B48]",   # 𐡈 Teth → 𐭈 Parthian Teth
    "\c[0x10849]" => "\c[0x10B49]",   # 𐡉 Yodh → 𐭉 Parthian Yodh
    "\c[0x1084A]" => "\c[0x10B4A]",   # 𐡊 Kaph → 𐭊 Parthian Kaph
    "\c[0x1084B]" => "\c[0x10B4B]",   # 𐡋 Lamadh → 𐭋 Parthian Lamedh
    "\c[0x1084C]" => "\c[0x10B4C]",   # 𐡌 Mim → 𐭌 Parthian Mem
    "\c[0x1084D]" => "\c[0x10B4D]",   # 𐡍 Nun → 𐭍 Parthian Nun
    "\c[0x1084E]" => "\c[0x10B4E]",   # 𐡎 Semkath → 𐭎 Parthian Samekh
    "\c[0x1084F]" => "\c[0x10B4F]",   # 𐡏 Ayn → 𐭏 Parthian Ayin
    "\c[0x10850]" => "\c[0x10B50]",   # 𐡐 Pe → 𐭐 Parthian Pe
    "\c[0x10851]" => "\c[0x10B51]",   # 𐡑 Sadhe → 𐭑 Parthian Tsade
    "\c[0x10852]" => "\c[0x10B52]",   # 𐡒 Qoph → 𐭒 Parthian Qoph
    "\c[0x10853]" => "\c[0x10B53]",   # 𐡓 Resh → 𐭓 Parthian Resh
    "\c[0x10854]" => "\c[0x10B54]",   # 𐡔 Shin → 𐭔 Parthian Shin
    "\c[0x10855]" => "\c[0x10B55]",   # 𐡕 Taw → 𐭕 Parthian Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Inscriptional Parthian to Imperial Aramaic reverse mappings
    return (
        "\c[0x10B40]" => "\c[0x10840]",   # 𐭀 → 𐡀 Parthian Aleph
        "\c[0x10B41]" => "\c[0x10841]",   # 𐭁 → 𐡁 Parthian Beth
        "\c[0x10B42]" => "\c[0x10842]",   # 𐭂 → 𐡂 Parthian Gimel
        "\c[0x10B43]" => "\c[0x10843]",   # 𐭃 → 𐡃 Parthian Daleth
        "\c[0x10B44]" => "\c[0x10844]",   # 𐭄 → 𐡄 Parthian He
        "\c[0x10B45]" => "\c[0x10845]",   # 𐭅 → 𐡅 Parthian Waw
        "\c[0x10B46]" => "\c[0x10846]",   # 𐭆 → 𐡆 Parthian Zayin
        "\c[0x10B47]" => "\c[0x10847]",   # 𐭇 → 𐡇 Parthian Heth
        "\c[0x10B48]" => "\c[0x10848]",   # 𐭈 → 𐡈 Parthian Teth
        "\c[0x10B49]" => "\c[0x10849]",   # 𐭉 → 𐡉 Parthian Yodh
        "\c[0x10B4A]" => "\c[0x1084A]",   # 𐭊 → 𐡊 Parthian Kaph
        "\c[0x10B4B]" => "\c[0x1084B]",   # 𐭋 → 𐡋 Parthian Lamedh
        "\c[0x10B4C]" => "\c[0x1084C]",   # 𐭌 → 𐡌 Parthian Mem
        "\c[0x10B4D]" => "\c[0x1084D]",   # 𐭍 → 𐡍 Parthian Nun
        "\c[0x10B4E]" => "\c[0x1084E]",   # 𐭎 → 𐡎 Parthian Samekh
        "\c[0x10B4F]" => "\c[0x1084F]",   # 𐭏 → 𐡏 Parthian Ayin
        "\c[0x10B50]" => "\c[0x10850]",   # 𐭐 → 𐡐 Parthian Pe
        "\c[0x10B51]" => "\c[0x10851]",   # 𐭑 → 𐡑 Parthian Tsade
        "\c[0x10B52]" => "\c[0x10852]",   # 𐭒 → 𐡒 Parthian Qoph
        "\c[0x10B53]" => "\c[0x10853]",   # 𐭓 → 𐡓 Parthian Resh
        "\c[0x10B54]" => "\c[0x10854]",   # 𐭔 → 𐡔 Parthian Shin
        "\c[0x10B55]" => "\c[0x10855]",   # 𐭕 → 𐡕 Parthian Taw
    );
}