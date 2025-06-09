use Lang::Transliterate;

unit class Lang::Transliterate::Arc::ImperialToArabic does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Arabic Script Conversion
# Based on the Wikipedia table of Imperial Aramaic letters
my %base-mappings = (
    # Imperial Aramaic to Arabic
    "\c[0x10840]" => "\c[0x0627]",  # 𐡀 → ا Alif
    "\c[0x10841]" => "\c[0x0628]",  # 𐡁 → ب Ba
    "\c[0x10842]" => "\c[0x062C]",  # 𐡂 → ج Jim
    "\c[0x10843]" => "\c[0x062F]",  # 𐡃 → د Dal (could also be ذ dhal)
    "\c[0x10844]" => "\c[0x0647]",  # 𐡄 → ه Ha
    "\c[0x10845]" => "\c[0x0648]",  # 𐡅 → و Waw
    "\c[0x10846]" => "\c[0x0632]",  # 𐡆 → ز Zayn
    "\c[0x10847]" => "\c[0x062D]",  # 𐡇 → ح Ha (could also be خ kha)
    "\c[0x10848]" => "\c[0x0637]",  # 𐡈 → ط Ta (could also be ظ za)
    "\c[0x10849]" => "\c[0x064A]",  # 𐡉 → ي Ya
    "\c[0x1084A]" => "\c[0x0643]",  # 𐡊 → ك Kaf
    "\c[0x1084B]" => "\c[0x0644]",  # 𐡋 → ل Lam
    "\c[0x1084C]" => "\c[0x0645]",  # 𐡌 → م Mim
    "\c[0x1084D]" => "\c[0x0646]",  # 𐡍 → ن Nun
    "\c[0x1084E]" => "\c[0x0633]",  # 𐡎 → س Sin
    "\c[0x1084F]" => "\c[0x0639]",  # 𐡏 → ع Ayn (could also be غ ghayn)
    "\c[0x10850]" => "\c[0x0641]",  # 𐡐 → ف Fa
    "\c[0x10851]" => "\c[0x0635]",  # 𐡑 → ص Sad (could also be ض dad)
    "\c[0x10852]" => "\c[0x0642]",  # 𐡒 → ق Qaf
    "\c[0x10853]" => "\c[0x0631]",  # 𐡓 → ر Ra
    "\c[0x10854]" => "\c[0x0634]",  # 𐡔 → ش Shin
    "\c[0x10855]" => "\c[0x062A]",  # 𐡕 → ت Ta (could also be ث tha)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Arabic to Imperial Aramaic reverse mappings
    # Note: Some Arabic letters have multiple possible sources
    return (
        "\c[0x0627]" => "\c[0x10840]",  # ا → 𐡀
        "\c[0x0628]" => "\c[0x10841]",  # ب → 𐡁
        "\c[0x062C]" => "\c[0x10842]",  # ج → 𐡂
        "\c[0x062F]" => "\c[0x10843]",  # د → 𐡃
        "\c[0x0630]" => "\c[0x10843]",  # ذ → 𐡃 (dhal also from daleth)
        "\c[0x0647]" => "\c[0x10844]",  # ه → 𐡄
        "\c[0x0648]" => "\c[0x10845]",  # و → 𐡅
        "\c[0x0632]" => "\c[0x10846]",  # ز → 𐡆
        "\c[0x062D]" => "\c[0x10847]",  # ح → 𐡇
        "\c[0x062E]" => "\c[0x10847]",  # خ → 𐡇 (kha also from heth)
        "\c[0x0637]" => "\c[0x10848]",  # ط → 𐡈
        "\c[0x0638]" => "\c[0x10848]",  # ظ → 𐡈 (za also from teth)
        "\c[0x064A]" => "\c[0x10849]",  # ي → 𐡉
        "\c[0x0643]" => "\c[0x1084A]",  # ك → 𐡊
        "\c[0x0644]" => "\c[0x1084B]",  # ل → 𐡋
        "\c[0x0645]" => "\c[0x1084C]",  # م → 𐡌
        "\c[0x0646]" => "\c[0x1084D]",  # ن → 𐡍
        "\c[0x0633]" => "\c[0x1084E]",  # س → 𐡎
        "\c[0x0639]" => "\c[0x1084F]",  # ع → 𐡏
        "\c[0x063A]" => "\c[0x1084F]",  # غ → 𐡏 (ghayn also from ayin)
        "\c[0x0641]" => "\c[0x10850]",  # ف → 𐡐
        "\c[0x0635]" => "\c[0x10851]",  # ص → 𐡑
        "\c[0x0636]" => "\c[0x10851]",  # ض → 𐡑 (dad also from tsade)
        "\c[0x0642]" => "\c[0x10852]",  # ق → 𐡒
        "\c[0x0631]" => "\c[0x10853]",  # ر → 𐡓
        "\c[0x0634]" => "\c[0x10854]",  # ش → 𐡔
        "\c[0x062A]" => "\c[0x10855]",  # ت → 𐡕
        "\c[0x062B]" => "\c[0x10855]",  # ث → 𐡕 (tha also from taw)
    );
}

# Arabic requires special handling for contextual forms
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        
        if %mappings{$char}:exists {
            # For simplicity, we're just doing direct mapping
            # In a more complete implementation, we would handle:
            # - Initial, medial, final, and isolated forms
            # - Ligatures
            # - Vowel marks (harakat)
            $result ~= %mappings{$char};
        } else {
            $result ~= $char;
        }
        
        $i++;
    }
    
    return $result;
}