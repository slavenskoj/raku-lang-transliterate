use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Cyrillic does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Cyrillic Script Conversion
# Based on the Wikipedia comparison table and Cyrillic derivation from Greek

my %base-mappings = (
    # Imperial Aramaic to Cyrillic mappings
    "\c[0x10840]" => "\c[0x0410]",   # 𐡀 Aleph → А A
    "\c[0x10841]" => "\c[0x0411]",   # 𐡁 Beth → Б B (also В V)
    "\c[0x10842]" => "\c[0x0413]",   # 𐡂 Gamal → Г G (also Ґ Ґ)
    "\c[0x10843]" => "\c[0x0414]",   # 𐡃 Dalath → Д D
    "\c[0x10844]" => "\c[0x0415]",   # 𐡄 He → Е E (also Є Є, Ё Ё, Э Э)
    "\c[0x10845]" => "\c[0x0423]",   # 𐡅 Waw → У U (also Ў Ў, Ѵ Ѵ)
    "\c[0x10846]" => "\c[0x0417]",   # 𐡆 Zayn → З Z
    "\c[0x10847]" => "\c[0x0418]",   # 𐡇 Heth → И I (also Й Й)
    "\c[0x10848]" => "\c[0x0424]",   # 𐡈 Teth → Ф F (also archaic Ѳ Ѳ)
    "\c[0x10849]" => "\c[0x0406]",   # 𐡉 Yodh → І I (also Ї Ї, Ј Ј)
    "\c[0x1084A]" => "\c[0x041A]",   # 𐡊 Kaph → К K
    "\c[0x1084B]" => "\c[0x041B]",   # 𐡋 Lamadh → Л L
    "\c[0x1084C]" => "\c[0x041C]",   # 𐡌 Mim → М M
    "\c[0x1084D]" => "\c[0x041D]",   # 𐡍 Nun → Н N
    "\c[0x1084E]" => "\c[0x046E]",   # 𐡎 Semkath → Ѯ Ksi (archaic)
    "\c[0x1084F]" => "\c[0x041E]",   # 𐡏 Ayn → О O (also Ѡ Ѡ omega)
    "\c[0x10850]" => "\c[0x041F]",   # 𐡐 Pe → П P
    "\c[0x10851]" => "\c[0x0426]",   # 𐡑 Sadhe → Ц C (also Ч Ч, Џ Џ)
    "\c[0x10852]" => "\c[0x0424]",   # 𐡒 Qoph → Ф F (archaic Ҁ Ҁ)
    "\c[0x10853]" => "\c[0x0420]",   # 𐡓 Resh → Р R
    "\c[0x10854]" => "\c[0x0421]",   # 𐡔 Shin → С S (also Ш Ш, Щ Щ)
    "\c[0x10855]" => "\c[0x0422]",   # 𐡕 Taw → Т T
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Cyrillic to Imperial Aramaic reverse mappings
    return (
        "\c[0x0410]" => "\c[0x10840]",   # А → 𐡀
        "\c[0x0430]" => "\c[0x10840]",   # а → 𐡀
        "\c[0x0411]" => "\c[0x10841]",   # Б → 𐡁
        "\c[0x0431]" => "\c[0x10841]",   # б → 𐡁
        "\c[0x0412]" => "\c[0x10841]",   # В → 𐡁 (also from beth)
        "\c[0x0432]" => "\c[0x10841]",   # в → 𐡁
        "\c[0x0413]" => "\c[0x10842]",   # Г → 𐡂
        "\c[0x0433]" => "\c[0x10842]",   # г → 𐡂
        "\c[0x0490]" => "\c[0x10842]",   # Ґ → 𐡂
        "\c[0x0491]" => "\c[0x10842]",   # ґ → 𐡂
        "\c[0x0414]" => "\c[0x10843]",   # Д → 𐡃
        "\c[0x0434]" => "\c[0x10843]",   # д → 𐡃
        "\c[0x0415]" => "\c[0x10844]",   # Е → 𐡄
        "\c[0x0435]" => "\c[0x10844]",   # е → 𐡄
        "\c[0x0401]" => "\c[0x10844]",   # Ё → 𐡄
        "\c[0x0451]" => "\c[0x10844]",   # ё → 𐡄
        "\c[0x0404]" => "\c[0x10844]",   # Є → 𐡄
        "\c[0x0454]" => "\c[0x10844]",   # є → 𐡄
        "\c[0x042D]" => "\c[0x10844]",   # Э → 𐡄
        "\c[0x044D]" => "\c[0x10844]",   # э → 𐡄
        "\c[0x0423]" => "\c[0x10845]",   # У → 𐡅
        "\c[0x0443]" => "\c[0x10845]",   # у → 𐡅
        "\c[0x040E]" => "\c[0x10845]",   # Ў → 𐡅
        "\c[0x045E]" => "\c[0x10845]",   # ў → 𐡅
        "\c[0x0474]" => "\c[0x10845]",   # Ѵ → 𐡅
        "\c[0x0475]" => "\c[0x10845]",   # ѵ → 𐡅
        "\c[0x0417]" => "\c[0x10846]",   # З → 𐡆
        "\c[0x0437]" => "\c[0x10846]",   # з → 𐡆
        "\c[0x0418]" => "\c[0x10847]",   # И → 𐡇
        "\c[0x0438]" => "\c[0x10847]",   # и → 𐡇
        "\c[0x0419]" => "\c[0x10847]",   # Й → 𐡇
        "\c[0x0439]" => "\c[0x10847]",   # й → 𐡇
        "\c[0x0424]" => "\c[0x10848]",   # Ф → 𐡈 (also qoph)
        "\c[0x0444]" => "\c[0x10848]",   # ф → 𐡈
        "\c[0x0472]" => "\c[0x10848]",   # Ѳ → 𐡈 (archaic theta)
        "\c[0x0473]" => "\c[0x10848]",   # ѳ → 𐡈
        "\c[0x0406]" => "\c[0x10849]",   # І → 𐡉
        "\c[0x0456]" => "\c[0x10849]",   # і → 𐡉
        "\c[0x0407]" => "\c[0x10849]",   # Ї → 𐡉
        "\c[0x0457]" => "\c[0x10849]",   # ї → 𐡉
        "\c[0x0408]" => "\c[0x10849]",   # Ј → 𐡉
        "\c[0x0458]" => "\c[0x10849]",   # ј → 𐡉
        "\c[0x041A]" => "\c[0x1084A]",   # К → 𐡊
        "\c[0x043A]" => "\c[0x1084A]",   # к → 𐡊
        "\c[0x041B]" => "\c[0x1084B]",   # Л → 𐡋
        "\c[0x043B]" => "\c[0x1084B]",   # л → 𐡋
        "\c[0x041C]" => "\c[0x1084C]",   # М → 𐡌
        "\c[0x043C]" => "\c[0x1084C]",   # м → 𐡌
        "\c[0x041D]" => "\c[0x1084D]",   # Н → 𐡍
        "\c[0x043D]" => "\c[0x1084D]",   # н → 𐡍
        "\c[0x046E]" => "\c[0x1084E]",   # Ѯ → 𐡎
        "\c[0x046F]" => "\c[0x1084E]",   # ѯ → 𐡎
        "\c[0x041E]" => "\c[0x1084F]",   # О → 𐡏
        "\c[0x043E]" => "\c[0x1084F]",   # о → 𐡏
        "\c[0x0460]" => "\c[0x1084F]",   # Ѡ → 𐡏 (omega)
        "\c[0x0461]" => "\c[0x1084F]",   # ѡ → 𐡏
        "\c[0x041F]" => "\c[0x10850]",   # П → 𐡐
        "\c[0x043F]" => "\c[0x10850]",   # п → 𐡐
        "\c[0x0426]" => "\c[0x10851]",   # Ц → 𐡑
        "\c[0x0446]" => "\c[0x10851]",   # ц → 𐡑
        "\c[0x0427]" => "\c[0x10851]",   # Ч → 𐡑
        "\c[0x0447]" => "\c[0x10851]",   # ч → 𐡑
        "\c[0x040F]" => "\c[0x10851]",   # Џ → 𐡑
        "\c[0x045F]" => "\c[0x10851]",   # џ → 𐡑
        "\c[0x0480]" => "\c[0x10852]",   # Ҁ → 𐡒 (archaic qoppa)
        "\c[0x0481]" => "\c[0x10852]",   # ҁ → 𐡒
        "\c[0x0420]" => "\c[0x10853]",   # Р → 𐡓
        "\c[0x0440]" => "\c[0x10853]",   # р → 𐡓
        "\c[0x0421]" => "\c[0x10854]",   # С → 𐡔
        "\c[0x0441]" => "\c[0x10854]",   # с → 𐡔
        "\c[0x0428]" => "\c[0x10854]",   # Ш → 𐡔
        "\c[0x0448]" => "\c[0x10854]",   # ш → 𐡔
        "\c[0x0429]" => "\c[0x10854]",   # Щ → 𐡔
        "\c[0x0449]" => "\c[0x10854]",   # щ → 𐡔
        "\c[0x0422]" => "\c[0x10855]",   # Т → 𐡕
        "\c[0x0442]" => "\c[0x10855]",   # т → 𐡕
    );
}

# Cyrillic uses vowels as separate letters, so we need to strip them when converting back
method detransliterate-context-aware(Str $text, :%reverse-mappings = self.get-reverse-mappings().Hash --> Str) {
    # Strip all Cyrillic vowels (А, Е, Ё, И, І, О, У, Ы, Э, Ю, Я and their variants)
    my $consonantal = $text.subst(/<[\c[0x0410]\c[0x0430]\c[0x0415]\c[0x0435]\c[0x0401]\c[0x0451]\c[0x0418]\c[0x0438]\c[0x0406]\c[0x0456]\c[0x0407]\c[0x0457]\c[0x041E]\c[0x043E]\c[0x0423]\c[0x0443]\c[0x042B]\c[0x044B]\c[0x042D]\c[0x044D]\c[0x042E]\c[0x044E]\c[0x042F]\c[0x044F]\c[0x0404]\c[0x0454]\c[0x040E]\c[0x045E]\c[0x0474]\c[0x0475]\c[0x0460]\c[0x0461]]>/, '', :g);
    
    # Then apply the standard detransliteration
    return self.detransliterate($consonantal, :%reverse-mappings);
}