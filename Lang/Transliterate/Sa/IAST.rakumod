use Lang::Transliterate;

unit class Lang::Transliterate::Sa::IAST does Lang::Transliterate::Transliterator;

# IAST - International Alphabet of Sanskrit Transliteration
# Using proper Unicode characters with normalization support
# Building mappings programmatically to avoid parser issues

my %base-mappings;

# Initialize mappings in BUILD to avoid parsing issues with Unicode literals
method BUILD() {
    # Build the hash programmatically to avoid Unicode parsing issues
    self!initialize-mappings();
}

method !initialize-mappings() {
    # Build all characters using Unicode character names to avoid parser issues
    
    # Use Unicode character names for all Devanagari characters
    my $a = "\c[DEVANAGARI LETTER A]";
    my $aa = "\c[DEVANAGARI LETTER AA]";
    my $i = "\c[DEVANAGARI LETTER I]";
    my $ii = "\c[DEVANAGARI LETTER II]";
    my $u = "\c[DEVANAGARI LETTER U]";
    my $uu = "\c[DEVANAGARI LETTER UU]";
    my $ri = "\c[DEVANAGARI LETTER VOCALIC R]";
    my $rii = "\c[DEVANAGARI LETTER VOCALIC RR]";
    my $li = "\c[DEVANAGARI LETTER VOCALIC L]";
    my $lii = "\c[DEVANAGARI LETTER VOCALIC LL]";
    my $e = "\c[DEVANAGARI LETTER E]";
    my $ai = "\c[DEVANAGARI LETTER AI]";
    my $o = "\c[DEVANAGARI LETTER O]";
    my $au = "\c[DEVANAGARI LETTER AU]";
    
    my $anusvara = "\c[DEVANAGARI SIGN ANUSVARA]";
    my $visarga = "\c[DEVANAGARI SIGN VISARGA]";
    my $chandrabindu = "\c[DEVANAGARI SIGN CANDRABINDU]";
    my $avagraha = "\c[DEVANAGARI SIGN AVAGRAHA]";
    
    # Additional Vedic characters and tone marks
    my $udatta = "\c[DEVANAGARI STRESS SIGN UDATTA]";
    my $anudatta = "\c[DEVANAGARI STRESS SIGN ANUDATTA]";
    my $grave = "\c[DEVANAGARI GRAVE ACCENT]";
    my $acute = "\c[DEVANAGARI ACUTE ACCENT]";
    
    # Additional Vedic marks and rare characters
    my $jihvamuliya = "\c[DEVANAGARI LETTER SSA]" ~ "\c[DEVANAGARI SIGN VIRAMA]";  # Jihvamuliya ẖ
    my $upadhmaniya = "\c[DEVANAGARI LETTER FA]";  # Upadhmaniya ḫ
    
    # Rare Vedic characters
    my $vedic_tone_karshana = "\c[VEDIC TONE KARSHANA]";
    my $vedic_tone_shara = "\c[VEDIC TONE SHARA]";
    my $vedic_tone_prenkha = "\c[VEDIC TONE PRENKHA]";
    
    # Additional rare characters
    my $candra_e = "\c[DEVANAGARI VOWEL SIGN CANDRA E]";
    my $short_e = "\c[DEVANAGARI VOWEL SIGN SHORT E]";
    my $candra_o = "\c[DEVANAGARI VOWEL SIGN CANDRA O]";
    my $short_o = "\c[DEVANAGARI VOWEL SIGN SHORT O]";
    
    # Additional consonants
    my $kssa = "\c[DEVANAGARI LETTER KHHA]";  # क्ष as single character
    my $jnya = "\c[DEVANAGARI LETTER GGA]";   # ज्ञ as single character
    
    # Punctuation
    my $danda = "\c[DEVANAGARI DANDA]";
    my $double_danda = "\c[DEVANAGARI DOUBLE DANDA]";
    my $om = "\c[DEVANAGARI OM]";
    
    # Nukta characters (for foreign sounds)
    my $qa = "\c[DEVANAGARI LETTER QA]";      # क़
    my $khha = "\c[DEVANAGARI LETTER KHHA]";  # ख़  
    my $ghha = "\c[DEVANAGARI LETTER GHHA]";  # ग़
    my $za = "\c[DEVANAGARI LETTER ZA]";      # ज़
    my $dddha = "\c[DEVANAGARI LETTER DDDHA]";# ड़
    my $rha = "\c[DEVANAGARI LETTER RHA]";    # ढ़
    my $fa = "\c[DEVANAGARI LETTER FA]";      # फ़
    my $yya = "\c[DEVANAGARI LETTER YYA]";    # य़
    
    # Vedic extensions
    my $vocalic_rr = "\c[DEVANAGARI LETTER VOCALIC RR]";
    my $vocalic_ll = "\c[DEVANAGARI LETTER VOCALIC LL]";
    
    # Sindhi/Marathi/Nepali extensions  
    my $zha = "\c[DEVANAGARI LETTER ZHA]";
    my $heavy_ya = "\c[DEVANAGARI LETTER HEAVY YA]";
    
    # Special combining marks
    my $nukta = "\c[DEVANAGARI SIGN NUKTA]";
    my $abbrev = "\c[DEVANAGARI ABBREVIATION SIGN]";
    
    my $ka = "\c[DEVANAGARI LETTER KA]";
    my $kha = "\c[DEVANAGARI LETTER KHA]";
    my $ga = "\c[DEVANAGARI LETTER GA]";
    my $gha = "\c[DEVANAGARI LETTER GHA]";
    my $nga = "\c[DEVANAGARI LETTER NGA]";
    
    my $ca = "\c[DEVANAGARI LETTER CA]";
    my $cha = "\c[DEVANAGARI LETTER CHA]";
    my $ja = "\c[DEVANAGARI LETTER JA]";
    my $jha = "\c[DEVANAGARI LETTER JHA]";
    my $nya = "\c[DEVANAGARI LETTER NYA]";
    
    my $tta = "\c[DEVANAGARI LETTER TTA]";
    my $ttha = "\c[DEVANAGARI LETTER TTHA]";
    my $dda = "\c[DEVANAGARI LETTER DDA]";
    my $ddha = "\c[DEVANAGARI LETTER DDHA]";
    my $nna = "\c[DEVANAGARI LETTER NNA]";
    
    my $ta = "\c[DEVANAGARI LETTER TA]";
    my $tha = "\c[DEVANAGARI LETTER THA]";
    my $da = "\c[DEVANAGARI LETTER DA]";
    my $dha = "\c[DEVANAGARI LETTER DHA]";
    my $na = "\c[DEVANAGARI LETTER NA]";
    
    my $pa = "\c[DEVANAGARI LETTER PA]";
    my $pha = "\c[DEVANAGARI LETTER PHA]";
    my $ba = "\c[DEVANAGARI LETTER BA]";
    my $bha = "\c[DEVANAGARI LETTER BHA]";
    my $ma = "\c[DEVANAGARI LETTER MA]";
    
    my $ha = "\c[DEVANAGARI LETTER HA]";
    my $ya = "\c[DEVANAGARI LETTER YA]";
    my $ra = "\c[DEVANAGARI LETTER RA]";
    my $la = "\c[DEVANAGARI LETTER LA]";
    my $va = "\c[DEVANAGARI LETTER VA]";
    
    my $sha = "\c[DEVANAGARI LETTER SHA]";
    my $ssa = "\c[DEVANAGARI LETTER SSA]";
    my $sa = "\c[DEVANAGARI LETTER SA]";
    my $lla = "\c[DEVANAGARI LETTER LLA]";
    
    my $aa_matra = "\c[DEVANAGARI VOWEL SIGN AA]";
    my $i_matra = "\c[DEVANAGARI VOWEL SIGN I]";
    my $ii_matra = "\c[DEVANAGARI VOWEL SIGN II]";
    my $u_matra = "\c[DEVANAGARI VOWEL SIGN U]";
    my $uu_matra = "\c[DEVANAGARI VOWEL SIGN UU]";
    my $ri_matra = "\c[DEVANAGARI VOWEL SIGN VOCALIC R]";
    my $rii_matra = "\c[DEVANAGARI VOWEL SIGN VOCALIC RR]";
    my $li_matra = "\c[DEVANAGARI VOWEL SIGN VOCALIC L]";
    my $lii_matra = "\c[DEVANAGARI VOWEL SIGN VOCALIC LL]";
    my $e_matra = "\c[DEVANAGARI VOWEL SIGN E]";
    my $ai_matra = "\c[DEVANAGARI VOWEL SIGN AI]";
    my $o_matra = "\c[DEVANAGARI VOWEL SIGN O]";
    my $au_matra = "\c[DEVANAGARI VOWEL SIGN AU]";
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    
    my $digit0 = "\c[DEVANAGARI DIGIT ZERO]";
    my $digit1 = "\c[DEVANAGARI DIGIT ONE]";
    my $digit2 = "\c[DEVANAGARI DIGIT TWO]";
    my $digit3 = "\c[DEVANAGARI DIGIT THREE]";
    my $digit4 = "\c[DEVANAGARI DIGIT FOUR]";
    my $digit5 = "\c[DEVANAGARI DIGIT FIVE]";
    my $digit6 = "\c[DEVANAGARI DIGIT SIX]";
    my $digit7 = "\c[DEVANAGARI DIGIT SEVEN]";
    my $digit8 = "\c[DEVANAGARI DIGIT EIGHT]";
    my $digit9 = "\c[DEVANAGARI DIGIT NINE]";
    
    # Vowels
    %base-mappings{$a} = 'a';
    %base-mappings{$aa} = 'ā';
    %base-mappings{$i} = 'i';
    %base-mappings{$ii} = 'ī';
    %base-mappings{$u} = 'u';
    %base-mappings{$uu} = 'ū';
    %base-mappings{$ri} = 'ṛ';
    %base-mappings{$rii} = 'ṝ';
    %base-mappings{$li} = 'ḷ';
    %base-mappings{$lii} = 'ḹ';
    %base-mappings{$e} = 'e';
    %base-mappings{$ai} = 'ai';
    %base-mappings{$o} = 'o';
    %base-mappings{$au} = 'au';
    
    # Special marks
    %base-mappings{$anusvara} = 'ṁ';
    %base-mappings{$visarga} = 'ḥ';
    %base-mappings{$chandrabindu} = 'm̐';
    %base-mappings{$avagraha} = "'";
    
    # Consonants - Velars
    %base-mappings{$ka} = 'k';
    %base-mappings{$kha} = 'kh';
    %base-mappings{$ga} = 'g';
    %base-mappings{$gha} = 'gh';
    %base-mappings{$nga} = 'ṅ';
    
    # Palatals
    %base-mappings{$ca} = 'c';
    %base-mappings{$cha} = 'ch';
    %base-mappings{$ja} = 'j';
    %base-mappings{$jha} = 'jh';
    %base-mappings{$nya} = 'ñ';
    
    # Retroflexes
    %base-mappings{$tta} = 'ṭ';
    %base-mappings{$ttha} = 'ṭh';
    %base-mappings{$dda} = 'ḍ';
    %base-mappings{$ddha} = 'ḍh';
    %base-mappings{$nna} = 'ṇ';
    
    # Dentals
    %base-mappings{$ta} = 't';
    %base-mappings{$tha} = 'th';
    %base-mappings{$da} = 'd';
    %base-mappings{$dha} = 'dh';
    %base-mappings{$na} = 'n';
    
    # Labials
    %base-mappings{$pa} = 'p';
    %base-mappings{$pha} = 'ph';
    %base-mappings{$ba} = 'b';
    %base-mappings{$bha} = 'bh';
    %base-mappings{$ma} = 'm';
    
    # Approximants
    %base-mappings{$ha} = 'h';
    %base-mappings{$ya} = 'y';
    %base-mappings{$ra} = 'r';
    %base-mappings{$la} = 'l';
    %base-mappings{$va} = 'v';
    
    # Sibilants
    %base-mappings{$sha} = 'ś';
    %base-mappings{$ssa} = 'ṣ';
    %base-mappings{$sa} = 's';
    
    # Vedic
    %base-mappings{$lla} = 'ḻ';
    
    # Additional characters
    %base-mappings{$kssa} = 'kṣ';
    %base-mappings{$jnya} = 'jñ';
    
    # Vedic accent marks (typically not transliterated in IAST)
    %base-mappings{$udatta} = '';      # Udatta accent
    %base-mappings{$anudatta} = '';    # Anudatta accent
    %base-mappings{$grave} = '';       # Grave accent
    %base-mappings{$acute} = '';       # Acute accent
    
    # Punctuation
    %base-mappings{$danda} = '।';
    %base-mappings{$double_danda} = '॥';
    %base-mappings{$om} = 'oṁ';
    
    # Nukta characters (foreign sounds adapted to Devanagari)
    %base-mappings{$qa} = 'q';
    %base-mappings{$khha} = 'x';
    %base-mappings{$ghha} = 'ġ';
    %base-mappings{$za} = 'z';
    %base-mappings{$dddha} = 'ṛ';
    %base-mappings{$rha} = 'ṛh';
    %base-mappings{$fa} = 'f';
    %base-mappings{$yya} = 'ẏ';
    
    # Extended Vedic characters
    %base-mappings{$vocalic_rr} = 'ṝ';
    %base-mappings{$vocalic_ll} = 'ḹ';
    
    # Additional characters
    %base-mappings{$zha} = 'zh';
    %base-mappings{$heavy_ya} = 'ẏ';
    
    # Special marks
    %base-mappings{$nukta} = '';      # Combining mark, handled separately
    %base-mappings{$abbrev} = '.';
    
    # Rare Vedic characters
    %base-mappings{$jihvamuliya} = 'ẖ';
    %base-mappings{$upadhmaniya} = 'ḫ';
    %base-mappings{$candra_e} = 'ĕ';
    %base-mappings{$short_e} = 'ĕ';
    %base-mappings{$candra_o} = 'ŏ';
    %base-mappings{$short_o} = 'ŏ';
    
    # Vedic tone marks (these are usually preserved or ignored)
    %base-mappings{$vedic_tone_karshana} = '';
    %base-mappings{$vedic_tone_shara} = '';
    %base-mappings{$vedic_tone_prenkha} = '';
    
    # Vowel signs (matras)
    %base-mappings{$aa_matra} = 'ā';
    %base-mappings{$i_matra} = 'i';
    %base-mappings{$ii_matra} = 'ī';
    %base-mappings{$u_matra} = 'u';
    %base-mappings{$uu_matra} = 'ū';
    %base-mappings{$ri_matra} = 'ṛ';
    %base-mappings{$rii_matra} = 'ṝ';
    %base-mappings{$li_matra} = 'ḷ';
    %base-mappings{$lii_matra} = 'ḹ';
    %base-mappings{$e_matra} = 'e';
    %base-mappings{$ai_matra} = 'ai';
    %base-mappings{$o_matra} = 'o';
    %base-mappings{$au_matra} = 'au';
    
    # Virama
    %base-mappings{$virama} = '';
    
    # Numbers
    %base-mappings{$digit0} = '0';
    %base-mappings{$digit1} = '1';
    %base-mappings{$digit2} = '2';
    %base-mappings{$digit3} = '3';
    %base-mappings{$digit4} = '4';
    %base-mappings{$digit5} = '5';
    %base-mappings{$digit6} = '6';
    %base-mappings{$digit7} = '7';
    %base-mappings{$digit8} = '8';
    %base-mappings{$digit9} = '9';
}

