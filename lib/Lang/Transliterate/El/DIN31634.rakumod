use Lang::Transliterate :ALL;

unit class Lang::Transliterate::El::DIN31634 does Lang::Transliterate::Transliterator;

# Greek DIN 31634 Transliteration
# Based on the DIN 31634 standard for Greek transliteration

my %base-mappings = (
    # Basic Greek letters
    'Α' => 'A',
    'α' => 'a',
    'Β' => 'B',
    'β' => 'b',
    'Γ' => 'G',
    'γ' => 'g',
    'Δ' => 'D',
    'δ' => 'd',
    'Ε' => 'E',
    'ε' => 'e',
    'Ζ' => 'Z',
    'ζ' => 'z',
    'Η' => 'Ē',
    'η' => 'ē',
    'Θ' => 'TH',
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
    'Φ' => 'PH',
    'φ' => 'ph',
    'Χ' => 'CH',
    'χ' => 'ch',
    'Ψ' => 'PS',
    'ψ' => 'ps',
    'Ω' => 'Ō',
    'ω' => 'ō',
    
    # Double vowel combinations (digraphs) - must come before single letters
    'ΑΥ' => 'AU',
    'αυ' => 'au',
    'Αυ' => 'Au',
    'ΕΥ' => 'EU',
    'ευ' => 'eu',
    'Ευ' => 'Eu',
    'ΗΥ' => 'ĒU',
    'ηυ' => 'ēu',
    'Ηυ' => 'Ēu',
    'ΟΥ' => 'U',
    'ου' => 'u',
    'Ου' => 'U',
    
    # Digraphs with diaeresis
    'ΑΫ' => 'AŸ',
    'αϋ' => 'aÿ',
    'Αϋ' => 'Aÿ',
    'ΟΫ' => 'OŸ',
    'οϋ' => 'oÿ',
    'Οϋ' => 'Oÿ',
    
    # Gamma combinations
    'ΓΓ' => 'NG',
    'γγ' => 'ng',
    'Γγ' => 'Ng',
    
    # Gamma + consonant combinations (context will be handled separately)
    'ΓΚ' => 'GK',     # at beginning of word, NK in middle (handled by context)
    'γκ' => 'gk',     # at beginning of word, nk in middle (handled by context)
    'Γκ' => 'Gk',     # at beginning of word, Nk in middle (handled by context)
    'ΓΞ' => 'NX',
    'γξ' => 'nx',
    'Γξ' => 'Nx',
    'ΓΧ' => 'NCH',
    'γχ' => 'nch',
    'Γχ' => 'Nch',
    
    # Breathing marks - rough breathing only transliterated at word beginning
    'ἁ' => 'ha',      # alpha with rough breathing
    'ἅ' => 'ha',      # alpha with rough breathing and acute
    'ἃ' => 'ha',      # alpha with rough breathing and grave
    'ἇ' => 'ha',      # alpha with rough breathing and circumflex
    'Ἁ' => 'Ha',      # capital alpha with rough breathing
    'Ἅ' => 'Ha',      # capital alpha with rough breathing and acute
    'Ἃ' => 'Ha',      # capital alpha with rough breathing and grave
    'Ἇ' => 'Ha',      # capital alpha with rough breathing and circumflex
    
    'ἑ' => 'he',      # epsilon with rough breathing
    'ἕ' => 'he',      # epsilon with rough breathing and acute
    'ἓ' => 'he',      # epsilon with rough breathing and grave
    'Ἑ' => 'He',      # capital epsilon with rough breathing
    'Ἕ' => 'He',      # capital epsilon with rough breathing and acute
    'Ἓ' => 'He',      # capital epsilon with rough breathing and grave
    
    'ἡ' => 'hē',      # eta with rough breathing
    'ἥ' => 'hē',      # eta with rough breathing and acute
    'ἣ' => 'hē',      # eta with rough breathing and grave
    'ἧ' => 'hē',      # eta with rough breathing and circumflex
    'Ἡ' => 'Hē',      # capital eta with rough breathing
    'Ἥ' => 'Hē',      # capital eta with rough breathing and acute
    'Ἣ' => 'Hē',      # capital eta with rough breathing and grave
    'Ἧ' => 'Hē',      # capital eta with rough breathing and circumflex
    
    'ἱ' => 'hi',      # iota with rough breathing
    'ἵ' => 'hi',      # iota with rough breathing and acute
    'ἳ' => 'hi',      # iota with rough breathing and grave
    'ἷ' => 'hi',      # iota with rough breathing and circumflex
    'Ἱ' => 'Hi',      # capital iota with rough breathing
    'Ἵ' => 'Hi',      # capital iota with rough breathing and acute
    'Ἳ' => 'Hi',      # capital iota with rough breathing and grave
    'Ἷ' => 'Hi',      # capital iota with rough breathing and circumflex
    
    'ὁ' => 'ho',      # omicron with rough breathing
    'ὅ' => 'ho',      # omicron with rough breathing and acute
    'ὃ' => 'ho',      # omicron with rough breathing and grave
    'Ὁ' => 'Ho',      # capital omicron with rough breathing
    'Ὅ' => 'Ho',      # capital omicron with rough breathing and acute
    'Ὃ' => 'Ho',      # capital omicron with rough breathing and grave
    
    'ὑ' => 'hy',      # upsilon with rough breathing
    'ὕ' => 'hy',      # upsilon with rough breathing and acute
    'ὓ' => 'hy',      # upsilon with rough breathing and grave
    'ὗ' => 'hy',      # upsilon with rough breathing and circumflex
    'Ὑ' => 'Hy',      # capital upsilon with rough breathing
    'Ὕ' => 'Hy',      # capital upsilon with rough breathing and acute
    'Ὓ' => 'Hy',      # capital upsilon with rough breathing and grave
    'Ὗ' => 'Hy',      # capital upsilon with rough breathing and circumflex
    
    'ὡ' => 'hō',      # omega with rough breathing
    'ὥ' => 'hō',      # omega with rough breathing and acute
    'ὣ' => 'hō',      # omega with rough breathing and grave
    'ὧ' => 'hō',      # omega with rough breathing and circumflex
    'Ὡ' => 'Hō',      # capital omega with rough breathing
    'Ὥ' => 'Hō',      # capital omega with rough breathing and acute
    'Ὣ' => 'Hō',      # capital omega with rough breathing and grave
    'Ὧ' => 'Hō',      # capital omega with rough breathing and circumflex
    
    # Special rho combinations
    'ῥ' => 'rh',      # rho with rough breathing
    'ῤ' => 'r',       # rho with smooth breathing (normal rho)
    'Ῥ' => 'Rh',      # capital rho with rough breathing
    'ῥῥ' => 'rrh',    # double rho with rough breathing
    
    # Smooth breathing marks are omitted (not transliterated)
    'ἀ' => 'a',       # alpha with smooth breathing
    'ἄ' => 'a',       # alpha with smooth breathing and acute
    'ἂ' => 'a',       # alpha with smooth breathing and grave
    'ἆ' => 'a',       # alpha with smooth breathing and circumflex
    'Ἀ' => 'A',       # capital alpha with smooth breathing
    'Ἄ' => 'A',       # capital alpha with smooth breathing and acute
    'Ἂ' => 'A',       # capital alpha with smooth breathing and grave
    'Ἆ' => 'A',       # capital alpha with smooth breathing and circumflex
    
    'ἐ' => 'e',       # epsilon with smooth breathing
    'ἔ' => 'e',       # epsilon with smooth breathing and acute
    'ἒ' => 'e',       # epsilon with smooth breathing and grave
    'Ἐ' => 'E',       # capital epsilon with smooth breathing
    'Ἔ' => 'E',       # capital epsilon with smooth breathing and acute
    'Ἒ' => 'E',       # capital epsilon with smooth breathing and grave
    
    'ἠ' => 'ē',       # eta with smooth breathing
    'ἤ' => 'ē',       # eta with smooth breathing and acute
    'ἢ' => 'ē',       # eta with smooth breathing and grave
    'ἦ' => 'ē',       # eta with smooth breathing and circumflex
    'Ἠ' => 'Ē',       # capital eta with smooth breathing
    'Ἤ' => 'Ē',       # capital eta with smooth breathing and acute
    'Ἢ' => 'Ē',       # capital eta with smooth breathing and grave
    'Ἦ' => 'Ē',       # capital eta with smooth breathing and circumflex
    
    'ἰ' => 'i',       # iota with smooth breathing
    'ἴ' => 'i',       # iota with smooth breathing and acute
    'ἲ' => 'i',       # iota with smooth breathing and grave
    'ἶ' => 'i',       # iota with smooth breathing and circumflex
    'Ἰ' => 'I',       # capital iota with smooth breathing
    'Ἴ' => 'I',       # capital iota with smooth breathing and acute
    'Ἲ' => 'I',       # capital iota with smooth breathing and grave
    'Ἶ' => 'I',       # capital iota with smooth breathing and circumflex
    
    'ὀ' => 'o',       # omicron with smooth breathing
    'ὄ' => 'o',       # omicron with smooth breathing and acute
    'ὂ' => 'o',       # omicron with smooth breathing and grave
    'Ὀ' => 'O',       # capital omicron with smooth breathing
    'Ὄ' => 'O',       # capital omicron with smooth breathing and acute
    'Ὂ' => 'O',       # capital omicron with smooth breathing and grave
    
    'ὠ' => 'ō',       # omega with smooth breathing
    'ὤ' => 'ō',       # omega with smooth breathing and acute
    'ὢ' => 'ō',       # omega with smooth breathing and grave
    'ὦ' => 'ō',       # omega with smooth breathing and circumflex
    'Ὠ' => 'Ō',       # capital omega with smooth breathing
    'Ὤ' => 'Ō',       # capital omega with smooth breathing and acute
    'Ὢ' => 'Ō',       # capital omega with smooth breathing and grave
    'Ὦ' => 'Ō',       # capital omega with smooth breathing and circumflex
    
    # Letters with diaeresis (preserved)
    'Ϊ' => 'Ï',
    'ϊ' => 'ï',
    'Ϋ' => 'Ÿ',
    'ϋ' => 'ÿ',
    
    # Punctuation
    ';' => '?',        # Greek question mark
    '·' => ';',        # Greek semicolon (middle dot)
    
    # Remove accents, breathing marks, iota subscript, etc. (except diaeresis)
    # Acute accents - removed
    'ά' => 'a',
    'έ' => 'e',
    'ή' => 'ē',
    'ί' => 'i',
    'ό' => 'o',
    'ύ' => 'y',
    'ώ' => 'ō',
    'Ά' => 'A',
    'Έ' => 'E',
    'Ή' => 'Ē',
    'Ί' => 'I',
    'Ό' => 'O',
    'Ύ' => 'Y',
    'Ώ' => 'Ō',
    
    # Grave accents - removed
    'ὰ' => 'a',
    'ὲ' => 'e',
    'ὴ' => 'ē',
    'ὶ' => 'i',
    'ὸ' => 'o',
    'ὺ' => 'y',
    'ὼ' => 'ō',
    
    # Circumflex accents - removed
    'ᾶ' => 'a',
    'ῆ' => 'ē',
    'ῖ' => 'i',
    'ῦ' => 'y',
    'ῶ' => 'ō',
    
    # Iota subscript - removed
    'ᾳ' => 'a',
    'ῃ' => 'ē',
    'ῳ' => 'ō',
    'ᾼ' => 'A',
    'ῌ' => 'Ē',
    'ῼ' => 'Ō',
);

