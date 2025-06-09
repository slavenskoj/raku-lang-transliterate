use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Latin does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Latin Transliteration
# Based on the phonemic values from the Wikipedia table
my %base-mappings = (
    # Imperial Aramaic to Latin transliteration
    "\c[0x10840]" => 'ʾ',   # 𐡀 Aleph - glottal stop
    "\c[0x10841]" => 'b',   # 𐡁 Beth
    "\c[0x10842]" => 'g',   # 𐡂 Gamal
    "\c[0x10843]" => 'd',   # 𐡃 Dalath
    "\c[0x10844]" => 'h',   # 𐡄 He
    "\c[0x10845]" => 'w',   # 𐡅 Waw
    "\c[0x10846]" => 'z',   # 𐡆 Zayn
    "\c[0x10847]" => 'ḥ',   # 𐡇 Heth - pharyngeal fricative
    "\c[0x10848]" => 'ṭ',   # 𐡈 Teth - emphatic t
    "\c[0x10849]" => 'y',   # 𐡉 Yodh
    "\c[0x1084A]" => 'k',   # 𐡊 Kaph
    "\c[0x1084B]" => 'l',   # 𐡋 Lamadh
    "\c[0x1084C]" => 'm',   # 𐡌 Mim
    "\c[0x1084D]" => 'n',   # 𐡍 Nun
    "\c[0x1084E]" => 's',   # 𐡎 Semkath
    "\c[0x1084F]" => 'ʿ',   # 𐡏 Ayn - pharyngeal voiced fricative
    "\c[0x10850]" => 'p',   # 𐡐 Pe
    "\c[0x10851]" => 'ṣ',   # 𐡑 Sadhe - emphatic s
    "\c[0x10852]" => 'q',   # 𐡒 Qoph - uvular stop
    "\c[0x10853]" => 'r',   # 𐡓 Resh
    "\c[0x10854]" => 'š',   # 𐡔 Shin
    "\c[0x10855]" => 't',   # 𐡕 Taw
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Latin to Imperial Aramaic reverse mappings
    return (
        'ʾ' => "\c[0x10840]",   # Aleph
        "'" => "\c[0x10840]",   # Alternative for aleph
        'b' => "\c[0x10841]",   # Beth
        'g' => "\c[0x10842]",   # Gamal
        'd' => "\c[0x10843]",   # Dalath
        'h' => "\c[0x10844]",   # He
        'w' => "\c[0x10845]",   # Waw
        'z' => "\c[0x10846]",   # Zayn
        'ḥ' => "\c[0x10847]",   # Heth
        'ṭ' => "\c[0x10848]",   # Teth
        'y' => "\c[0x10849]",   # Yodh
        'k' => "\c[0x1084A]",   # Kaph
        'l' => "\c[0x1084B]",   # Lamadh
        'm' => "\c[0x1084C]",   # Mim
        'n' => "\c[0x1084D]",   # Nun
        's' => "\c[0x1084E]",   # Semkath
        'ʿ' => "\c[0x1084F]",   # Ayn
        'p' => "\c[0x10850]",   # Pe
        'ṣ' => "\c[0x10851]",   # Sadhe
        'q' => "\c[0x10852]",   # Qoph
        'r' => "\c[0x10853]",   # Resh
        'š' => "\c[0x10854]",   # Shin
        'sh' => "\c[0x10854]",  # Alternative for shin
        't' => "\c[0x10855]",   # Taw
        
        # Common alternatives without diacritics
        'h' => "\c[0x10847]",   # Could be regular h or ḥ
        't' => "\c[0x10848]",   # Could be regular t or ṭ
        's' => "\c[0x10851]",   # Could be regular s or ṣ
    );
}