method !normalize-text(Str $text --> Str) {
    # Use NFD (Canonical Decomposition) for parsing
    # This separates composed characters into their components
    return $text.NFD.Str;
}

method !normalize-key(Str $key --> Str) {
    # Normalize hash keys to NFC for consistent lookup
    return $key.NFC.Str;
}

method get-mappings(--> Hash) {
    # Return normalized mappings
    my %normalized-mappings;
    for %base-mappings.kv -> $key, $value {
        %normalized-mappings{self!normalize-key($key)} = $value;
    }
    return %normalized-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Complete IAST transliteration handling real Devanagari text patterns
    my %mappings = self.get-mappings();
    my $result = '';
    
    # Split into Devanagari segments and process each
    my @segments = $text.split(/<-:devanagari>+/, :v);
    
    for @segments -> $segment {
        if $segment ~~ /<:devanagari>/ {
            # Process Devanagari segment
            $result ~= self!process-devanagari-segment($segment, %mappings);
        } else {
            # Non-Devanagari text, keep as-is
            $result ~= $segment;
        }
    }
    
    return $result;
}

method !process-devanagari-segment(Str $segment, %mappings --> Str) {
    my $result = '';
    # Use ords to get individual codepoints from grapheme clusters
    my @ords = $segment.ords;
    my $i = 0;
    
    while $i < @ords.elems {
        my $ord = @ords[$i];
        my $next-ord = ($i + 1 < @ords.elems) ?? @ords[$i + 1] !! 0;
        my $prev-ord = ($i > 0) ?? @ords[$i - 1] !! 0;
        
        my $char = $ord.chr;
        my $char-key = self!normalize-key($char);
        
        # Handle different character types
        if self!is-consonant($char) {
            # Check if this consonant should have inherent vowel
            my $consonant-transliteration = %mappings{$char-key} // '';
            
            if $next-ord == 0x093C {
                # Nukta combination - handle special foreign sounds
                my $nukta-combo = self!get-nukta-transliteration($ord);
                if $nukta-combo {
                    # Check if there's a vowel sign after nukta
                    my $after-nukta-ord = ($i + 2 < @ords.elems) ?? @ords[$i + 2] !! 0;
                    if $after-nukta-ord && self!is-vowel-sign($after-nukta-ord.chr) {
                        # Nukta + vowel sign
                        $result ~= $nukta-combo;
                        my $vowel-char = $after-nukta-ord.chr;
                        my $vowel-transliteration = %mappings{self!normalize-key($vowel-char)} // '';
                        $result ~= $vowel-transliteration;
                        $i += 3; # Skip nukta and vowel sign
                    } else {
                        # Just nukta, add inherent vowel
                        $result ~= $nukta-combo ~ 'a';
                        $i += 2; # Skip nukta
                    }
                } else {
                    # Unknown nukta combination, use base consonant
                    $result ~= $consonant-transliteration ~ 'a';
                    $i += 1;
                }
            } elsif $next-ord == 0x094D {
                # Explicit virama - no inherent vowel
                $result ~= $consonant-transliteration;
                $i += 2; # Skip virama
            } elsif $next-ord && self!is-vowel-sign($next-ord.chr) {
                # Consonant + vowel sign
                $result ~= $consonant-transliteration;
                my $next-char = $next-ord.chr;
                my $vowel-transliteration = %mappings{self!normalize-key($next-char)} // '';
                $result ~= $vowel-transliteration;
                $i += 2;
            } elsif $next-ord && self!is-conjunct-form-by-ords($ord, $next-ord) {
                # This appears to be a conjunct (consonant without inherent vowel)
                $result ~= $consonant-transliteration;
                $i += 1;
            } else {
                # Regular consonant with inherent 'a'
                $result ~= $consonant-transliteration ~ 'a';
                $i += 1;
            }
        } elsif self!is-vowel-sign($char) {
            # Standalone vowel sign (matra) - shouldn't happen in proper text
            my $vowel-transliteration = %mappings{$char-key} // '';
            $result ~= $vowel-transliteration;
            $i += 1;
        } elsif $ord == 0x094D {
            # Standalone virama - suppress inherent vowel of previous consonant
            # This is handled in consonant processing, so skip
            $i += 1;
        } elsif $ord == 0x093C {
            # Nukta - modifies previous consonant, skip
            $i += 1;
        } elsif self!is-zero-width-joiner($ord) {
            # Zero-width joiners and non-joiners, skip
            $i += 1;
        } else {
            # Vowel, number, punctuation, or other character
            my $transliteration = %mappings{$char-key} // $char;
            $result ~= $transliteration;
            $i += 1;
        }
    }
    
    return $result;
}

