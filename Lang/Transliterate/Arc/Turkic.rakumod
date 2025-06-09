use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Turkic does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Old Turkic Script Conversion
# Based on the Wikipedia comparison table
# Old Turkic script (U+10C00-U+10C4F)

my %base-mappings = (
    # Imperial Aramaic to Old Turkic mappings
    "\c[0x10840]" => "\c[0x10C01]",   # 𐡀 Aleph → 𐰁 Turkic A
    "\c[0x10841]" => "\c[0x10C09]",   # 𐡁 Beth → 𐰉 Turkic B
    "\c[0x10842]" => "\c[0x10C31]",   # 𐡂 Gamal → 𐰱 Turkic G
    "\c[0x10843]" => "\c[0x10C13]",   # 𐡃 Dalath → 𐰓 Turkic D
    # "\c[0x10844]" => ,              # 𐡄 He → (no direct equivalent)
    "\c[0x10845]" => "\c[0x10C08]",   # 𐡅 Waw → 𐰈 Turkic W
    "\c[0x10846]" => "\c[0x10C15]",   # 𐡆 Zayn → 𐰕 Turkic Z
    # "\c[0x10847]" => ,              # 𐡇 Heth → (no direct equivalent)
    "\c[0x10848]" => "\c[0x10C43]",   # 𐡈 Teth → 𐱃 Turkic T
    "\c[0x10849]" => "\c[0x10C18]",   # 𐡉 Yodh → 𐰘 Turkic Y
    "\c[0x1084A]" => "\c[0x10C1A]",   # 𐡊 Kaph → 𐰚 Turkic K
    "\c[0x1084B]" => "\c[0x10C1E]",   # 𐡋 Lamadh → 𐰞 Turkic L
    "\c[0x1084C]" => "\c[0x10C22]",   # 𐡌 Mim → 𐰢 Turkic M
    "\c[0x1084D]" => "\c[0x10C24]",   # 𐡍 Nun → 𐰤 Turkic N
    "\c[0x1084E]" => "\c[0x10C3E]",   # 𐡎 Semkath → 𐰾 Turkic S
    "\c[0x1084F]" => "\c[0x10C0F]",   # 𐡏 Ayn → 𐰏 Turkic NG
    "\c[0x10850]" => "\c[0x10C2F]",   # 𐡐 Pe → 𐰯 Turkic P
    "\c[0x10851]" => "\c[0x10C3D]",   # 𐡑 Sadhe → 𐰽 Turkic S
    "\c[0x10852]" => "\c[0x10C34]",   # 𐡒 Qoph → 𐰴 Turkic Q
    "\c[0x10853]" => "\c[0x10C3A]",   # 𐡓 Resh → 𐰺 Turkic R
    "\c[0x10854]" => "\c[0x10C42]",   # 𐡔 Shin → 𐱂 Turkic SH
    "\c[0x10855]" => "\c[0x10C45]",   # 𐡕 Taw → 𐱅 Turkic T
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Old Turkic to Imperial Aramaic reverse mappings
    return (
        "\c[0x10C01]" => "\c[0x10840]",   # 𐰁 → 𐡀 Turkic A
        "\c[0x10C09]" => "\c[0x10841]",   # 𐰉 → 𐡁 Turkic B
        "\c[0x10C31]" => "\c[0x10842]",   # 𐰱 → 𐡂 Turkic G
        "\c[0x10C13]" => "\c[0x10843]",   # 𐰓 → 𐡃 Turkic D
        "\c[0x10C08]" => "\c[0x10845]",   # 𐰈 → 𐡅 Turkic W
        "\c[0x10C15]" => "\c[0x10846]",   # 𐰕 → 𐡆 Turkic Z
        "\c[0x10C43]" => "\c[0x10848]",   # 𐱃 → 𐡈 Turkic T
        "\c[0x10C18]" => "\c[0x10849]",   # 𐰘 → 𐡉 Turkic Y
        "\c[0x10C1A]" => "\c[0x1084A]",   # 𐰚 → 𐡊 Turkic K
        "\c[0x10C1E]" => "\c[0x1084B]",   # 𐰞 → 𐡋 Turkic L
        "\c[0x10C22]" => "\c[0x1084C]",   # 𐰢 → 𐡌 Turkic M
        "\c[0x10C24]" => "\c[0x1084D]",   # 𐰤 → 𐡍 Turkic N
        "\c[0x10C3E]" => "\c[0x1084E]",   # 𐰾 → 𐡎 Turkic S
        "\c[0x10C0F]" => "\c[0x1084F]",   # 𐰏 → 𐡏 Turkic NG
        "\c[0x10C2F]" => "\c[0x10850]",   # 𐰯 → 𐡐 Turkic P
        "\c[0x10C3D]" => "\c[0x10851]",   # 𐰽 → 𐡑 Turkic S
        "\c[0x10C34]" => "\c[0x10852]",   # 𐰴 → 𐡒 Turkic Q
        "\c[0x10C3A]" => "\c[0x10853]",   # 𐰺 → 𐡓 Turkic R
        "\c[0x10C42]" => "\c[0x10854]",   # 𐱂 → 𐡔 Turkic SH
        "\c[0x10C45]" => "\c[0x10855]",   # 𐱅 → 𐡕 Turkic T
        
        # Additional Turkic variants that may map back
        "\c[0x10C0B]" => "\c[0x1084A]",   # 𐰋 → 𐡊 Turkic K variant
        "\c[0x10C1C]" => "\c[0x1084A]",   # 𐰜 → 𐡊 Turkic K variant
        "\c[0x10C20]" => "\c[0x1084B]",   # 𐰠 → 𐡋 Turkic L variant
        "\c[0x10C23]" => "\c[0x1084D]",   # 𐰣 → 𐡍 Turkic N variant
        "\c[0x10C3C]" => "\c[0x10853]",   # 𐰼 → 𐡓 Turkic R variant
        "\c[0x10C41]" => "\c[0x10854]",   # 𐱁 → 𐡔 Turkic SH variant
        "\c[0x10C06]" => "\c[0x10845]",   # 𐰆 → 𐡅 Turkic O/U vowel
        "\c[0x10C03]" => "\c[0x10849]",   # 𐰃 → 𐡉 Turkic I vowel
        "\c[0x10C16]" => "\c[0x10849]",   # 𐰖 → 𐡉 Turkic Y variant
    );
}

# Note: Old Turkic is primarily consonantal with some vowel indicators
# This basic conversion handles the main consonantal mappings
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        
        if %mappings{$char}:exists {
            $result ~= %mappings{$char};
        } else {
            $result ~= $char;
        }
        
        $i++;
    }
    
    return $result;
}