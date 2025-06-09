use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Nabataean does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Nabataean Script Conversion
# Based on the Wikipedia comparison table
# Nabataean alphabet (U+10880-U+108AF)

my %base-mappings = (
    # Imperial Aramaic to Nabataean mappings
    "\c[0x10840]" => "\c[0x10880]",   # 𐡀 Aleph → 𐢀 Nabataean Aleph
    "\c[0x10841]" => "\c[0x10881]",   # 𐡁 Beth → 𐢁 Nabataean Beth
    "\c[0x10842]" => "\c[0x10882]",   # 𐡂 Gamal → 𐢂 Nabataean Gimel
    "\c[0x10843]" => "\c[0x10883]",   # 𐡃 Dalath → 𐢃 Nabataean Daleth
    "\c[0x10844]" => "\c[0x10884]",   # 𐡄 He → 𐢄 Nabataean He
    "\c[0x10845]" => "\c[0x10885]",   # 𐡅 Waw → 𐢅 Nabataean Waw
    "\c[0x10846]" => "\c[0x10886]",   # 𐡆 Zayn → 𐢆 Nabataean Zayin
    "\c[0x10847]" => "\c[0x10887]",   # 𐡇 Heth → 𐢇 Nabataean Heth
    "\c[0x10848]" => "\c[0x10888]",   # 𐡈 Teth → 𐢈 Nabataean Teth
    "\c[0x10849]" => "\c[0x10889]",   # 𐡉 Yodh → 𐢉 Nabataean Yodh
    "\c[0x1084A]" => "\c[0x1088A]",   # 𐡊 Kaph → 𐢊 Nabataean Kaph
    "\c[0x1084B]" => "\c[0x1088B]",   # 𐡋 Lamadh → 𐢋 Nabataean Lamedh
    "\c[0x1084C]" => "\c[0x1088C]",   # 𐡌 Mim → 𐢌 Nabataean Mem
    "\c[0x1084D]" => "\c[0x1088D]",   # 𐡍 Nun → 𐢍 Nabataean Nun
    "\c[0x1084E]" => "\c[0x1088E]",   # 𐡎 Semkath → 𐢎 Nabataean Samekh
    "\c[0x1084F]" => "\c[0x1088F]",   # 𐡏 Ayn → 𐢏 Nabataean Ayin
    "\c[0x10850]" => "\c[0x10890]",   # 𐡐 Pe → 𐢐 Nabataean Pe
    "\c[0x10851]" => "\c[0x10891]",   # 𐡑 Sadhe → 𐢑 Nabataean Tsade
    "\c[0x10852]" => "\c[0x10892]",   # 𐡒 Qoph → 𐢒 Nabataean Qoph
    "\c[0x10853]" => "\c[0x10893]",   # 𐡓 Resh → 𐢓 Nabataean Resh
    "\c[0x10854]" => "\c[0x10894]",   # 𐡔 Shin → 𐢔 Nabataean Shin
    "\c[0x10855]" => "\c[0x10895]",   # 𐡕 Taw → 𐢕 Nabataean Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Nabataean to Imperial Aramaic reverse mappings
    return (
        "\c[0x10880]" => "\c[0x10840]",   # 𐢀 → 𐡀 Nabataean Aleph
        "\c[0x10881]" => "\c[0x10841]",   # 𐢁 → 𐡁 Nabataean Beth
        "\c[0x10882]" => "\c[0x10842]",   # 𐢂 → 𐡂 Nabataean Gimel
        "\c[0x10883]" => "\c[0x10843]",   # 𐢃 → 𐡃 Nabataean Daleth
        "\c[0x10884]" => "\c[0x10844]",   # 𐢄 → 𐡄 Nabataean He
        "\c[0x10885]" => "\c[0x10845]",   # 𐢅 → 𐡅 Nabataean Waw
        "\c[0x10886]" => "\c[0x10846]",   # 𐢆 → 𐡆 Nabataean Zayin
        "\c[0x10887]" => "\c[0x10847]",   # 𐢇 → 𐡇 Nabataean Heth
        "\c[0x10888]" => "\c[0x10848]",   # 𐢈 → 𐡈 Nabataean Teth
        "\c[0x10889]" => "\c[0x10849]",   # 𐢉 → 𐡉 Nabataean Yodh
        "\c[0x1088A]" => "\c[0x1084A]",   # 𐢊 → 𐡊 Nabataean Kaph
        "\c[0x1088B]" => "\c[0x1084B]",   # 𐢋 → 𐡋 Nabataean Lamedh
        "\c[0x1088C]" => "\c[0x1084C]",   # 𐢌 → 𐡌 Nabataean Mem
        "\c[0x1088D]" => "\c[0x1084D]",   # 𐢍 → 𐡍 Nabataean Nun
        "\c[0x1088E]" => "\c[0x1084E]",   # 𐢎 → 𐡎 Nabataean Samekh
        "\c[0x1088F]" => "\c[0x1084F]",   # 𐢏 → 𐡏 Nabataean Ayin
        "\c[0x10890]" => "\c[0x10850]",   # 𐢐 → 𐡐 Nabataean Pe
        "\c[0x10891]" => "\c[0x10851]",   # 𐢑 → 𐡑 Nabataean Tsade
        "\c[0x10892]" => "\c[0x10852]",   # 𐢒 → 𐡒 Nabataean Qoph
        "\c[0x10893]" => "\c[0x10853]",   # 𐢓 → 𐡓 Nabataean Resh
        "\c[0x10894]" => "\c[0x10854]",   # 𐢔 → 𐡔 Nabataean Shin
        "\c[0x10895]" => "\c[0x10855]",   # 𐢕 → 𐡕 Nabataean Taw
    );
}