method !is-conjunct-form-by-ords(Int $ord, Int $next-ord --> Bool) {
    # Detect if this appears to be a conjunct form using ordinal values
    return False unless self!is-consonant($ord.chr);
    
    # If followed by another consonant, this might be a conjunct
    if self!is-consonant($next-ord.chr) {
        # Common conjunct patterns: क्ष, ज्ञ, त्र, स्व, etc.
        return self!is-common-conjunct-by-ords($ord, $next-ord);
    }
    
    # If followed by punctuation or non-Devanagari, might be conjunct
    if $next-ord < 0x0900 || $next-ord > 0x097F {
        return self!likely-word-final-conjunct($ord.chr);
    }
    
    return False;
}

method !is-conjunct-form(Str $char, Str $next-char --> Bool) {
    # Detect if this appears to be a conjunct form (consonant without inherent vowel)
    # This is heuristic-based for common patterns
    
    my $ord = $char.ord;
    my $next-ord = $next-char ?? $next-char.ord !! 0;
    
    # Common conjunct patterns in modern Devanagari text:
    # 1. Word-final consonants often don't have inherent vowel
    # 2. Before certain punctuation or spaces
    # 3. Specific visual patterns that indicate conjuncts
    
    return False unless self!is-consonant($char);
    
    # Check if next character suggests this is a conjunct
    if $next-char eq '' {
        # Word-final position - could be conjunct, but usually has inherent vowel
        return False;
    }
    
    # If followed by another consonant, this might be a conjunct
    if self!is-consonant($next-char) {
        # Common conjunct patterns: क्ष, ज्ञ, त्र, स्व, etc.
        return self!is-common-conjunct($char, $next-char);
    }
    
    # If followed by punctuation or non-Devanagari, might be conjunct
    if $next-ord < 0x0900 || $next-ord > 0x097F {
        return self!likely-word-final-conjunct($char);
    }
    
    return False;
}

