use Lang::Transliterate;

unit class Lang::Transliterate::Arc::Greek does Lang::Transliterate::Transliterator;

# Imperial Aramaic to Greek Script Conversion
# Based on the Wikipedia comparison table and historical Greek alphabet development

my %base-mappings = (
    # Imperial Aramaic to Greek mappings
    "\c[0x10840]" => "\c[0x0391]",   # 𐡀 Aleph → Α Alpha
    "\c[0x10841]" => "\c[0x0392]",   # 𐡁 Beth → Β Beta
    "\c[0x10842]" => "\c[0x0393]",   # 𐡂 Gamal → Γ Gamma
    "\c[0x10843]" => "\c[0x0394]",   # 𐡃 Dalath → Δ Delta
    "\c[0x10844]" => "\c[0x0395]",   # 𐡄 He → Ε Epsilon
    "\c[0x10845]" => "\c[0x03A5]",   # 𐡅 Waw → Υ Upsilon (also F Ϝ digamma in archaic)
    "\c[0x10846]" => "\c[0x0396]",   # 𐡆 Zayn → Ζ Zeta
    "\c[0x10847]" => "\c[0x0397]",   # 𐡇 Heth → Η Eta
    "\c[0x10848]" => "\c[0x0398]",   # 𐡈 Teth → Θ Theta
    "\c[0x10849]" => "\c[0x0399]",   # 𐡉 Yodh → Ι Iota
    "\c[0x1084A]" => "\c[0x039A]",   # 𐡊 Kaph → Κ Kappa
    "\c[0x1084B]" => "\c[0x039B]",   # 𐡋 Lamadh → Λ Lambda
    "\c[0x1084C]" => "\c[0x039C]",   # 𐡌 Mim → Μ Mu
    "\c[0x1084D]" => "\c[0x039D]",   # 𐡍 Nun → Ν Nu
    "\c[0x1084E]" => "\c[0x039E]",   # 𐡎 Semkath → Ξ Xi
    "\c[0x1084F]" => "\c[0x039F]",   # 𐡏 Ayn → Ο Omicron (also Ω Omega)
    "\c[0x10850]" => "\c[0x03A0]",   # 𐡐 Pe → Π Pi
    "\c[0x10851]" => '',              # 𐡑 Sadhe → (no direct Greek equivalent)
    "\c[0x10852]" => "\c[0x03A6]",   # 𐡒 Qoph → Φ Phi (archaic Ϙ qoppa)
    "\c[0x10853]" => "\c[0x03A1]",   # 𐡓 Resh → Ρ Rho
    "\c[0x10854]" => "\c[0x03A3]",   # 𐡔 Shin → Σ Sigma
    "\c[0x10855]" => "\c[0x03A4]",   # 𐡕 Taw → Τ Tau
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Greek to Imperial Aramaic reverse mappings
    return (
        "\c[0x0391]" => "\c[0x10840]",   # Α → 𐡀 Alpha
        "\c[0x03B1]" => "\c[0x10840]",   # α → 𐡀 alpha
        "\c[0x0392]" => "\c[0x10841]",   # Β → 𐡁 Beta
        "\c[0x03B2]" => "\c[0x10841]",   # β → 𐡁 beta
        "\c[0x0393]" => "\c[0x10842]",   # Γ → 𐡂 Gamma
        "\c[0x03B3]" => "\c[0x10842]",   # γ → 𐡂 gamma
        "\c[0x0394]" => "\c[0x10843]",   # Δ → 𐡃 Delta
        "\c[0x03B4]" => "\c[0x10843]",   # δ → 𐡃 delta
        "\c[0x0395]" => "\c[0x10844]",   # Ε → 𐡄 Epsilon
        "\c[0x03B5]" => "\c[0x10844]",   # ε → 𐡄 epsilon
        "\c[0x03A5]" => "\c[0x10845]",   # Υ → 𐡅 Upsilon
        "\c[0x03C5]" => "\c[0x10845]",   # υ → 𐡅 upsilon
        "\c[0x03DC]" => "\c[0x10845]",   # Ϝ → 𐡅 digamma (archaic)
        "\c[0x03DD]" => "\c[0x10845]",   # ϝ → 𐡅 digamma (archaic)
        "\c[0x0396]" => "\c[0x10846]",   # Ζ → 𐡆 Zeta
        "\c[0x03B6]" => "\c[0x10846]",   # ζ → 𐡆 zeta
        "\c[0x0397]" => "\c[0x10847]",   # Η → 𐡇 Eta
        "\c[0x03B7]" => "\c[0x10847]",   # η → 𐡇 eta
        "\c[0x0398]" => "\c[0x10848]",   # Θ → 𐡈 Theta
        "\c[0x03B8]" => "\c[0x10848]",   # θ → 𐡈 theta
        "\c[0x0399]" => "\c[0x10849]",   # Ι → 𐡉 Iota
        "\c[0x03B9]" => "\c[0x10849]",   # ι → 𐡉 iota
        "\c[0x039A]" => "\c[0x1084A]",   # Κ → 𐡊 Kappa
        "\c[0x03BA]" => "\c[0x1084A]",   # κ → 𐡊 kappa
        "\c[0x039B]" => "\c[0x1084B]",   # Λ → 𐡋 Lambda
        "\c[0x03BB]" => "\c[0x1084B]",   # λ → 𐡋 lambda
        "\c[0x039C]" => "\c[0x1084C]",   # Μ → 𐡌 Mu
        "\c[0x03BC]" => "\c[0x1084C]",   # μ → 𐡌 mu
        "\c[0x039D]" => "\c[0x1084D]",   # Ν → 𐡍 Nu
        "\c[0x03BD]" => "\c[0x1084D]",   # ν → 𐡍 nu
        "\c[0x039E]" => "\c[0x1084E]",   # Ξ → 𐡎 Xi
        "\c[0x03BE]" => "\c[0x1084E]",   # ξ → 𐡎 xi
        "\c[0x039F]" => "\c[0x1084F]",   # Ο → 𐡏 Omicron
        "\c[0x03BF]" => "\c[0x1084F]",   # ο → 𐡏 omicron
        "\c[0x03A9]" => "\c[0x1084F]",   # Ω → 𐡏 Omega (also from ayin)
        "\c[0x03C9]" => "\c[0x1084F]",   # ω → 𐡏 omega
        "\c[0x03A0]" => "\c[0x10850]",   # Π → 𐡐 Pi
        "\c[0x03C0]" => "\c[0x10850]",   # π → 𐡐 pi
        "\c[0x03A6]" => "\c[0x10852]",   # Φ → 𐡒 Phi
        "\c[0x03C6]" => "\c[0x10852]",   # φ → 𐡒 phi
        "\c[0x03D8]" => "\c[0x10852]",   # Ϙ → 𐡒 qoppa (archaic)
        "\c[0x03D9]" => "\c[0x10852]",   # ϙ → 𐡒 qoppa (archaic)
        "\c[0x03A1]" => "\c[0x10853]",   # Ρ → 𐡓 Rho
        "\c[0x03C1]" => "\c[0x10853]",   # ρ → 𐡓 rho
        "\c[0x03A3]" => "\c[0x10854]",   # Σ → 𐡔 Sigma
        "\c[0x03C3]" => "\c[0x10854]",   # σ → 𐡔 sigma
        "\c[0x03C2]" => "\c[0x10854]",   # ς → 𐡔 final sigma
        "\c[0x03A4]" => "\c[0x10855]",   # Τ → 𐡕 Tau
        "\c[0x03C4]" => "\c[0x10855]",   # τ → 𐡕 tau
    );
}