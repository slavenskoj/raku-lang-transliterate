use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Kharosthi does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Kharosthi Script Conversion
# Based on the Wikipedia comparison table
# Kharosthi script (U+10A00-U+10A5F)

my %base-mappings = (
    # Imperial Aramaic to Kharosthi mappings
    "\c[0x10840]" => "\c[0x10A00]",   # 𐡀 Aleph → 𐨀 Kharosthi A
    "\c[0x10841]" => "\c[0x10A26]",   # 𐡁 Beth → 𐨦 Kharosthi BA
    "\c[0x10842]" => "\c[0x10A12]",   # 𐡂 Gamal → 𐨒 Kharosthi GA
    "\c[0x10843]" => "\c[0x10A22]",   # 𐡃 Dalath → 𐨢 Kharosthi DHA
    "\c[0x10844]" => "\c[0x10A31]",   # 𐡄 He → 𐨱 Kharosthi HA
    "\c[0x10845]" => "\c[0x10A2C]",   # 𐡅 Waw → 𐨬 Kharosthi VA
    "\c[0x10846]" => "\c[0x10A17]",   # 𐡆 Zayn → 𐨗 Kharosthi JA
    "\c[0x10847]" => "\c[0x10A13]",   # 𐡇 Heth → 𐨓 Kharosthi GHA
    "\c[0x10848]" => "\c[0x10A20]",   # 𐡈 Teth → 𐨠 Kharosthi THA
    "\c[0x10849]" => "\c[0x10A29]",   # 𐡉 Yodh → 𐨩 Kharosthi YA
    "\c[0x1084A]" => "\c[0x10A10]",   # 𐡊 Kaph → 𐨐 Kharosthi KA
    "\c[0x1084B]" => "\c[0x10A2B]",   # 𐡋 Lamadh → 𐨫 Kharosthi LA
    "\c[0x1084C]" => "\c[0x10A28]",   # 𐡌 Mim → 𐨨 Kharosthi MA
    "\c[0x1084D]" => "\c[0x10A23]",   # 𐡍 Nun → 𐨣 Kharosthi NA
    "\c[0x1084E]" => "\c[0x10A2D]",   # 𐡎 Semkath → 𐨭 Kharosthi SHA
    "\c[0x1084F]" => "\c[0x10A05]",   # 𐡏 Ayn → 𐨅 Kharosthi E
    "\c[0x10850]" => "\c[0x10A24]",   # 𐡐 Pe → 𐨤 Kharosthi PA
    "\c[0x10851]" => "\c[0x10A2F]",   # 𐡑 Sadhe → 𐨯 Kharosthi SA
    "\c[0x10852]" => "\c[0x10A11]",   # 𐡒 Qoph → 𐨑 Kharosthi KHA
    "\c[0x10853]" => "\c[0x10A2A]",   # 𐡓 Resh → 𐨪 Kharosthi RA
    "\c[0x10854]" => "\c[0x10A2E]",   # 𐡔 Shin → 𐨮 Kharosthi SSA
    "\c[0x10855]" => "\c[0x10A1F]",   # 𐡕 Taw → 𐨟 Kharosthi TA
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Kharosthi to Imperial Aramaic reverse mappings
    return (
        "\c[0x10A00]" => "\c[0x10840]",   # 𐨀 → 𐡀 Kharosthi A
        "\c[0x10A26]" => "\c[0x10841]",   # 𐨦 → 𐡁 Kharosthi BA
        "\c[0x10A12]" => "\c[0x10842]",   # 𐨒 → 𐡂 Kharosthi GA
        "\c[0x10A22]" => "\c[0x10843]",   # 𐨢 → 𐡃 Kharosthi DHA
        "\c[0x10A31]" => "\c[0x10844]",   # 𐨱 → 𐡄 Kharosthi HA
        "\c[0x10A2C]" => "\c[0x10845]",   # 𐨬 → 𐡅 Kharosthi VA
        "\c[0x10A17]" => "\c[0x10846]",   # 𐨗 → 𐡆 Kharosthi JA
        "\c[0x10A13]" => "\c[0x10847]",   # 𐨓 → 𐡇 Kharosthi GHA
        "\c[0x10A20]" => "\c[0x10848]",   # 𐨠 → 𐡈 Kharosthi THA
        "\c[0x10A29]" => "\c[0x10849]",   # 𐨩 → 𐡉 Kharosthi YA
        "\c[0x10A10]" => "\c[0x1084A]",   # 𐨐 → 𐡊 Kharosthi KA
        "\c[0x10A2B]" => "\c[0x1084B]",   # 𐨫 → 𐡋 Kharosthi LA
        "\c[0x10A28]" => "\c[0x1084C]",   # 𐨨 → 𐡌 Kharosthi MA
        "\c[0x10A23]" => "\c[0x1084D]",   # 𐨣 → 𐡍 Kharosthi NA
        "\c[0x10A2D]" => "\c[0x1084E]",   # 𐨭 → 𐡎 Kharosthi SHA
        "\c[0x10A05]" => "\c[0x1084F]",   # 𐨅 → 𐡏 Kharosthi E
        "\c[0x10A24]" => "\c[0x10850]",   # 𐨤 → 𐡐 Kharosthi PA
        "\c[0x10A2F]" => "\c[0x10851]",   # 𐨯 → 𐡑 Kharosthi SA
        "\c[0x10A11]" => "\c[0x10852]",   # 𐨑 → 𐡒 Kharosthi KHA
        "\c[0x10A2A]" => "\c[0x10853]",   # 𐨪 → 𐡓 Kharosthi RA
        "\c[0x10A2E]" => "\c[0x10854]",   # 𐨮 → 𐡔 Kharosthi SSA
        "\c[0x10A1F]" => "\c[0x10855]",   # 𐨟 → 𐡕 Kharosthi TA
    );
}

# Note: Kharosthi is an abugida with inherent vowel 'a'
# This basic conversion assumes default vowel
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        
        if %mappings{$char}:exists {
            # For Kharosthi, we're using consonants with inherent 'a' vowel
            # In a complete implementation, vowel diacritics would be added
            # based on context
            $result ~= %mappings{$char};
        } else {
            $result ~= $char;
        }
        
        $i++;
    }
    
    return $result;
}