method !is-common-conjunct-by-ords(Int $ord1, Int $ord2 --> Bool) {
    # Common Sanskrit conjunct patterns
    # These occur frequently and the first consonant typically doesn't take inherent vowel
    # BUT ONLY when there's a virama between them!
    # This method should only be called when we know there's a virama
    
    given $ord1 {
        when 0x0915 { # क (ka)
            return $ord2 == 0x0937 || # ष → क्ष (kṣa)
                   $ord2 == 0x0924 || # त → क्त (kta)
                   # Note: Removed क्र as it's causing issues
                   $ord2 == 0x0932 || # ल → क्ल (kla)
                   $ord2 == 0x0935;   # व → क्व (kva)
        }
        when 0x091C { # ज (ja)
            return $ord2 == 0x091E;   # ञ → ज्ञ (jña)
        }
        when 0x0924 { # त (ta)
            return $ord2 == 0x0930 || # र → त्र (tra)
                   $ord2 == 0x0935 || # व → त्व (tva)
                   $ord2 == 0x092F;   # य → त्य (tya)
        }
        when 0x0926 { # द (da)
            return $ord2 == 0x0930 || # र → द्र (dra)
                   $ord2 == 0x0935 || # व → द्व (dva)
                   $ord2 == 0x092F;   # य → द्य (dya)
        }
        when 0x092A { # प (pa)
            return $ord2 == 0x0930 || # र → प्र (pra)
                   $ord2 == 0x0932;   # ल → प्ल (pla)
        }
        when 0x0936 { # श (śa)
            return $ord2 == 0x0930 || # र → श्र (śra)
                   $ord2 == 0x0935;   # व → श्व (śva)
        }
        when 0x0938 { # स (sa)
            return $ord2 == 0x0935 || # व → स्व (sva)
                   $ord2 == 0x0924 || # त → स्त (sta)
                   $ord2 == 0x0928;   # न → स्न (sna)
        }
    }
    
    return False;
}

method !is-common-conjunct(Str $char1, Str $char2 --> Bool) {
    # For now, return False since we can't detect these reliably in precomposed input
    # This would need a more sophisticated approach or different input encoding
    return False;
}

method !likely-word-final-conjunct(Str $char --> Bool) {
    # Some consonants are commonly conjuncts at word end in Sanskrit
    my $ord = $char.ord;
    
    # Common word-final consonants that often appear without inherent vowel
    given $ord {
        when 0x0924 { return True; }  # त (t) - common in words like सत् (sat)
        when 0x0928 { return True; }  # न (n) - common in words like आसन् (āsan)
        when 0x092E { return True; }  # म (m) - common in accusative endings
        when 0x0930 { return True; }  # र (r) - common in agent nouns
        when 0x0932 { return True; }  # ल (l) - less common but occurs
        default { return False; }
    }
}

method !is-consonant(Str $char --> Bool) {
    # Check if character is a Devanagari consonant
    my $ord = $char.ord;
    return (0x0915 <= $ord <= 0x0939) ||  # Main consonants
           (0x0958 <= $ord <= 0x095F) ||  # Additional consonants
           ($ord == 0x0979) ||            # ZHA
           ($ord == 0x097A);              # Heavy YA
    # Note: Nukta (0x093C) and Avagraha (0x093D) are NOT consonants
}

method !is-vowel-sign(Str $char --> Bool) {
    # Check if character is a Devanagari vowel sign (matra)
    return False if $char eq '';
    my $ord = $char.ord;
    return (0x093E <= $ord <= 0x094C) ||  # Vowel signs
           (0x094E <= $ord <= 0x094F) ||  # Additional vowel signs
           (0x0955 <= $ord <= 0x0957) ||  # Vedic vowel signs
           (0x0962 <= $ord <= 0x0963);    # Vocalic L signs
}

method !is-zero-width-joiner(Int $ord --> Bool) {
    # Check for zero-width joiners and non-joiners
    return $ord == 0x200C ||  # Zero Width Non-Joiner
           $ord == 0x200D;    # Zero Width Joiner
}

method !get-nukta-transliteration(Int $base-ord --> Str) {
    # Return transliteration for consonant + nukta combinations
    given $base-ord {
        when 0x0915 { return 'q'; }   # क़ → q
        when 0x0916 { return 'x'; }   # ख़ → x (kh with dot)
        when 0x0917 { return 'ġ'; }   # ग़ → ġ
        when 0x091C { return 'z'; }   # ज़ → z
        when 0x0921 { return 'ṛ'; }   # ड़ → ṛ
        when 0x0922 { return 'ṛh'; }  # ढ़ → ṛh
        when 0x092B { return 'f'; }   # फ़ → f
        when 0x092F { return 'ẏ'; }   # य़ → ẏ
        default { return Str; }
    }
}

