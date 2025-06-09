use Lang::Transliterate;

unit class Lang::Transliterate::Arc::SouthArabian does Lang::Transliterate::Transliterator;

# Imperial Aramaic to South Arabian Script Conversion
# Based on the Wikipedia comparison table
# Old South Arabian (U+10A60-U+10A7F)

my %base-mappings = (
    # Imperial Aramaic to Old South Arabian mappings
    "\c[0x10840]" => "\c[0x10A71]",   # 𐡀 Aleph → 𐩱 South Arabian Aleph
    "\c[0x10841]" => "\c[0x10A68]",   # 𐡁 Beth → 𐩨 South Arabian Beth
    "\c[0x10842]" => "\c[0x10A74]",   # 𐡂 Gamal → 𐩴 South Arabian Gimel
    "\c[0x10843]" => "\c[0x10A75]",   # 𐡃 Dalath → 𐩵 South Arabian Daleth
    "\c[0x10844]" => "\c[0x10A60]",   # 𐡄 He → 𐩠 South Arabian He
    "\c[0x10845]" => "\c[0x10A65]",   # 𐡅 Waw → 𐩥 South Arabian Waw
    "\c[0x10846]" => "\c[0x10A78]",   # 𐡆 Zayn → 𐩸 South Arabian Zayin
    "\c[0x10847]" => "\c[0x10A62]",   # 𐡇 Heth → 𐩢 South Arabian Heth
    "\c[0x10848]" => "\c[0x10A77]",   # 𐡈 Teth → 𐩷 South Arabian Teth
    "\c[0x10849]" => "\c[0x10A7A]",   # 𐡉 Yodh → 𐩺 South Arabian Yodh
    "\c[0x1084A]" => "\c[0x10A6B]",   # 𐡊 Kaph → 𐩫 South Arabian Kaph
    "\c[0x1084B]" => "\c[0x10A61]",   # 𐡋 Lamadh → 𐩡 South Arabian Lamedh
    "\c[0x1084C]" => "\c[0x10A63]",   # 𐡌 Mim → 𐩣 South Arabian Mem
    "\c[0x1084D]" => "\c[0x10A6C]",   # 𐡍 Nun → 𐩬 South Arabian Nun
    "\c[0x1084E]" => "\c[0x10A6F]",   # 𐡎 Semkath → 𐩯 South Arabian Samekh
    "\c[0x1084F]" => "\c[0x10A72]",   # 𐡏 Ayn → 𐩲 South Arabian Ayin
    "\c[0x10850]" => "\c[0x10A70]",   # 𐡐 Pe → 𐩰 South Arabian Pe
    "\c[0x10851]" => "\c[0x10A6E]",   # 𐡑 Sadhe → 𐩮 South Arabian Tsade
    "\c[0x10852]" => "\c[0x10A64]",   # 𐡒 Qoph → 𐩤 South Arabian Qoph
    "\c[0x10853]" => "\c[0x10A67]",   # 𐡓 Resh → 𐩧 South Arabian Resh
    "\c[0x10854]" => "\c[0x10A66]",   # 𐡔 Shin → 𐩦 South Arabian Shin
    "\c[0x10855]" => "\c[0x10A69]",   # 𐡕 Taw → 𐩩 South Arabian Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Old South Arabian to Imperial Aramaic reverse mappings
    return (
        "\c[0x10A71]" => "\c[0x10840]",   # 𐩱 → 𐡀 South Arabian Aleph
        "\c[0x10A68]" => "\c[0x10841]",   # 𐩨 → 𐡁 South Arabian Beth
        "\c[0x10A74]" => "\c[0x10842]",   # 𐩴 → 𐡂 South Arabian Gimel
        "\c[0x10A75]" => "\c[0x10843]",   # 𐩵 → 𐡃 South Arabian Daleth
        "\c[0x10A60]" => "\c[0x10844]",   # 𐩠 → 𐡄 South Arabian He
        "\c[0x10A65]" => "\c[0x10845]",   # 𐩥 → 𐡅 South Arabian Waw
        "\c[0x10A78]" => "\c[0x10846]",   # 𐩸 → 𐡆 South Arabian Zayin
        "\c[0x10A62]" => "\c[0x10847]",   # 𐩢 → 𐡇 South Arabian Heth
        "\c[0x10A77]" => "\c[0x10848]",   # 𐩷 → 𐡈 South Arabian Teth
        "\c[0x10A7A]" => "\c[0x10849]",   # 𐩺 → 𐡉 South Arabian Yodh
        "\c[0x10A6B]" => "\c[0x1084A]",   # 𐩫 → 𐡊 South Arabian Kaph
        "\c[0x10A61]" => "\c[0x1084B]",   # 𐩡 → 𐡋 South Arabian Lamedh
        "\c[0x10A63]" => "\c[0x1084C]",   # 𐩣 → 𐡌 South Arabian Mem
        "\c[0x10A6C]" => "\c[0x1084D]",   # 𐩬 → 𐡍 South Arabian Nun
        "\c[0x10A6F]" => "\c[0x1084E]",   # 𐩯 → 𐡎 South Arabian Samekh
        "\c[0x10A72]" => "\c[0x1084F]",   # 𐩲 → 𐡏 South Arabian Ayin
        "\c[0x10A70]" => "\c[0x10850]",   # 𐩰 → 𐡐 South Arabian Pe
        "\c[0x10A6E]" => "\c[0x10851]",   # 𐩮 → 𐡑 South Arabian Tsade
        "\c[0x10A64]" => "\c[0x10852]",   # 𐩤 → 𐡒 South Arabian Qoph
        "\c[0x10A67]" => "\c[0x10853]",   # 𐩧 → 𐡓 South Arabian Resh
        "\c[0x10A66]" => "\c[0x10854]",   # 𐩦 → 𐡔 South Arabian Shin
        "\c[0x10A69]" => "\c[0x10855]",   # 𐩩 → 𐡕 South Arabian Taw
    );
}