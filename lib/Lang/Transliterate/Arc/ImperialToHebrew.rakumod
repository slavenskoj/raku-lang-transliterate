use Lang::Transliterate;

unit class Lang::Transliterate::Arc::ImperialToHebrew does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Hebrew Script Conversion
# Based on the Wikipedia table of Imperial Aramaic letters
my %base-mappings = (
    # Imperial Aramaic to Hebrew
    "\c[0x10840]" => "\c[0x05D0]",  # 𐡀 → א Aleph
    "\c[0x10841]" => "\c[0x05D1]",  # 𐡁 → ב Beth
    "\c[0x10842]" => "\c[0x05D2]",  # 𐡂 → ג Gimel
    "\c[0x10843]" => "\c[0x05D3]",  # 𐡃 → ד Daleth
    "\c[0x10844]" => "\c[0x05D4]",  # 𐡄 → ה He
    "\c[0x10845]" => "\c[0x05D5]",  # 𐡅 → ו Waw
    "\c[0x10846]" => "\c[0x05D6]",  # 𐡆 → ז Zayin
    "\c[0x10847]" => "\c[0x05D7]",  # 𐡇 → ח Heth
    "\c[0x10848]" => "\c[0x05D8]",  # 𐡈 → ט Teth
    "\c[0x10849]" => "\c[0x05D9]",  # 𐡉 → י Yodh
    "\c[0x1084A]" => "\c[0x05DB]",  # 𐡊 → כ Kaph (not final form)
    "\c[0x1084B]" => "\c[0x05DC]",  # 𐡋 → ל Lamadh
    "\c[0x1084C]" => "\c[0x05DE]",  # 𐡌 → מ Mim (not final form)
    "\c[0x1084D]" => "\c[0x05E0]",  # 𐡍 → נ Nun (not final form)
    "\c[0x1084E]" => "\c[0x05E1]",  # 𐡎 → ס Samekh
    "\c[0x1084F]" => "\c[0x05E2]",  # 𐡏 → ע Ayin
    "\c[0x10850]" => "\c[0x05E4]",  # 𐡐 → פ Pe (not final form)
    "\c[0x10851]" => "\c[0x05E6]",  # 𐡑 → צ Tsade (not final form)
    "\c[0x10852]" => "\c[0x05E7]",  # 𐡒 → ק Qoph
    "\c[0x10853]" => "\c[0x05E8]",  # 𐡓 → ר Resh
    "\c[0x10854]" => "\c[0x05E9]",  # 𐡔 → ש Shin
    "\c[0x10855]" => "\c[0x05EA]",  # 𐡕 → ת Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Hebrew to Imperial Aramaic reverse mappings
    # Note: Final forms also map to the same Imperial Aramaic letters
    return (
        "\c[0x05D0]" => "\c[0x10840]",  # א → 𐡀
        "\c[0x05D1]" => "\c[0x10841]",  # ב → 𐡁
        "\c[0x05D2]" => "\c[0x10842]",  # ג → 𐡂
        "\c[0x05D3]" => "\c[0x10843]",  # ד → 𐡃
        "\c[0x05D4]" => "\c[0x10844]",  # ה → 𐡄
        "\c[0x05D5]" => "\c[0x10845]",  # ו → 𐡅
        "\c[0x05D6]" => "\c[0x10846]",  # ז → 𐡆
        "\c[0x05D7]" => "\c[0x10847]",  # ח → 𐡇
        "\c[0x05D8]" => "\c[0x10848]",  # ט → 𐡈
        "\c[0x05D9]" => "\c[0x10849]",  # י → 𐡉
        "\c[0x05DA]" => "\c[0x1084A]",  # ך → 𐡊 (final kaph)
        "\c[0x05DB]" => "\c[0x1084A]",  # כ → 𐡊
        "\c[0x05DC]" => "\c[0x1084B]",  # ל → 𐡋
        "\c[0x05DD]" => "\c[0x1084C]",  # ם → 𐡌 (final mem)
        "\c[0x05DE]" => "\c[0x1084C]",  # מ → 𐡌
        "\c[0x05DF]" => "\c[0x1084D]",  # ן → 𐡍 (final nun)
        "\c[0x05E0]" => "\c[0x1084D]",  # נ → 𐡍
        "\c[0x05E1]" => "\c[0x1084E]",  # ס → 𐡎
        "\c[0x05E2]" => "\c[0x1084F]",  # ע → 𐡏
        "\c[0x05E3]" => "\c[0x10850]",  # ף → 𐡐 (final pe)
        "\c[0x05E4]" => "\c[0x10850]",  # פ → 𐡐
        "\c[0x05E5]" => "\c[0x10851]",  # ץ → 𐡑 (final tsade)
        "\c[0x05E6]" => "\c[0x10851]",  # צ → 𐡑
        "\c[0x05E7]" => "\c[0x10852]",  # ק → 𐡒
        "\c[0x05E8]" => "\c[0x10853]",  # ר → 𐡓
        "\c[0x05E9]" => "\c[0x10854]",  # ש → 𐡔
        "\c[0x05EA]" => "\c[0x10855]",  # ת → 𐡕
    );
}

# Override to handle final form selection based on context
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        
        if %mappings{$char}:exists {
            my $mapped = %mappings{$char};
            
            # Check if we need to use final forms for Hebrew letters
            # Final forms are used at the end of words (before space, punctuation, or end of text)
            my $use-final = False;
            if $i + 1 >= @chars.elems || @chars[$i + 1] ~~ /\s|<punct>/ {
                $use-final = True;
            }
            
            if $use-final {
                # Convert to final forms where applicable
                given $mapped {
                    when "\c[0x05DB]" { $mapped = "\c[0x05DA]" }  # כ → ך
                    when "\c[0x05DE]" { $mapped = "\c[0x05DD]" }  # מ → ם
                    when "\c[0x05E0]" { $mapped = "\c[0x05DF]" }  # נ → ן
                    when "\c[0x05E4]" { $mapped = "\c[0x05E3]" }  # פ → ף
                    when "\c[0x05E6]" { $mapped = "\c[0x05E5]" }  # צ → ץ
                }
            }
            
            $result ~= $mapped;
        } else {
            $result ~= $char;
        }
        
        $i++;
    }
    
    return $result;
}