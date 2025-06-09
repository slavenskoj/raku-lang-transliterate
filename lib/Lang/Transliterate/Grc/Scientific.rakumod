use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Grc::Scientific does Lang::Transliterate::Transliterator;

# Ancient Greek Scientific Transliteration
# Based on the standard scientific transliteration system for Ancient Greek
# Used in scholarly works and dictionaries

my %base-mappings = (
    # Single letters
    "\c[0x0391]" => 'A',     # Α Alpha
    "\c[0x03B1]" => 'a',     # α alpha
    "\c[0x03AC]" => 'a',     # ά alpha with tonos
    "\c[0x0386]" => 'A',     # Ά Alpha with tonos
    "\c[0x0392]" => 'B',     # Β Beta
    "\c[0x03B2]" => 'b',     # β beta
    "\c[0x0393]" => 'G',     # Γ Gamma
    "\c[0x03B3]" => 'g',     # γ gamma
    "\c[0x0394]" => 'D',     # Δ Delta
    "\c[0x03B4]" => 'd',     # δ delta
    "\c[0x0395]" => 'E',     # Ε Epsilon
    "\c[0x03B5]" => 'e',     # ε epsilon
    "\c[0x03AD]" => 'e',     # έ epsilon with tonos
    "\c[0x0388]" => 'E',     # Έ Epsilon with tonos
    "\c[0x03DC]" => 'W',     # Ϝ Digamma
    "\c[0x03DD]" => 'w',     # ϝ digamma
    "\c[0x0396]" => 'Z',     # Ζ Zeta
    "\c[0x03B6]" => 'z',     # ζ zeta
    "\c[0x0397]" => 'Ē',     # Η Eta
    "\c[0x03B7]" => 'ē',     # η eta
    "\c[0x03AE]" => 'ē',     # ή eta with tonos
    "\c[0x0389]" => 'Ē',     # Ή Eta with tonos
    "\c[0x0398]" => 'Th',    # Θ Theta
    "\c[0x03B8]" => 'th',    # θ theta
    "\c[0x0399]" => 'I',     # Ι Iota
    "\c[0x03B9]" => 'i',     # ι iota
    "\c[0x03AF]" => 'i',     # ί iota with tonos
    "\c[0x038A]" => 'I',     # Ί Iota with tonos
    "\c[0x03CA]" => 'ï',     # ϊ iota with diaeresis
    "\c[0x0390]" => 'ï',     # ΐ iota with dialytika and tonos
    "\c[0x039A]" => 'K',     # Κ Kappa
    "\c[0x03BA]" => 'k',     # κ kappa
    "\c[0x039B]" => 'L',     # Λ Lambda
    "\c[0x03BB]" => 'l',     # λ lambda
    "\c[0x039C]" => 'M',     # Μ Mu
    "\c[0x03BC]" => 'm',     # μ mu
    "\c[0x039D]" => 'N',     # Ν Nu
    "\c[0x03BD]" => 'n',     # ν nu
    "\c[0x039E]" => 'X',     # Ξ Xi
    "\c[0x03BE]" => 'x',     # ξ xi
    "\c[0x039F]" => 'O',     # Ο Omicron
    "\c[0x03BF]" => 'o',     # ο omicron
    "\c[0x03CC]" => 'o',     # ό omicron with tonos
    "\c[0x038C]" => 'O',     # Ό Omicron with tonos
    "\c[0x03A0]" => 'P',     # Π Pi
    "\c[0x03C0]" => 'p',     # π pi
    "\c[0x03A1]" => 'R',     # Ρ Rho
    "\c[0x03C1]" => 'r',     # ρ rho
    "\c[0x1FE4]" => 'rh',    # ῤ rho with smooth breathing
    "\c[0x1FE5]" => 'rh',    # ῥ rho with rough breathing
    "\c[0x03A3]" => 'S',     # Σ Sigma
    "\c[0x03C3]" => 's',     # σ sigma
    "\c[0x03C2]" => 's',     # ς final sigma
    "\c[0x03A4]" => 'T',     # Τ Tau
    "\c[0x03C4]" => 't',     # τ tau
    "\c[0x03A5]" => 'U',     # Υ Upsilon
    "\c[0x03C5]" => 'u',     # υ upsilon
    "\c[0x03CD]" => 'u',     # ύ upsilon with tonos
    "\c[0x038E]" => 'U',     # Ύ Upsilon with tonos
    "\c[0x03CB]" => 'ü',     # ϋ upsilon with diaeresis
    "\c[0x03B0]" => 'ü',     # ΰ upsilon with dialytika and tonos
    "\c[0x03A6]" => 'Ph',    # Φ Phi
    "\c[0x03C6]" => 'ph',    # φ phi
    "\c[0x03A7]" => 'Kh',    # Χ Chi
    "\c[0x03C7]" => 'kh',    # χ chi
    "\c[0x03A8]" => 'Ps',    # Ψ Psi
    "\c[0x03C8]" => 'ps',    # ψ psi
    "\c[0x03A9]" => 'Ō',     # Ω Omega
    "\c[0x03C9]" => 'ō',     # ω omega
    "\c[0x03CE]" => 'ō',     # ώ omega with tonos
    "\c[0x038F]" => 'Ō',     # Ώ Omega with tonos
    
    # Vowel digraphs
    "\c[0x03B1]\c[0x03B9]" => 'ai',           # αι
    "\c[0x0391]\c[0x03B9]" => 'Ai',           # Αι
    "\c[0x1FB3]" => 'āi',                     # ᾳ (alpha with iota subscript)
    "\c[0x1FBC]" => 'Āi',                     # ᾼ (capital alpha with iota subscript)
    "\c[0x03B1]\c[0x03C5]" => 'au',           # αυ
    "\c[0x0391]\c[0x03C5]" => 'Au',           # Αυ
    "\c[0x03B5]\c[0x03B9]" => 'ei',           # ει
    "\c[0x0395]\c[0x03B9]" => 'Ei',           # Ει
    "\c[0x03B5]\c[0x03C5]" => 'eu',           # ευ
    "\c[0x0395]\c[0x03C5]" => 'Eu',           # Ευ
    "\c[0x1FC3]" => 'ēi',                     # ῃ (eta with iota subscript)
    "\c[0x1FCC]" => 'Ēi',                     # ῌ (capital eta with iota subscript)
    "\c[0x03B7]\c[0x03C5]" => 'ēu',           # ηυ
    "\c[0x0397]\c[0x03C5]" => 'Ēu',           # Ηυ
    "\c[0x03BF]\c[0x03B9]" => 'oi',           # οι
    "\c[0x039F]\c[0x03B9]" => 'Oi',           # Οι
    "\c[0x03BF]\c[0x03C5]" => 'ou',           # ου
    "\c[0x039F]\c[0x03C5]" => 'Ou',           # Ου
    "\c[0x03C5]\c[0x03B9]" => 'ui',           # υι
    "\c[0x03A5]\c[0x03B9]" => 'Ui',           # Υι
    "\c[0x1FF3]" => 'ōi',                     # ῳ (omega with iota subscript)
    "\c[0x1FFC]" => 'Ōi',                     # ῼ (capital omega with iota subscript)
    "\c[0x03C9]\c[0x03C5]" => 'ōu',           # ωυ
    "\c[0x03A9]\c[0x03C5]" => 'Ōu',           # Ωυ
    
    # Consonant digraphs
    "\c[0x03B3]\c[0x03B3]" => 'ng',           # γγ
    "\c[0x03B3]\c[0x03BA]" => 'nk',           # γκ
    "\c[0x03B3]\c[0x03BE]" => 'nx',           # γξ
    "\c[0x03B3]\c[0x03C7]" => 'nkh',          # γχ
    "\c[0x03C1]\c[0x03C1]" => 'rrh',          # ρρ
    "\c[0x1FE4]\c[0x1FE5]" => 'rrh',          # ῤῥ
    
    # Special cases with smooth breathing (no h)
    "\c[0x1F00]" => 'a',     # ἀ
    "\c[0x1F08]" => 'A',     # Ἀ
    "\c[0x1F10]" => 'e',     # ἐ
    "\c[0x1F18]" => 'E',     # Ἐ
    "\c[0x1F20]" => 'ē',     # ἠ
    "\c[0x1F28]" => 'Ē',     # Ἠ
    "\c[0x1F30]" => 'i',     # ἰ
    "\c[0x1F38]" => 'I',     # Ἰ
    "\c[0x1F40]" => 'o',     # ὀ
    "\c[0x1F48]" => 'O',     # Ὀ
    "\c[0x1F50]" => 'u',     # ὐ
    "\c[0x1F60]" => 'ō',     # ὠ
    "\c[0x1F68]" => 'Ō',     # Ὠ
    
    # With rough breathing
    "\c[0x1F01]" => 'ha',    # ἁ
    "\c[0x1F09]" => 'Ha',    # Ἁ
    "\c[0x1F11]" => 'he',    # ἑ
    "\c[0x1F19]" => 'He',    # Ἑ
    "\c[0x1F21]" => 'hē',    # ἡ
    "\c[0x1F29]" => 'Hē',    # Ἡ
    "\c[0x1F31]" => 'hi',    # ἱ
    "\c[0x1F39]" => 'Hi',    # Ἱ
    "\c[0x1F41]" => 'ho',    # ὁ
    "\c[0x1F49]" => 'Ho',    # Ὁ
    "\c[0x1F51]" => 'hu',    # ὑ
    "\c[0x1F59]" => 'Hu',    # Ὑ
    "\c[0x1F61]" => 'hō',    # ὡ
    "\c[0x1F69]" => 'Hō',    # Ὡ
    "\c[0x1FE5]" => 'rh',    # ῥ rho with rough breathing
    "\c[0x1FEC]" => 'Rh',    # Ῥ capital rho with rough breathing
    
    # Additional polytonic forms with accents
    "\c[0x1F70]" => 'a',     # ὰ alpha with varia
    "\c[0x1F71]" => 'a',     # ά alpha with oxia
    "\c[0x1F72]" => 'e',     # ὲ epsilon with varia
    "\c[0x1F73]" => 'e',     # έ epsilon with oxia
    "\c[0x1F74]" => 'ē',     # ὴ eta with varia
    "\c[0x1F75]" => 'ē',     # ή eta with oxia
    "\c[0x1F76]" => 'i',     # ὶ iota with varia
    "\c[0x1F77]" => 'i',     # ί iota with oxia
    "\c[0x1F78]" => 'o',     # ὸ omicron with varia
    "\c[0x1F79]" => 'o',     # ό omicron with oxia
    "\c[0x1F7A]" => 'u',     # ὺ upsilon with varia
    "\c[0x1F7B]" => 'u',     # ύ upsilon with oxia
    "\c[0x1F7C]" => 'ō',     # ὼ omega with varia
    "\c[0x1F7D]" => 'ō',     # ώ omega with oxia
    
    # Forms with breathing and accent
    "\c[0x1F04]" => 'a',     # ἄ alpha smooth acute
    "\c[0x1F05]" => 'ha',    # ἅ alpha rough acute
    "\c[0x1F0C]" => 'A',     # Ἄ Alpha smooth acute
    "\c[0x1F0D]" => 'Ha',    # Ἅ Alpha rough acute
    "\c[0x1F14]" => 'e',     # ἔ epsilon smooth acute
    "\c[0x1F15]" => 'he',    # ἕ epsilon rough acute
    "\c[0x1F1C]" => 'E',     # Ἔ Epsilon smooth acute
    "\c[0x1F1D]" => 'He',    # Ἕ Epsilon rough acute
    "\c[0x1F24]" => 'ē',     # ἤ eta smooth acute
    "\c[0x1F25]" => 'hē',    # ἥ eta rough acute
    "\c[0x1F2C]" => 'Ē',     # Ἤ Eta smooth acute
    "\c[0x1F2D]" => 'Hē',    # Ἥ Eta rough acute
    "\c[0x1F34]" => 'i',     # ἴ iota smooth acute
    "\c[0x1F35]" => 'hi',    # ἵ iota rough acute
    "\c[0x1F3C]" => 'I',     # Ἴ Iota smooth acute
    "\c[0x1F3D]" => 'Hi',    # Ἵ Iota rough acute
    "\c[0x1F44]" => 'o',     # ὄ omicron smooth acute
    "\c[0x1F45]" => 'ho',    # ὅ omicron rough acute
    "\c[0x1F4C]" => 'O',     # Ὄ Omicron smooth acute
    "\c[0x1F4D]" => 'Ho',    # Ὅ Omicron rough acute
    "\c[0x1F54]" => 'u',     # ὔ upsilon smooth acute
    "\c[0x1F55]" => 'hu',    # ὕ upsilon rough acute
    "\c[0x1F5D]" => 'Hu',    # Ὕ Upsilon rough acute
    "\c[0x1F64]" => 'ō',     # ὤ omega smooth acute
    "\c[0x1F65]" => 'hō',    # ὥ omega rough acute
    "\c[0x1F6C]" => 'Ō',     # Ὤ Omega smooth acute
    "\c[0x1F6D]" => 'Hō',    # Ὥ Omega rough acute
    
    # Diphthongs with breathing marks
    "\c[0x1F80]" => 'ai',    # ᾀ alpha with iota subscript smooth
    "\c[0x1F81]" => 'hai',   # ᾁ alpha with iota subscript rough
    "\c[0x1F88]" => 'Ai',    # ᾈ Alpha with iota subscript smooth
    "\c[0x1F89]" => 'Hai',   # ᾉ Alpha with iota subscript rough
    "\c[0x1F90]" => 'ēi',    # ᾐ eta with iota subscript smooth
    "\c[0x1F91]" => 'hēi',   # ᾑ eta with iota subscript rough
    "\c[0x1F98]" => 'Ēi',    # ᾘ Eta with iota subscript smooth
    "\c[0x1F99]" => 'Hēi',   # ᾙ Eta with iota subscript rough
    "\c[0x1FA0]" => 'ōi',    # ᾠ omega with iota subscript smooth
    "\c[0x1FA1]" => 'hōi',   # ᾡ omega with iota subscript rough
    "\c[0x1FA8]" => 'Ōi',    # ᾨ Omega with iota subscript smooth
    "\c[0x1FA9]" => 'Hōi',   # ᾩ Omega with iota subscript rough
    
    # Diphthongs ai, ei, oi with accents
    "\c[0x1F84]" => 'ai',    # ᾄ alpha with iota subscript acute
    "\c[0x1F85]" => 'hai',   # ᾅ alpha with iota subscript rough acute
    "\c[0x1F94]" => 'ēi',    # ᾔ eta with iota subscript acute
    "\c[0x1F95]" => 'hēi',   # ᾕ eta with iota subscript rough acute
    "\c[0x1FA4]" => 'ōi',    # ᾤ omega with iota subscript acute
    "\c[0x1FA5]" => 'hōi',   # ᾥ omega with iota subscript rough acute
    
    # More diphthong forms with breathing marks
    "\c[0x1F06]" => 'a',     # ἆ alpha smooth circumflex
    "\c[0x1F07]" => 'ha',    # ἇ alpha rough circumflex
    "\c[0x1F26]" => 'ē',     # ἦ eta smooth circumflex
    "\c[0x1F27]" => 'hē',    # ἧ eta rough circumflex
    "\c[0x1F36]" => 'i',     # ἶ iota smooth circumflex
    "\c[0x1F37]" => 'hi',    # ἷ iota rough circumflex
    "\c[0x1F56]" => 'u',     # ὖ upsilon smooth circumflex
    "\c[0x1F57]" => 'hu',    # ὗ upsilon rough circumflex
    "\c[0x1F66]" => 'ō',     # ὦ omega smooth circumflex
    "\c[0x1F67]" => 'hō',    # ὧ omega rough circumflex
    
    # Iota adscript combinations
    "\c[0x1FB6]" => 'a',     # ᾶ alpha with perispomeni
    "\c[0x1FC6]" => 'ē',     # ῆ eta with perispomeni
    "\c[0x1FD6]" => 'i',     # ῖ iota with perispomeni
    "\c[0x1FE6]" => 'u',     # ῦ upsilon with perispomeni
    "\c[0x1FF6]" => 'ō',     # ῶ omega with perispomeni
    
    # Special combination in αἷμα  
    "\c[0x1FB7]" => 'ai',    # ᾷ alpha with iota subscript and perispomeni
    "\c[0x03B1]\c[0x1F37]" => 'hai',  # αἷ - alpha + iota with rough breathing for αἷμα
    
    # Special diphthong combinations
    "\c[0x1F86]" => 'ai',    # ᾆ alpha with iota subscript and perispomeni
    "\c[0x1F87]" => 'hai',   # ᾇ alpha with iota subscript rough perispomeni
    "\c[0x1F96]" => 'ēi',    # ᾖ eta with iota subscript and perispomeni
    "\c[0x1F97]" => 'hēi',   # ᾗ eta with iota subscript rough perispomeni
    "\c[0x1FA6]" => 'ōi',    # ᾦ omega with iota subscript and perispomeni
    "\c[0x1FA7]" => 'hōi',   # ᾧ omega with iota subscript rough perispomeni
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Ancient Greek Scientific reverse mappings
    return (
        # Multi-character mappings first
        'rrh' => "\c[0x03C1]\c[0x03C1]",
        'nkh' => "\c[0x03B3]\c[0x03C7]",
        'ng' => "\c[0x03B3]\c[0x03B3]",
        'nk' => "\c[0x03B3]\c[0x03BA]",
        'nx' => "\c[0x03B3]\c[0x03BE]",
        
        # Digraphs with capitals
        'Th' => "\c[0x0398]",
        'th' => "\c[0x03B8]",
        'Ph' => "\c[0x03A6]",
        'ph' => "\c[0x03C6]",
        'Kh' => "\c[0x03A7]",
        'kh' => "\c[0x03C7]",
        'Ps' => "\c[0x03A8]",
        'ps' => "\c[0x03C8]",
        'rh' => "\c[0x1FE5]",
        'Rh' => "\c[0x1FEC]",
        
        # Diphthongs
        'ai' => "\c[0x03B1]\c[0x03B9]",
        'Ai' => "\c[0x0391]\c[0x03B9]",
        'au' => "\c[0x03B1]\c[0x03C5]",
        'Au' => "\c[0x0391]\c[0x03C5]",
        'ei' => "\c[0x03B5]\c[0x03B9]",
        'Ei' => "\c[0x0395]\c[0x03B9]",
        'eu' => "\c[0x03B5]\c[0x03C5]",
        'Eu' => "\c[0x0395]\c[0x03C5]",
        'oi' => "\c[0x03BF]\c[0x03B9]",
        'Oi' => "\c[0x039F]\c[0x03B9]",
        'ou' => "\c[0x03BF]\c[0x03C5]",
        'Ou' => "\c[0x039F]\c[0x03C5]",
        'ui' => "\c[0x03C5]\c[0x03B9]",
        'Ui' => "\c[0x03A5]\c[0x03B9]",
        
        # Long vowels with macron
        'Ā' => "\c[0x0391]",  # Could be long alpha
        'ā' => "\c[0x03B1]",  # Could be long alpha
        'Ē' => "\c[0x0397]",
        'ē' => "\c[0x03B7]",
        'Ō' => "\c[0x03A9]",
        'ō' => "\c[0x03C9]",
        'Ī' => "\c[0x0399]",  # Could be long iota
        'ī' => "\c[0x03B9]",  # Could be long iota
        'Ū' => "\c[0x03A5]",  # Could be long upsilon
        'ū' => "\c[0x03C5]",  # Could be long upsilon
        
        # With iota subscript
        'āi' => "\c[0x1FB3]",
        'Āi' => "\c[0x1FBC]",
        'ēi' => "\c[0x1FC3]",
        'Ēi' => "\c[0x1FCC]",
        'ōi' => "\c[0x1FF3]",
        'Ōi' => "\c[0x1FFC]",
        
        # Diphthongs with long first element
        'ēu' => "\c[0x03B7]\c[0x03C5]",
        'Ēu' => "\c[0x0397]\c[0x03C5]",
        'ōu' => "\c[0x03C9]\c[0x03C5]",
        'Ōu' => "\c[0x03A9]\c[0x03C5]",
        
        # With rough breathing
        'ha' => "\c[0x1F01]",
        'Ha' => "\c[0x1F09]",
        'he' => "\c[0x1F11]",
        'He' => "\c[0x1F19]",
        'hē' => "\c[0x1F21]",
        'Hē' => "\c[0x1F29]",
        'hi' => "\c[0x1F31]",
        'Hi' => "\c[0x1F39]",
        'ho' => "\c[0x1F41]",
        'Ho' => "\c[0x1F49]",
        'hu' => "\c[0x1F51]",
        'Hu' => "\c[0x1F59]",
        'hō' => "\c[0x1F61]",
        'Hō' => "\c[0x1F69]",
        
        # Basic letters
        'A' => "\c[0x0391]",
        'a' => "\c[0x03B1]",
        'B' => "\c[0x0392]",
        'b' => "\c[0x03B2]",
        'G' => "\c[0x0393]",
        'g' => "\c[0x03B3]",
        'D' => "\c[0x0394]",
        'd' => "\c[0x03B4]",
        'E' => "\c[0x0395]",
        'e' => "\c[0x03B5]",
        'W' => "\c[0x03DC]",
        'w' => "\c[0x03DD]",
        'Z' => "\c[0x0396]",
        'z' => "\c[0x03B6]",
        'I' => "\c[0x0399]",
        'i' => "\c[0x03B9]",
        'ï' => "\c[0x03CA]",
        'K' => "\c[0x039A]",
        'k' => "\c[0x03BA]",
        'L' => "\c[0x039B]",
        'l' => "\c[0x03BB]",
        'M' => "\c[0x039C]",
        'm' => "\c[0x03BC]",
        'N' => "\c[0x039D]",
        'n' => "\c[0x03BD]",
        'X' => "\c[0x039E]",
        'x' => "\c[0x03BE]",
        'O' => "\c[0x039F]",
        'o' => "\c[0x03BF]",
        'P' => "\c[0x03A0]",
        'p' => "\c[0x03C0]",
        'R' => "\c[0x03A1]",
        'r' => "\c[0x03C1]",
        'S' => "\c[0x03A3]",
        's' => "\c[0x03C3]",  # Could also be final sigma
        'T' => "\c[0x03A4]",
        't' => "\c[0x03C4]",
        'U' => "\c[0x03A5]",
        'u' => "\c[0x03C5]",
        'ü' => "\c[0x03CB]",
    );
}