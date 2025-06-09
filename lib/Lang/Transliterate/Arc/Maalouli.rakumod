use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Maalouli does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Maalouli Script Conversion
# Based on the Wikipedia comparison table
# Note: Maalouli uses a modified Hebrew square script for Western Neo-Aramaic

my %base-mappings = (
    # Imperial Aramaic to Maalouli mappings
    # Using Unicode placeholder characters since Maalouli doesn't have dedicated Unicode blocks
    # These would need to be mapped to actual Maalouli glyphs in a real implementation
    "\c[0x10840]" => 'ʔ',    # 𐡀 Aleph → Maalouli alef (glottal stop)
    "\c[0x10841]" => 'b',    # 𐡁 Beth → Maalouli vet
    "\c[0x10842]" => 'g',    # 𐡂 Gamal → Maalouli ghemal
    "\c[0x10843]" => 'd',    # 𐡃 Dalath → Maalouli dhalet
    "\c[0x10844]" => 'h',    # 𐡄 He → Maalouli hi
    "\c[0x10845]" => 'w',    # 𐡅 Waw → Maalouli wawf
    "\c[0x10846]" => 'z',    # 𐡆 Zayn → Maalouli zayn
    "\c[0x10847]" => 'ḥ',    # 𐡇 Heth → Maalouli het
    "\c[0x10848]" => 'ṭ',    # 𐡈 Teth → Maalouli tet
    "\c[0x10849]" => 'y',    # 𐡉 Yodh → Maalouli yod
    "\c[0x1084A]" => 'k',    # 𐡊 Kaph → Maalouli khaf
    "\c[0x1084B]" => 'l',    # 𐡋 Lamadh → Maalouli lamed
    "\c[0x1084C]" => 'm',    # 𐡌 Mim → Maalouli mem
    "\c[0x1084D]" => 'n',    # 𐡍 Nun → Maalouli nun
    "\c[0x1084E]" => 's',    # 𐡎 Semkath → Maalouli sameh
    "\c[0x1084F]" => 'ʿ',    # 𐡏 Ayn → Maalouli ayn
    "\c[0x10850]" => 'f',    # 𐡐 Pe → Maalouli fi
    "\c[0x10851]" => 'ṣ',    # 𐡑 Sadhe → Maalouli sady
    "\c[0x10852]" => 'q',    # 𐡒 Qoph → Maalouli qof
    "\c[0x10853]" => 'r',    # 𐡓 Resh → Maalouli resh
    "\c[0x10854]" => 'š',    # 𐡔 Shin → Maalouli shin
    "\c[0x10855]" => 't',    # 𐡕 Taw → Maalouli thaq
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Maalouli to Imperial Aramaic reverse mappings
    return (
        'ʔ' => "\c[0x10840]",   # Maalouli alef → Imperial Aramaic Aleph
        'b' => "\c[0x10841]",   # Maalouli vet → Imperial Aramaic Beth
        'g' => "\c[0x10842]",   # Maalouli ghemal → Imperial Aramaic Gamal
        'd' => "\c[0x10843]",   # Maalouli dhalet → Imperial Aramaic Dalath
        'h' => "\c[0x10844]",   # Maalouli hi → Imperial Aramaic He
        'w' => "\c[0x10845]",   # Maalouli wawf → Imperial Aramaic Waw
        'z' => "\c[0x10846]",   # Maalouli zayn → Imperial Aramaic Zayn
        'ḥ' => "\c[0x10847]",   # Maalouli het → Imperial Aramaic Heth
        'ṭ' => "\c[0x10848]",   # Maalouli tet → Imperial Aramaic Teth
        'y' => "\c[0x10849]",   # Maalouli yod → Imperial Aramaic Yodh
        'k' => "\c[0x1084A]",   # Maalouli khaf → Imperial Aramaic Kaph
        'l' => "\c[0x1084B]",   # Maalouli lamed → Imperial Aramaic Lamadh
        'm' => "\c[0x1084C]",   # Maalouli mem → Imperial Aramaic Mim
        'n' => "\c[0x1084D]",   # Maalouli nun → Imperial Aramaic Nun
        's' => "\c[0x1084E]",   # Maalouli sameh → Imperial Aramaic Semkath
        'ʿ' => "\c[0x1084F]",   # Maalouli ayn → Imperial Aramaic Ayn
        'f' => "\c[0x10850]",   # Maalouli fi → Imperial Aramaic Pe
        'ṣ' => "\c[0x10851]",   # Maalouli sady → Imperial Aramaic Sadhe
        'q' => "\c[0x10852]",   # Maalouli qof → Imperial Aramaic Qoph
        'r' => "\c[0x10853]",   # Maalouli resh → Imperial Aramaic Resh
        'š' => "\c[0x10854]",   # Maalouli shin → Imperial Aramaic Shin
        't' => "\c[0x10855]",   # Maalouli thaq → Imperial Aramaic Taw
    );
}

# Maalouli (as represented here in Latin) uses vowels that need to be stripped
method detransliterate-context-aware(Str $text, :%reverse-mappings = self.get-reverse-mappings().Hash --> Str) {
    # Since this module uses Latin transliteration, strip Latin vowels
    my $consonantal = $text.subst(/:i <[aeiouāēīōūăĕĭŏŭàèìòùáéíóúâêîôûäëïöü]>/, '', :g);
    
    # Then apply the standard detransliteration
    return self.detransliterate($consonantal, :%reverse-mappings);
}