method get-reverse-mappings(--> List) {
    # Build reverse mappings from the forward mappings
    my %mappings = self.get-mappings();
    my @reverse-mappings;
    
    # First add complex mappings (longer strings first to match properly)
    @reverse-mappings.push('kṣa' => 'क्ष');
    @reverse-mappings.push('jña' => 'ज्ञ');
    @reverse-mappings.push('kṣ' => 'क्ष्');
    @reverse-mappings.push('jñ' => 'ज्ञ्');
    
    # Common Sanskrit words that might be confused with English
    @reverse-mappings.push('api' => 'अपि');  # also, even
    
    # Three-character combinations (must come first)
    @reverse-mappings.push('kai' => 'कै');
    @reverse-mappings.push('kau' => 'कौ');
    @reverse-mappings.push('gai' => 'गै');
    @reverse-mappings.push('gau' => 'गौ');
    @reverse-mappings.push('cai' => 'चै');
    @reverse-mappings.push('cau' => 'चौ');
    @reverse-mappings.push('jai' => 'जै');
    @reverse-mappings.push('jau' => 'जौ');
    @reverse-mappings.push('ṭai' => 'टै');
    @reverse-mappings.push('ṭau' => 'टौ');
    @reverse-mappings.push('ḍai' => 'डै');
    @reverse-mappings.push('ḍau' => 'डौ');
    @reverse-mappings.push('tai' => 'तै');
    @reverse-mappings.push('tau' => 'तौ');
    @reverse-mappings.push('dai' => 'दै');
    @reverse-mappings.push('dau' => 'दौ');
    @reverse-mappings.push('nai' => 'नै');
    @reverse-mappings.push('nau' => 'नौ');
    @reverse-mappings.push('pai' => 'पै');
    @reverse-mappings.push('pau' => 'पौ');
    @reverse-mappings.push('bai' => 'बै');
    @reverse-mappings.push('bau' => 'बौ');
    @reverse-mappings.push('mai' => 'मै');
    @reverse-mappings.push('mau' => 'मौ');
    @reverse-mappings.push('yai' => 'यै');
    @reverse-mappings.push('yau' => 'यौ');
    @reverse-mappings.push('rai' => 'रै');
    @reverse-mappings.push('rau' => 'रौ');
    @reverse-mappings.push('lai' => 'लै');
    @reverse-mappings.push('lau' => 'लौ');
    @reverse-mappings.push('vai' => 'वै');
    @reverse-mappings.push('vau' => 'वौ');
    @reverse-mappings.push('śai' => 'शै');
    @reverse-mappings.push('śau' => 'शौ');
    @reverse-mappings.push('ṣai' => 'षै');
    @reverse-mappings.push('ṣau' => 'षौ');
    @reverse-mappings.push('sai' => 'सै');
    @reverse-mappings.push('sau' => 'सौ');
    @reverse-mappings.push('hai' => 'है');
    @reverse-mappings.push('hau' => 'हौ');
    
    # Consonants with inherent vowel (must come before plain consonants)
    # Two-letter consonants must come before single-letter ones
    @reverse-mappings.push('kha' => 'ख');
    @reverse-mappings.push('gha' => 'घ');
    @reverse-mappings.push('cha' => 'छ');
    @reverse-mappings.push('jha' => 'झ');
    @reverse-mappings.push('ṭha' => 'ठ');
    @reverse-mappings.push('ḍha' => 'ढ');
    @reverse-mappings.push('tha' => 'थ');
    @reverse-mappings.push('dha' => 'ध');
    @reverse-mappings.push('pha' => 'फ');
    @reverse-mappings.push('bha' => 'भ');
    @reverse-mappings.push('śra' => 'श्र');  # Common conjunct
    @reverse-mappings.push('tra' => 'त्र');  # Common conjunct
    @reverse-mappings.push('dva' => 'द्व');  # Common conjunct
    @reverse-mappings.push('sva' => 'स्व');  # Common conjunct
    
    # Basic consonants with 'a'
    @reverse-mappings.push('ṅa' => 'ङ');
    @reverse-mappings.push('ña' => 'ञ');
    @reverse-mappings.push('ṇa' => 'ण');
    @reverse-mappings.push('śa' => 'श');
    @reverse-mappings.push('ṣa' => 'ष');
    @reverse-mappings.push('ḻa' => 'ळ');
    @reverse-mappings.push('ka' => 'क');
    @reverse-mappings.push('ga' => 'ग');
    @reverse-mappings.push('ca' => 'च');
    @reverse-mappings.push('ja' => 'ज');
    @reverse-mappings.push('ṭa' => 'ट');
    @reverse-mappings.push('ḍa' => 'ड');
    @reverse-mappings.push('ta' => 'त');
    @reverse-mappings.push('da' => 'द');
    @reverse-mappings.push('na' => 'न');
    @reverse-mappings.push('pa' => 'प');
    @reverse-mappings.push('ba' => 'ब');
    @reverse-mappings.push('ma' => 'म');
    @reverse-mappings.push('ya' => 'य');
    @reverse-mappings.push('ra' => 'र');
    @reverse-mappings.push('la' => 'ल');
    @reverse-mappings.push('va' => 'व');
    @reverse-mappings.push('sa' => 'स');
    @reverse-mappings.push('ha' => 'ह');
    
    # Plain consonants (without vowel) - for when followed by other vowels
    @reverse-mappings.push('kh' => 'ख्');
    @reverse-mappings.push('gh' => 'घ्');
    @reverse-mappings.push('ch' => 'छ्');
    @reverse-mappings.push('jh' => 'झ्');
    @reverse-mappings.push('ṭh' => 'ठ्');
    @reverse-mappings.push('ḍh' => 'ढ्');
    @reverse-mappings.push('th' => 'थ्');
    @reverse-mappings.push('dh' => 'ध्');
    @reverse-mappings.push('ph' => 'फ्');
    @reverse-mappings.push('bh' => 'भ्');
    @reverse-mappings.push('ṅ' => 'ङ्');
    @reverse-mappings.push('ñ' => 'ञ्');
    @reverse-mappings.push('ṇ' => 'ण्');
    @reverse-mappings.push('ś' => 'श्');
    @reverse-mappings.push('ṣ' => 'ष्');
    @reverse-mappings.push('k' => 'क्');
    @reverse-mappings.push('g' => 'ग्');
    @reverse-mappings.push('c' => 'च्');
    @reverse-mappings.push('j' => 'ज्');
    @reverse-mappings.push('ṭ' => 'ट्');
    @reverse-mappings.push('ḍ' => 'ड्');
    @reverse-mappings.push('t' => 'त्');
    @reverse-mappings.push('d' => 'द्');
    @reverse-mappings.push('n' => 'न्');
    @reverse-mappings.push('p' => 'प्');
    @reverse-mappings.push('b' => 'ब्');
    @reverse-mappings.push('m' => 'म्');
    @reverse-mappings.push('y' => 'य्');
    @reverse-mappings.push('r' => 'र्');
    @reverse-mappings.push('l' => 'ल्');
    @reverse-mappings.push('v' => 'व्');
    @reverse-mappings.push('s' => 'स्');
    @reverse-mappings.push('h' => 'ह्');
    
    # Special single characters that need 'a'
    @reverse-mappings.push('ḻa' => 'ळ');
    
    # Nukta consonants
    @reverse-mappings.push('qa' => 'क़');
    @reverse-mappings.push('xa' => 'ख़');
    @reverse-mappings.push('ġa' => 'ग़');
    @reverse-mappings.push('za' => 'ज़');
    @reverse-mappings.push('fa' => 'फ़');
    @reverse-mappings.push('q' => 'क़्');
    @reverse-mappings.push('x' => 'ख़्');
    @reverse-mappings.push('ġ' => 'ग़्');
    @reverse-mappings.push('z' => 'ज़्');
    @reverse-mappings.push('f' => 'फ़्');
    
    # Two-character vowels (must come before single 'a')
    @reverse-mappings.push('ai' => 'ऐ');
    @reverse-mappings.push('au' => 'औ');
    
    # Long vowels (must come before short vowels)
    @reverse-mappings.push('ā' => 'आ');
    @reverse-mappings.push('ī' => 'ई');
    @reverse-mappings.push('ū' => 'ऊ');
    @reverse-mappings.push('ṝ' => 'ॠ');
    @reverse-mappings.push('ḹ' => 'ॡ');
    
    # Short vowels
    @reverse-mappings.push('a' => 'अ');
    @reverse-mappings.push('i' => 'इ');
    @reverse-mappings.push('u' => 'उ');
    @reverse-mappings.push('ṛ' => 'ऋ');
    @reverse-mappings.push('ḷ' => 'ऌ');
    @reverse-mappings.push('e' => 'ए');
    @reverse-mappings.push('o' => 'ओ');
    
    # Special consonant (without inherent vowel)
    @reverse-mappings.push('ḻ' => 'ळ');
    
    # Special characters
    @reverse-mappings.push('ṁ' => "\c[DEVANAGARI SIGN ANUSVARA]");
    @reverse-mappings.push('ḥ' => "\c[DEVANAGARI SIGN VISARGA]");
    @reverse-mappings.push('m̐' => "\c[DEVANAGARI SIGN CANDRABINDU]");
    @reverse-mappings.push("'" => "\c[DEVANAGARI SIGN AVAGRAHA]");
    @reverse-mappings.push('oṁ' => "\c[DEVANAGARI OM]");
    
    # Numbers (if enabled)
    for 0..9 -> $num {
        @reverse-mappings.push($num.Str => $num.Str);  # Keep numbers as-is
    }
    
    # Punctuation
    @reverse-mappings.push('।' => '।');
    @reverse-mappings.push('॥' => '॥');
    
    return @reverse-mappings;
}