# Override to handle context-sensitive gamma combinations
method transliterate-context-aware(Str $text --> Str) {
    # Use a specialized context-aware mapping that handles γκ rules
    my %mappings = self.get-mappings();
    return self!apply-din31634-context-mapping($text, %mappings);
}

# Apply DIN 31634 context rules with main module's capitalization logic
method !apply-din31634-context-mapping(Str $text, %mappings --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Handle γκ context sensitivity (gk at beginning, nk in middle)
        if $i + 1 < @chars.elems && (@chars[$i] eq 'γ' && @chars[$i + 1] eq 'κ') {
            my $at-beginning = ($i == 0) || (@chars[$i - 1] ~~ /\s/ || @chars[$i - 1] ~~ /\W/);
            $result ~= $at-beginning ?? 'gk' !! 'nk';
            $i += 2;
            $found = True;
        }
        elsif $i + 1 < @chars.elems && (@chars[$i] eq 'Γ' && @chars[$i + 1] eq 'κ') {
            my $at-beginning = ($i == 0) || (@chars[$i - 1] ~~ /\s/ || @chars[$i - 1] ~~ /\W/);
            $result ~= $at-beginning ?? 'Gk' !! 'Nk';
            $i += 2;
            $found = True;
        }
        elsif $i + 1 < @chars.elems && (@chars[$i] eq 'Γ' && @chars[$i + 1] eq 'Κ') {
            my $at-beginning = ($i == 0) || (@chars[$i - 1] ~~ /\s/ || @chars[$i - 1] ~~ /\W/);
            $result ~= $at-beginning ?? 'GK' !! 'NK';
            $i += 2;
            $found = True;
        }
        
        if !$found {
            # Use main module's mapping logic for everything else
            # Try to match longest sequences first (up to 3 characters for digraphs)
            for (3, 2, 1) -> $len {
                if $i + $len <= @chars.elems {
                    my $substr = @chars[$i ..^ $i + $len].join;
                    
                    # First try exact match
                    if %mappings{$substr}:exists {
                        $result ~= %mappings{$substr};
                        $i += $len;
                        $found = True;
                        last;
                    }
                    
                    # If no exact match and it's a single uppercase char, try lowercase
                    # This leverages the main module's capitalization logic
                    if $len == 1 && $substr ~~ /<:Lu>/ {
                        my $lower = $substr.lc;
                        if %mappings{$lower}:exists {
                            my $mapped = %mappings{$lower};
                            
                            # Apply intelligent capitalization like main module
                            my $apply-full-upper = False;
                            if $i > 0 && $i + 1 < @chars.elems {
                                $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/ && @chars[$i + 1] ~~ /<:Lu>/;
                            } elsif $i == 0 && @chars.elems > 1 {
                                $apply-full-upper = @chars[$i + 1] ~~ /<:Lu>/;
                            } elsif $i == @chars.elems - 1 && $i > 0 {
                                $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/;
                            }
                            
                            $result ~= $apply-full-upper ?? $mapped.uc !! $mapped.tc;
                            $i += $len;
                            $found = True;
                            last;
                        }
                    }
                }
            }
        }
        
        # If no mapping found, keep original character
        if !$found {
            $result ~= @chars[$i];
            $i++;
        }
    }
    
    return $result;
}

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Greek DIN 31634 reverse mappings
    return (
        # Multi-character mappings first
        'au' => 'αυ',
        'Au' => 'Αυ',
        'AU' => 'ΑΥ',
        'eu' => 'ευ',
        'Eu' => 'Ευ',
        'EU' => 'ΕΥ',
        'ēu' => 'ηυ',
        'Ēu' => 'Ηυ',
        'ĒU' => 'ΗΥ',
        'aÿ' => 'αϋ',
        'Aÿ' => 'Αϋ',
        'AŸ' => 'ΑΫ',
        'oÿ' => 'οϋ',
        'Oÿ' => 'Οϋ',
        'OŸ' => 'ΟΫ',
        'ng' => 'γγ',
        'Ng' => 'Γγ',
        'NG' => 'ΓΓ',
        'gk' => 'γκ',
        'Gk' => 'Γκ',
        'GK' => 'ΓΚ',
        'nk' => 'γκ',
        'Nk' => 'Γκ',
        'NK' => 'ΓΚ',
        'nx' => 'γξ',
        'Nx' => 'Γξ',
        'NX' => 'ΓΞ',
        'nch' => 'γχ',
        'Nch' => 'Γχ',
        'NCH' => 'ΓΧ',
        'th' => 'θ',
        'TH' => 'Θ',
        'ph' => 'φ',
        'PH' => 'Φ',
        'ch' => 'χ',
        'CH' => 'Χ',
        'ps' => 'ψ',
        'PS' => 'Ψ',
        'rh' => 'ῥ',
        'Rh' => 'Ῥ',
        'rrh' => 'ῥῥ',
        
        # Letters with diacritics
        'Ï' => 'Ϊ',
        'ï' => 'ϊ',
        'Ÿ' => 'Ϋ',
        'ÿ' => 'ϋ',
        'Ē' => 'Η',
        'ē' => 'η',
        'Ō' => 'Ω',
        'ō' => 'ω',
        
        # Simple letters
        'A' => 'Α',
        'a' => 'α',
        'B' => 'Β',
        'b' => 'β',
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
        'U' => 'ΟΥ',
        'u' => 'ου',
        
        # Punctuation
        '?' => ';',
        ';' => '·',
    );
}