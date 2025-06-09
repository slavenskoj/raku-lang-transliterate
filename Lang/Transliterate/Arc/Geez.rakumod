use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Geez does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Geʽez Script Conversion
# Based on the Wikipedia comparison table
# Ethiopic (Geʽez) script (U+1200-U+137F)

my %base-mappings = (
    # Imperial Aramaic to Geʽez mappings
    "\c[0x10840]" => "\c[0x12A0]",   # 𐡀 Aleph → አ Geʽez Aleph
    "\c[0x10841]" => "\c[0x1260]",   # 𐡁 Beth → በ Geʽez Beth
    "\c[0x10842]" => "\c[0x1308]",   # 𐡂 Gamal → ገ Geʽez Gimel
    "\c[0x10843]" => "\c[0x12F0]",   # 𐡃 Dalath → ደ Geʽez Daleth
    "\c[0x10844]" => "\c[0x1200]",   # 𐡄 He → ሀ Geʽez He
    "\c[0x10845]" => "\c[0x12C8]",   # 𐡅 Waw → ወ Geʽez Waw
    # "\c[0x10846]" => ,              # 𐡆 Zayn → (no direct equivalent in Geʽez)
    "\c[0x10847]" => "\c[0x1210]",   # 𐡇 Heth → ሐ Geʽez Heth
    "\c[0x10848]" => "\c[0x1320]",   # 𐡈 Teth → ጠ Geʽez Teth
    "\c[0x10849]" => "\c[0x12E8]",   # 𐡉 Yodh → የ Geʽez Yodh
    "\c[0x1084A]" => "\c[0x12A8]",   # 𐡊 Kaph → ከ Geʽez Kaph
    "\c[0x1084B]" => "\c[0x1208]",   # 𐡋 Lamadh → ለ Geʽez Lamedh
    "\c[0x1084C]" => "\c[0x1218]",   # 𐡌 Mim → መ Geʽez Mem
    "\c[0x1084D]" => "\c[0x1290]",   # 𐡍 Nun → ነ Geʽez Nun
    # "\c[0x1084E]" => ,              # 𐡎 Semkath → (no direct equivalent in Geʽez)
    "\c[0x1084F]" => "\c[0x12D0]",   # 𐡏 Ayn → ዐ Geʽez Ayin
    "\c[0x10850]" => "\c[0x1348]",   # 𐡐 Pe → ፈ Geʽez Pe
    "\c[0x10851]" => "\c[0x1338]",   # 𐡑 Sadhe → ጸ Geʽez Tsade
    "\c[0x10852]" => "\c[0x1240]",   # 𐡒 Qoph → ቀ Geʽez Qoph
    "\c[0x10853]" => "\c[0x1228]",   # 𐡓 Resh → ረ Geʽez Resh
    "\c[0x10854]" => "\c[0x1220]",   # 𐡔 Shin → ሠ Geʽez Śawt (closest to Shin)
    "\c[0x10855]" => "\c[0x1270]",   # 𐡕 Taw → ተ Geʽez Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Geʽez to Imperial Aramaic reverse mappings
    return (
        "\c[0x12A0]" => "\c[0x10840]",   # አ → 𐡀 Geʽez Aleph
        "\c[0x1260]" => "\c[0x10841]",   # በ → 𐡁 Geʽez Beth
        "\c[0x1308]" => "\c[0x10842]",   # ገ → 𐡂 Geʽez Gimel
        "\c[0x12F0]" => "\c[0x10843]",   # ደ → 𐡃 Geʽez Daleth
        "\c[0x1200]" => "\c[0x10844]",   # ሀ → 𐡄 Geʽez He
        "\c[0x12C8]" => "\c[0x10845]",   # ወ → 𐡅 Geʽez Waw
        "\c[0x1210]" => "\c[0x10847]",   # ሐ → 𐡇 Geʽez Heth
        "\c[0x1320]" => "\c[0x10848]",   # ጠ → 𐡈 Geʽez Teth
        "\c[0x12E8]" => "\c[0x10849]",   # የ → 𐡉 Geʽez Yodh
        "\c[0x12A8]" => "\c[0x1084A]",   # ከ → 𐡊 Geʽez Kaph
        "\c[0x1208]" => "\c[0x1084B]",   # ለ → 𐡋 Geʽez Lamedh
        "\c[0x1218]" => "\c[0x1084C]",   # መ → 𐡌 Geʽez Mem
        "\c[0x1290]" => "\c[0x1084D]",   # ነ → 𐡍 Geʽez Nun
        "\c[0x12D0]" => "\c[0x1084F]",   # ዐ → 𐡏 Geʽez Ayin
        "\c[0x1348]" => "\c[0x10850]",   # ፈ → 𐡐 Geʽez Pe
        "\c[0x1338]" => "\c[0x10851]",   # ጸ → 𐡑 Geʽez Tsade
        "\c[0x1240]" => "\c[0x10852]",   # ቀ → 𐡒 Geʽez Qoph
        "\c[0x1228]" => "\c[0x10853]",   # ረ → 𐡓 Geʽez Resh
        "\c[0x1220]" => "\c[0x10854]",   # ሠ → 𐡔 Geʽez Śawt
        "\c[0x1270]" => "\c[0x10855]",   # ተ → 𐡕 Geʽez Taw
    );
}

# Note: Geʽez syllabic system would require vowel handling
# This basic conversion only handles consonants
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        
        if %mappings{$char}:exists {
            # For Geʽez, we're using the default vowel form (sixth order - ə)
            # In a complete implementation, vowel context would determine
            # which of the 7 orders to use
            $result ~= %mappings{$char};
        } else {
            $result ~= $char;
        }
        
        $i++;
    }
    
    return $result;
}