# Reverse transliteration: IAST Latin to Devanagari
method transliterate-reverse(Str $text --> Str) {
    # Pre-process to handle alternative inputs
    my $normalized = self!normalize-alternative-inputs($text);
    
    # Split into words to handle mixed languages better
    my @segments = $normalized.split(/(<[\s\p{P}]>+)/, :v);
    my $result = '';
    
    for @segments -> $segment {
        if $segment ~~ /^<[\s\p{P}]>+$/ {
            # Preserve whitespace and punctuation
            $result ~= $segment;
        } elsif self!should-skip-transliteration($segment) {
            # Skip English words
            $result ~= $segment;
        } else {
            # Transliterate this segment
            $result ~= self!transliterate-segment($segment);
        }
    }
    
    return $result;
}

method !normalize-alternative-inputs(Str $text --> Str) {
    my $result = $text;
    
    # Handle common alternative transliterations
    $result ~~ s:g/ṃ/ṁ/;    # Alternative anusvara
    $result ~~ s:g/ksh/kṣ/;  # Alternative for kṣ
    $result ~~ s:g/gn/jñ/;   # Alternative for jñ
    
    # Handle doubled consonants (must be done before single consonants)
    $result ~~ s:g/chh/ch/;  # chh → ch
    $result ~~ s:g/śh/ś/;    # śh → ś  
    $result ~~ s:g/shh/ṣ/;   # shh → ṣ (alternative)
    
    return $result;
}

method !should-skip-transliteration(Str $word --> Bool) {
    # Skip if word looks like English
    
    # Check if capitalized English word (no diacritics)
    if $word ~~ /^<[A..Z]><[a..z]>+$/ && $word !~~ /<[āīūṛṝḷḹṁḥṅñṭḍṇśṣ]>/ {
        return True;
    }
    
    # Check if all uppercase without diacritics (likely English acronym)
    if $word ~~ /^<[A..Z]>+$/ && $word.chars > 1 && $word !~~ /<[ĀĪŪṚṜḶḸṀḤṄÑṬḌṆŚṢ]>/ {
        return True;
    }
    
    # Check common English words
    my @english-words = <the of and or but in on at to for with from by
                        about into through during before after
                        email web site page class chapter book section part
                        com org net edu gov www http https
                        app software program>;
    
    if $word.lc ∈ @english-words {
        return True;
    }
    
    # Check for English patterns (no diacritics)
    if $word !~~ /<[āīūṛṝḷḹṁḥṅñṭḍṇśṣ]>/ && $word ~~ /^<[a..z]>+$/ {
        # Common English suffixes
        if $word ~~ /(ing|ed|er|est|ly|tion|ment|ness|ful|less)$/ {
            return True;
        }
        # Common English prefixes
        if $word ~~ /^(un|re|pre|post|non|anti|de|dis|over|under|out)/ && $word.chars > 4 {
            return True;
        }
    }
    
    return False;
}

method !transliterate-segment(Str $text --> Str) {
    # Handle all-caps Sanskrit (like KṚṢṆA)
    my $working-text = $text;
    my $was-all-caps = False;
    if $text ~~ /^<[A..Z]>+$/ && $text ~~ /<[ĀĪŪṚṜḶḸṀḤṄÑṬḌṆŚṢ]>/ {
        $working-text = $text.lc;
        $was-all-caps = True;
    }
    
    # Handle capitalized Sanskrit (like Śānti)
    my $was-capitalized = False;
    if $text ~~ /^<:Lu>/ && $text ~~ /<[āīūṛṝḷḹṁḥṅñṭḍṇśṣĀĪŪṚṜḶḸṀḤṄÑṬḌṆŚṢ]>/ {
        $working-text = $text.lc;
        $was-capitalized = True;
    }
    
    my $result = '';
    my $i = 0;
    my @chars = $working-text.comb;
    
    # Build a sorted list of mappings by length (longest first)
    my @sorted-mappings = self.get-reverse-mappings().sort({ $^b.key.chars <=> $^a.key.chars });
    
    while $i < @chars.elems {
        my $matched = False;
        my $remaining = @chars[$i..*].join;
        
        # Try to match longest possible sequence first
        for @sorted-mappings -> $pair {
            if $remaining.starts-with($pair.key) {
                $result ~= $pair.value;
                $i += $pair.key.chars;
                $matched = True;
                last;
            }
        }
        
        # If no match found, copy the character as-is
        unless $matched {
            $result ~= @chars[$i];
            $i += 1;
        }
    }
    
    # Post-process to clean up any remaining issues
    $result = self!post-process-reverse($result);
    
    return $result;
}

