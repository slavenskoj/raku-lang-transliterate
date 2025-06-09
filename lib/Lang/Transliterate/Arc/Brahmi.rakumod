use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Brahmi does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Brahmi Script Conversion
# Based on the Wikipedia comparison table
# Brahmi script (U+11000-U+1107F)

my %base-mappings = (
    # Imperial Aramaic to Brahmi mappings
    "\c[0x10840]" => "\c[0x11005]",   # 𐡀 Aleph → 𑀅 Brahmi A
    "\c[0x10841]" => "\c[0x11029]",   # 𐡁 Beth → 𑀩 Brahmi BA
    "\c[0x10842]" => "\c[0x11015]",   # 𐡂 Gamal → 𑀕 Brahmi GA
    "\c[0x10843]" => "\c[0x11024]",   # 𐡃 Dalath → 𑀤 Brahmi DA
    "\c[0x10844]" => "\c[0x11033]",   # 𐡄 He → 𑀳 Brahmi HA
    "\c[0x10845]" => "\c[0x1102F]",   # 𐡅 Waw → 𑀯 Brahmi VA
    "\c[0x10846]" => "\c[0x1101A]",   # 𐡆 Zayn → 𑀚 Brahmi JA
    "\c[0x10847]" => "\c[0x11016]",   # 𐡇 Heth → 𑀖 Brahmi GHA
    "\c[0x10848]" => "\c[0x11023]",   # 𐡈 Teth → 𑀣 Brahmi THA
    "\c[0x10849]" => "\c[0x1102C]",   # 𐡉 Yodh → 𑀬 Brahmi YA
    "\c[0x1084A]" => "\c[0x11013]",   # 𐡊 Kaph → 𑀓 Brahmi KA
    "\c[0x1084B]" => "\c[0x1102E]",   # 𐡋 Lamadh → 𑀮 Brahmi LA
    "\c[0x1084C]" => "\c[0x1102B]",   # 𐡌 Mim → 𑀫 Brahmi MA
    "\c[0x1084D]" => "\c[0x11026]",   # 𐡍 Nun → 𑀦 Brahmi NA
    "\c[0x1084E]" => "\c[0x11031]",   # 𐡎 Semkath → 𑀱 Brahmi SSA
    "\c[0x1084F]" => "\c[0x1100F]",   # 𐡏 Ayn → 𑀏 Brahmi E
    "\c[0x10850]" => "\c[0x11027]",   # 𐡐 Pe → 𑀧 Brahmi PA
    "\c[0x10851]" => "\c[0x11032]",   # 𐡑 Sadhe → 𑀲 Brahmi SA
    "\c[0x10852]" => "\c[0x11014]",   # 𐡒 Qoph → 𑀔 Brahmi KHA
    "\c[0x10853]" => "\c[0x1102D]",   # 𐡓 Resh → 𑀭 Brahmi RA
    "\c[0x10854]" => "\c[0x11030]",   # 𐡔 Shin → 𑀰 Brahmi SHA
    "\c[0x10855]" => "\c[0x11022]",   # 𐡕 Taw → 𑀢 Brahmi TA
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Brahmi to Imperial Aramaic reverse mappings
    return (
        "\c[0x11005]" => "\c[0x10840]",   # 𑀅 → 𐡀 Brahmi A
        "\c[0x11029]" => "\c[0x10841]",   # 𑀩 → 𐡁 Brahmi BA
        "\c[0x11015]" => "\c[0x10842]",   # 𑀕 → 𐡂 Brahmi GA
        "\c[0x11024]" => "\c[0x10843]",   # 𑀤 → 𐡃 Brahmi DA
        "\c[0x11033]" => "\c[0x10844]",   # 𑀳 → 𐡄 Brahmi HA
        "\c[0x1102F]" => "\c[0x10845]",   # 𑀯 → 𐡅 Brahmi VA
        "\c[0x1101A]" => "\c[0x10846]",   # 𑀚 → 𐡆 Brahmi JA
        "\c[0x11016]" => "\c[0x10847]",   # 𑀖 → 𐡇 Brahmi GHA
        "\c[0x11023]" => "\c[0x10848]",   # 𑀣 → 𐡈 Brahmi THA
        "\c[0x1102C]" => "\c[0x10849]",   # 𑀬 → 𐡉 Brahmi YA
        "\c[0x11013]" => "\c[0x1084A]",   # 𑀓 → 𐡊 Brahmi KA
        "\c[0x1102E]" => "\c[0x1084B]",   # 𑀮 → 𐡋 Brahmi LA
        "\c[0x1102B]" => "\c[0x1084C]",   # 𑀫 → 𐡌 Brahmi MA
        "\c[0x11026]" => "\c[0x1084D]",   # 𑀦 → 𐡍 Brahmi NA
        "\c[0x11031]" => "\c[0x1084E]",   # 𑀱 → 𐡎 Brahmi SSA
        "\c[0x1100F]" => "\c[0x1084F]",   # 𑀏 → 𐡏 Brahmi E
        "\c[0x11027]" => "\c[0x10850]",   # 𑀧 → 𐡐 Brahmi PA
        "\c[0x11032]" => "\c[0x10851]",   # 𑀲 → 𐡑 Brahmi SA
        "\c[0x11014]" => "\c[0x10852]",   # 𑀔 → 𐡒 Brahmi KHA
        "\c[0x1102D]" => "\c[0x10853]",   # 𑀭 → 𐡓 Brahmi RA
        "\c[0x11030]" => "\c[0x10854]",   # 𑀰 → 𐡔 Brahmi SHA
        "\c[0x11022]" => "\c[0x10855]",   # 𑀢 → 𐡕 Brahmi TA
    );
}

# Note: Brahmi is an abugida with inherent vowels
# This basic conversion assumes default vowel 'a'
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        
        if %mappings{$char}:exists {
            # For Brahmi, we're using consonants with inherent 'a' vowel
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

# Brahmi uses vowel diacritics, so we need to strip them when converting back
method detransliterate-context-aware(Str $text, :%reverse-mappings = self.get-reverse-mappings().Hash --> Str) {
    # Strip all Brahmi vowel signs (U+11038-U+1104D are combining vowel signs)
    # Also strip independent vowels (U+11005-U+11012, except those mapped as consonants)
    my $consonantal = $text.subst(/<[\c[0x11038]..\c[0x1104D]\c[0x11005]..\c[0x11012]]>/, '', :g);
    
    # Also remove virama (U+11046) which cancels inherent vowel
    $consonantal = $consonantal.subst(/\c[0x11046]/, '', :g);
    
    # Then apply the standard detransliteration
    return self.detransliterate($consonantal, :%reverse-mappings);
}