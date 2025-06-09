use Lang::Transliterate :ALL;

unit class Lang::Transliterate::El::ISO843 does Lang::Transliterate::Transliterator;

# Greek ISO 843 (ELOT 743) Transliteration
# Based on the ISO 843:1997 standard for Greek transliteration

my %base-mappings = (
    # Basic Greek letters
    'Α' => 'A',
    'α' => 'a',
    'Β' => 'V',
    'β' => 'v',
    'Γ' => 'G',
    'γ' => 'g',
    'Δ' => 'D',
    'δ' => 'd',
    'Ε' => 'E',
    'ε' => 'e',
    'Ζ' => 'Z',
    'ζ' => 'z',
    'Η' => 'Ī',
    'η' => 'ī',
    'Θ' => 'Th',
    'θ' => 'th',
    'Ι' => 'I',
    'ι' => 'i',
    'Κ' => 'K',
    'κ' => 'k',
    'Λ' => 'L',
    'λ' => 'l',
    'Μ' => 'M',
    'μ' => 'm',
    'Ν' => 'N',
    'ν' => 'n',
    'Ξ' => 'X',
    'ξ' => 'x',
    'Ο' => 'O',
    'ο' => 'o',
    'Π' => 'P',
    'π' => 'p',
    'Ρ' => 'R',
    'ρ' => 'r',
    'Σ' => 'S',
    'σ' => 's',
    'ς' => 's',      # Final sigma
    'Τ' => 'T',
    'τ' => 't',
    'Υ' => 'Y',
    'υ' => 'y',
    'Φ' => 'F',
    'φ' => 'f',
    'Χ' => 'Ch',
    'χ' => 'ch',
    'Ψ' => 'Ps',
    'ψ' => 'ps',
    'Ω' => 'Ō',
    'ω' => 'ō',
    
    # Letters with acute accent
    'Ά' => 'Á',
    'ά' => 'á',
    'Έ' => 'É',
    'έ' => 'é',
    'Ή' => "Ī\c[COMBINING ACUTE ACCENT]",      # Ī́
    'ή' => "ī\c[COMBINING ACUTE ACCENT]",      # ī́
    'Ί' => 'Í',
    'ί' => 'í',
    'Ό' => 'Ó',
    'ό' => 'ó',
    'Ύ' => 'Ý',
    'ύ' => 'ý',
    'Ώ' => 'Ṓ',
    'ώ' => 'ṓ',
    
    # Letters with diaeresis
    'Ϊ' => 'Ï',
    'ϊ' => 'ï',
    'Ϋ' => 'Ÿ',
    'ϋ' => 'ÿ',
    
    # Letters with diaeresis and acute accent
    'ΐ' => 'ḯ',      # iota with diaeresis and acute
    'ΰ' => "ÿ\c[COMBINING ACUTE ACCENT]",      # upsilon with diaeresis and acute
    
    # Double vowel combinations (digraphs)
    'αυ' => 'au',
    'Αυ' => 'Au',
    'ΑΥ' => 'AU',
    'ευ' => 'eu',
    'Ευ' => 'Eu',
    'ΕΥ' => 'EU',
    'ου' => 'ou',
    'Ου' => 'Ou',
    'ΟΥ' => 'OU',
    
    # Double vowel combinations with accents
    'αύ' => 'aú',
    'Αύ' => 'Aú',
    'εύ' => 'eú',
    'Εύ' => 'Eú',
    'ού' => 'oú',
    'Ού' => 'Oú',
    
    # Ancient Greek additional letters (if needed)
    'Ϝ' => 'W',      # Digamma
    'ϝ' => 'w',
    'Ϻ' => 'S',      # San
    'ϻ' => 's',
    'Ϙ' => 'Q',      # Koppa
    'ϙ' => 'q',
    'Ϡ' => 'Ss',     # Sampi
    'ϡ' => 'ss',
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Greek ISO 843 reverse mappings
    return (
        # Multi-character mappings first
        'au' => 'αυ',
        'Au' => 'Αυ',
        'AU' => 'ΑΥ',
        'eu' => 'ευ',
        'Eu' => 'Ευ',
        'EU' => 'ΕΥ',
        'ou' => 'ου',
        'Ou' => 'Ου',
        'OU' => 'ΟΥ',
        'aú' => 'αύ',
        'Aú' => 'Αύ',
        'eú' => 'εύ',
        'Eú' => 'Εύ',
        'oú' => 'ού',
        'Oú' => 'Ού',
        'th' => 'θ',
        'Th' => 'Θ',
        'TH' => 'Θ',
        'ch' => 'χ',
        'Ch' => 'Χ',
        'CH' => 'Χ',
        'ps' => 'ψ',
        'Ps' => 'Ψ',
        'PS' => 'Ψ',
        'ss' => 'ϡ',
        'Ss' => 'Ϡ',
        
        # Letters with diacritics
        'Á' => 'Ά',
        'á' => 'ά',
        'É' => 'Έ',
        'é' => 'έ',
        'Í' => 'Ί',
        'í' => 'ί',
        'Ó' => 'Ό',
        'ó' => 'ό',
        'Ý' => 'Ύ',
        'ý' => 'ύ',
        'Ï' => 'Ϊ',
        'ï' => 'ϊ',
        'Ÿ' => 'Ϋ',
        'ÿ' => 'ϋ',
        'ḯ' => 'ΐ',
        'Ī' => 'Η',
        'ī' => 'η',
        'Ō' => 'Ω',
        'ō' => 'ω',
        'Ṓ' => 'Ώ',
        'ṓ' => 'ώ',
        
        # Simple letters
        'A' => 'Α',
        'a' => 'α',
        'V' => 'Β',
        'v' => 'β',
        'G' => 'Γ',
        'g' => 'γ',
        'D' => 'Δ',
        'd' => 'δ',
        'E' => 'Ε',
        'e' => 'ε',
        'Z' => 'Ζ',
        'z' => 'ζ',
        'I' => 'Ι',
        'i' => 'ι',
        'K' => 'Κ',
        'k' => 'κ',
        'L' => 'Λ',
        'l' => 'λ',
        'M' => 'Μ',
        'm' => 'μ',
        'N' => 'Ν',
        'n' => 'ν',
        'X' => 'Ξ',
        'x' => 'ξ',
        'O' => 'Ο',
        'o' => 'ο',
        'P' => 'Π',
        'p' => 'π',
        'R' => 'Ρ',
        'r' => 'ρ',
        'S' => 'Σ',
        's' => 'σ',
        'T' => 'Τ',
        't' => 'τ',
        'Y' => 'Υ',
        'y' => 'υ',
        'F' => 'Φ',
        'f' => 'φ',
        'W' => 'Ϝ',
        'w' => 'ϝ',
        'Q' => 'Ϙ',
        'q' => 'ϙ',
    );
}