method !convert-vowel-sequences(Str $text --> Str) {
    my $result = '';
    my @graphemes = $text.comb;
    my $i = 0;
    
    while $i < @graphemes.elems {
        my $current = @graphemes[$i];
        my @current-ords = $current.ords;
        
        # Check if this is a consonant with virama
        if @current-ords.elems == 2 && @current-ords[1] == 0x094D {
            # This is consonant + virama
            my $consonant = @current-ords[0].chr;
            
            # Check next character
            if $i + 1 < @graphemes.elems {
                my $next = @graphemes[$i + 1];
                
                # If next is a standalone vowel, convert to matra
                if self!is-standalone-vowel($next) {
                    my $matra = self!vowel-to-matra($next);
                    if $matra {
                        $result ~= $consonant ~ $matra;
                        $i += 2;  # Skip both current and next
                        next;
                    }
                }
            }
        }
        
        # Default: just add the current grapheme
        $result ~= $current;
        $i += 1;
    }
    
    return $result;
}

method !vowel-to-matra(Str $vowel --> Str) {
    # Convert standalone vowel to vowel sign (matra)
    given $vowel.ord {
        when 0x0906 { return 0x093E.chr; }  # आ → ा
        when 0x0907 { return 0x093F.chr; }  # इ → ि
        when 0x0908 { return 0x0940.chr; }  # ई → ी
        when 0x0909 { return 0x0941.chr; }  # उ → ु
        when 0x090A { return 0x0942.chr; }  # ऊ → ू
        when 0x090B { return 0x0943.chr; }  # ऋ → ृ
        when 0x0960 { return 0x0944.chr; }  # ॠ → ॄ
        when 0x090C { return 0x0962.chr; }  # ऌ → ॢ
        when 0x0961 { return 0x0963.chr; }  # ॡ → ॣ
        when 0x090F { return 0x0947.chr; }  # ए → े
        when 0x0910 { return 0x0948.chr; }  # ऐ → ै
        when 0x0913 { return 0x094B.chr; }  # ओ → ो
        when 0x0914 { return 0x094C.chr; }  # औ → ौ
        default { return ''; }
    }
}

method !is-standalone-vowel(Str $char --> Bool) {
    # Check if character is a standalone vowel letter
    return False if $char eq '';
    my $ord = $char.ord;
    return (0x0905 <= $ord <= 0x0914) ||  # अ to औ
           (0x0960 == $ord) ||             # ॠ
           (0x0961 == $ord);               # ॡ
}

method !is-consonant-vowel-combo(Str $latin, Str $devanagari, Str $remaining, Int $pos, @chars --> Bool) {
    # Check if this is a consonant that might be followed by a vowel
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    return False unless $devanagari ~~ /(<:devanagari>&<:consonant>)($virama)?$/;
    
    # Check if the Latin ends with 'a' and next char could be a vowel
    return False unless $latin ~~ /a$/;
    
    # Look ahead to see if there's a vowel following
    my $next-pos = $pos + $latin.chars;
    return False if $next-pos >= @chars.elems;
    
    my $next-char = @chars[$next-pos];
    return $next-char ~~ /^<[āīūṛṝḷḹeo]>/;
}

method !process-consonant-vowel(Str $latin, Str $devanagari, Str $remaining --> Hash) {
    my %result;
    
    # Extract the consonant (without virama)
    my $consonant = $devanagari;
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    $consonant ~~ s/$virama$//;
    
    # Look for following vowel
    my $after-consonant = $remaining.substr($latin.chars);
    
    # Map of vowel combinations
    my %vowel-map = (
        'ā' => "\c[DEVANAGARI VOWEL SIGN AA]",
        'i' => "\c[DEVANAGARI VOWEL SIGN I]",
        'ī' => "\c[DEVANAGARI VOWEL SIGN II]",
        'u' => "\c[DEVANAGARI VOWEL SIGN U]",
        'ū' => "\c[DEVANAGARI VOWEL SIGN UU]",
        'ṛ' => "\c[DEVANAGARI VOWEL SIGN VOCALIC R]",
        'ṝ' => "\c[DEVANAGARI VOWEL SIGN VOCALIC RR]",
        'ḷ' => "\c[DEVANAGARI VOWEL SIGN VOCALIC L]",
        'ḹ' => "\c[DEVANAGARI VOWEL SIGN VOCALIC LL]",
        'e' => "\c[DEVANAGARI VOWEL SIGN E]",
        'ai' => "\c[DEVANAGARI VOWEL SIGN AI]",
        'o' => "\c[DEVANAGARI VOWEL SIGN O]",
        'au' => "\c[DEVANAGARI VOWEL SIGN AU]",
    );
    
    # Check for vowel signs
    for %vowel-map.kv -> $vowel, $matra {
        if $after-consonant.starts-with($vowel) {
            %result<result> = $consonant ~ $matra;
            %result<consumed> = $latin.chars + $vowel.chars;
            return %result;
        }
    }
    
    # Default: just the consonant with inherent 'a'
    %result<result> = $consonant;
    %result<consumed> = $latin.chars;
    return %result;
}

method !post-process-reverse(Str $text --> Str) {
    my $result = $text;
    
    # Fix common issues
    # Remove redundant viramas
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    $result ~~ s:g/($virama)$virama+/$0/;
    
    # Fix standalone vowels that should be matras
    $result = self!fix-standalone-vowels($result);
    
    # Handle special conjuncts
    $result = self!fix-conjuncts($result);
    
    # Convert consonant + virama + vowel letter to consonant + vowel sign
    $result = self!convert-vowel-sequences($result);
    
    return $result;
}

