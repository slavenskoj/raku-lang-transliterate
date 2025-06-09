use Lang::Transliterate;

unit class Lang::Transliterate::Arc::ImperialAramaicToSyriac does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Syriac Script Conversion
# Based on the Wikipedia table of Imperial Aramaic letters
my %base-mappings = (
    # Imperial Aramaic to Syriac
    "\c[0x10840]" => "\c[0x0710]",  # 𐡀 → ܐ Alaph
    "\c[0x10841]" => "\c[0x0712]",  # 𐡁 → ܒ Beth
    "\c[0x10842]" => "\c[0x0713]",  # 𐡂 → ܓ Gamal
    "\c[0x10843]" => "\c[0x0715]",  # 𐡃 → ܕ Dalath
    "\c[0x10844]" => "\c[0x0717]",  # 𐡄 → ܗ He
    "\c[0x10845]" => "\c[0x0718]",  # 𐡅 → ܘ Waw
    "\c[0x10846]" => "\c[0x0719]",  # 𐡆 → ܙ Zayn
    "\c[0x10847]" => "\c[0x071A]",  # 𐡇 → ܚ Heth
    "\c[0x10848]" => "\c[0x071B]",  # 𐡈 → ܛ Teth
    "\c[0x10849]" => "\c[0x071D]",  # 𐡉 → ܝ Yodh
    "\c[0x1084A]" => "\c[0x071F]",  # 𐡊 → ܟ Kaph
    "\c[0x1084B]" => "\c[0x0720]",  # 𐡋 → ܠ Lamadh
    "\c[0x1084C]" => "\c[0x0721]",  # 𐡌 → ܡ Mim
    "\c[0x1084D]" => "\c[0x0722]",  # 𐡍 → ܢ Nun
    "\c[0x1084E]" => "\c[0x0723]",  # 𐡎 → ܣ Semkath
    "\c[0x1084F]" => "\c[0x0725]",  # 𐡏 → ܥ Ayn
    "\c[0x10850]" => "\c[0x0726]",  # 𐡐 → ܦ Pe
    "\c[0x10851]" => "\c[0x0728]",  # 𐡑 → ܨ Sadhe
    "\c[0x10852]" => "\c[0x0729]",  # 𐡒 → ܩ Qoph
    "\c[0x10853]" => "\c[0x072A]",  # 𐡓 → ܪ Resh
    "\c[0x10854]" => "\c[0x072B]",  # 𐡔 → ܫ Shin
    "\c[0x10855]" => "\c[0x072C]",  # 𐡕 → ܬ Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Syriac to Imperial Aramaic reverse mappings
    return (
        "\c[0x0710]" => "\c[0x10840]",  # ܐ → 𐡀
        "\c[0x0712]" => "\c[0x10841]",  # ܒ → 𐡁
        "\c[0x0713]" => "\c[0x10842]",  # ܓ → 𐡂
        "\c[0x0715]" => "\c[0x10843]",  # ܕ → 𐡃
        "\c[0x0717]" => "\c[0x10844]",  # ܗ → 𐡄
        "\c[0x0718]" => "\c[0x10845]",  # ܘ → 𐡅
        "\c[0x0719]" => "\c[0x10846]",  # ܙ → 𐡆
        "\c[0x071A]" => "\c[0x10847]",  # ܚ → 𐡇
        "\c[0x071B]" => "\c[0x10848]",  # ܛ → 𐡈
        "\c[0x071D]" => "\c[0x10849]",  # ܝ → 𐡉
        "\c[0x071F]" => "\c[0x1084A]",  # ܟ → 𐡊
        "\c[0x0720]" => "\c[0x1084B]",  # ܠ → 𐡋
        "\c[0x0721]" => "\c[0x1084C]",  # ܡ → 𐡌
        "\c[0x0722]" => "\c[0x1084D]",  # ܢ → 𐡍
        "\c[0x0723]" => "\c[0x1084E]",  # ܣ → 𐡎
        "\c[0x0725]" => "\c[0x1084F]",  # ܥ → 𐡏
        "\c[0x0726]" => "\c[0x10850]",  # ܦ → 𐡐
        "\c[0x0728]" => "\c[0x10851]",  # ܨ → 𐡑
        "\c[0x0729]" => "\c[0x10852]",  # ܩ → 𐡒
        "\c[0x072A]" => "\c[0x10853]",  # ܪ → 𐡓
        "\c[0x072B]" => "\c[0x10854]",  # ܫ → 𐡔
        "\c[0x072C]" => "\c[0x10855]",  # ܬ → 𐡕
    );
}