method !fix-standalone-vowels(Str $text --> Str) {
    my $result = $text;
    
    # Fix patterns like consonant + virama + vowel letter → consonant + vowel sign
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    
    # Map of vowel letters to vowel signs
    my %vowel-to-sign;
    %vowel-to-sign{"\c[DEVANAGARI LETTER AA]"} = "\c[DEVANAGARI VOWEL SIGN AA]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER I]"} = "\c[DEVANAGARI VOWEL SIGN I]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER II]"} = "\c[DEVANAGARI VOWEL SIGN II]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER U]"} = "\c[DEVANAGARI VOWEL SIGN U]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER UU]"} = "\c[DEVANAGARI VOWEL SIGN UU]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER VOCALIC R]"} = "\c[DEVANAGARI VOWEL SIGN VOCALIC R]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER VOCALIC RR]"} = "\c[DEVANAGARI VOWEL SIGN VOCALIC RR]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER VOCALIC L]"} = "\c[DEVANAGARI VOWEL SIGN VOCALIC L]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER VOCALIC LL]"} = "\c[DEVANAGARI VOWEL SIGN VOCALIC LL]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER E]"} = "\c[DEVANAGARI VOWEL SIGN E]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER AI]"} = "\c[DEVANAGARI VOWEL SIGN AI]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER O]"} = "\c[DEVANAGARI VOWEL SIGN O]";
    %vowel-to-sign{"\c[DEVANAGARI LETTER AU]"} = "\c[DEVANAGARI VOWEL SIGN AU]";
    
    for %vowel-to-sign.kv -> $vowel, $sign {
        $result ~~ s:g/(<:devanagari>&<:consonant>)$virama$vowel/$0$sign/;
    }
    
    return $result;
}

method !fix-conjuncts(Str $text --> Str) {
    my $result = $text;
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    
    # Fix specific conjunct patterns
    $result ~~ s:g/'क' $virama 'ष'/'क्ष'/;
    $result ~~ s:g/'ज' $virama 'ञ'/'ज्ञ'/;
    $result ~~ s:g/'त' $virama 'र'/'त्र'/;
    $result ~~ s:g/'श' $virama 'र'/'श्र'/;
    
    return $result;
}

# Case-preserving transliteration
method transliterate-preserve-case(Str $text --> Str) {
    my %mappings = self.get-mappings();
    my $result = '';
    
    # Split into segments preserving case markers
    my @segments = $text.split(/(<[A..Z]><[a..z]>*)/, :v);
    
    for @segments -> $segment {
        if $segment ~~ /^<[A..Z]>/ {
            # Capitalized word - transliterate and capitalize first letter
            my $trans = self.transliterate-context-aware($segment.lc);
            if $trans.chars > 0 {
                $result ~= $trans.substr(0,1).uc ~ $trans.substr(1);
            }
        } else {
            # Regular segment
            $result ~= self.transliterate-context-aware($segment);
        }
    }
    
    return $result;
}

# Batch processing methods
method transliterate-lines(Str $text --> Str) {
    return $text.lines.map({ self.transliterate-context-aware($_) }).join("\n");
}

method transliterate-words(Str $text --> Str) {
    return $text.words.map({ self.transliterate-context-aware($_) }).join(" ");
}

# Validation methods
method is-valid-iast(Str $text --> Bool) {
    # Check if text contains only valid IAST characters
    my $valid-chars = rx/<[a..z A..Z 0..9 \s . , ! ? ; : ' " \- ( )]>|ā|ī|ū|ṛ|ṝ|ḷ|ḹ|ṁ|ḥ|ṅ|ñ|ṭ|ḍ|ṇ|ś|ṣ|ḻ/;
    my $danda = '।';
    my $double-danda = '॥';
    return so $text ~~ /^[$valid-chars|$danda|$double-danda]*$/;
}

method is-valid-devanagari(Str $text --> Bool) {
    # Check if text contains valid Devanagari
    my $danda = '।';
    my $double-danda = '॥';
    return so $text ~~ /^[<:devanagari>|\s|<[0..9]>|$danda|$double-danda]*$/;
}

method validate-mappings(--> Bool) {
    # Self-test to ensure all mappings are reversible
    my %forward = self.get-mappings();
    my @reverse = self.get-reverse-mappings();
    
    # Test a sample of mappings - testing consonants with inherent 'a'
    my @test-pairs = (
        'क' => 'ka',
        'ख' => 'kha', 
        'ग' => 'ga',
        'घ' => 'gha',
        'च' => 'ca',
        'ज' => 'ja',
        'ट' => 'ṭa',
        'त' => 'ta',
        'द' => 'da',
        'न' => 'na',
        'प' => 'pa',
        'ब' => 'ba',
        'म' => 'ma',
        'य' => 'ya',
        'र' => 'ra',
        'ल' => 'la',
        'व' => 'va',
        'श' => 'śa',
        'ष' => 'ṣa',
        'स' => 'sa',
        'ह' => 'ha',
    );
    
    for @test-pairs -> $pair {
        my $devanagari = $pair.key;
        my $expected-latin = $pair.value;
        
        # Test forward transliteration
        my $latin = self.transliterate-context-aware($devanagari);
        return False unless $latin eq $expected-latin;
        
        # Test reverse transliteration
        my $back = self.transliterate-reverse($latin);
        return False unless $back eq $devanagari;
    }
    
    return True;
}

# Performance optimization: Precompiled regex patterns
my $consonant-pattern = rx/<:devanagari>&<:consonant>/;
my $vowel-pattern = rx/<:devanagari>&<:vowel>/;
my $vowel-sign-pattern = rx/<:devanagari>&<:vowel_sign>/;

# Enhanced reverse transliteration with better conjunct handling
method transliterate-reverse-enhanced(Str $text --> Str) {
    # Just use the improved reverse transliteration method
    return self.transliterate-reverse($text);
}

method !fix-conjunct-spacing(Str $text --> Str) {
    my $result = $text;
    
    # Remove extra viramas between consonants in known conjuncts
    my $virama = "\c[DEVANAGARI SIGN VIRAMA]";
    
    # Common patterns that should not have virama
    $result = $result.subst(/क्$virama ष/, 'क्ष', :g);
    $result = $result.subst(/ज्$virama ञ/, 'ज्ञ', :g);
    
    return $result;
}

# Debug methods
method debug-is-consonant(Str $char --> Bool) {
    return self!is-consonant($char);
}

method debug-is-vowel-sign(Str $char --> Bool) {
    return self!is-vowel-sign($char);
}

# Get statistics about the text
method get-text-stats(Str $text --> Hash) {
    my %stats;
    my @chars = $text.comb;
    
    %stats<total-chars> = @chars.elems;
    %stats<devanagari-chars> = @chars.grep(/<:devanagari>/).elems;
    %stats<latin-chars> = @chars.grep(/<[a..z A..Z]>/).elems;
    %stats<numbers> = @chars.grep(/<[0..9]>|<:devanagari>&<:number>/).elems;
    %stats<punctuation> = @chars.grep({ $_ eq '।' || $_ eq '॥' }).elems;
    
    return %stats;
}