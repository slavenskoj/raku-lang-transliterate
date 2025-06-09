use Lang::Transliterate;

unit class Lang::Transliterate::He::CommonIsraeli does Lang::Transliterate::Transliterator;

# Common Israeli Transliteration for Hebrew
# Based on the Wikipedia comparison table
my %base-mappings = (
    # Hebrew to Latin - Common Israeli system
    # Consonants
    "\c[0x05D0]" => "'",     # א alef - omitted at word initial
    "\c[0x05D1]" => 'v',      # ב vet
    "\c[0x05D1]\c[0x05BC]" => 'b',  # בּ bet
    "\c[0x05D2]" => 'g',      # ג gimel
    "\c[0x05D2]\c[0x05BC]" => 'g',  # גּ gimel with dagesh
    "\c[0x05D2]\c[0x05F3]" => 'j',  # ג׳ jimel (loanword)
    "\c[0x05D3]" => 'd',      # ד dalet
    "\c[0x05D3]\c[0x05BC]" => 'd',  # דּ dalet with dagesh
    "\c[0x05D3]\c[0x05F3]" => 'dh', # ד׳ dhalet (foreign)
    "\c[0x05D4]" => 'h',      # ה hei
    "\c[0x05D4]\c[0x05BC]" => 'h',  # הּ hei with dagesh
    "\c[0x05D5]" => 'v',      # ו vav (could be w in loanwords)
    "\c[0x05D5]\c[0x05BC]" => 'v',  # וּ vav with dagesh (not shuruk)
    "\c[0x05D6]" => 'z',      # ז zayin
    "\c[0x05D6]\c[0x05BC]" => 'z',  # זּ zayin with dagesh
    "\c[0x05D6]\c[0x05F3]" => 'zh', # ז׳ zhayin (loanword)
    "\c[0x05D7]" => 'ch',     # ח chet (also kh, h)
    "\c[0x05D8]" => 't',      # ט tet
    "\c[0x05D8]\c[0x05BC]" => 't',  # טּ tet with dagesh
    "\c[0x05D9]" => 'y',      # י yud
    "\c[0x05D9]\c[0x05BC]" => 'y',  # יּ yud with dagesh
    "\c[0x05DA]" => 'ch',     # ך chaf sofit
    "\c[0x05DB]" => 'ch',     # כ chaf
    "\c[0x05DA]\c[0x05BC]" => 'k',  # ךּ kaf sofit with dagesh
    "\c[0x05DB]\c[0x05BC]" => 'k',  # כּ kaf
    "\c[0x05DC]" => 'l',      # ל lamed
    "\c[0x05DC]\c[0x05BC]" => 'l',  # לּ lamed with dagesh
    "\c[0x05DD]" => 'm',      # ם mem sofit
    "\c[0x05DE]" => 'm',      # מ mem
    "\c[0x05DE]\c[0x05BC]" => 'm',  # מּ mem with dagesh
    "\c[0x05DF]" => 'n',      # ן nun sofit
    "\c[0x05E0]" => 'n',      # נ nun
    "\c[0x05E0]\c[0x05BC]" => 'n',  # נּ nun with dagesh
    "\c[0x05E1]" => 's',      # ס samech
    "\c[0x05E1]\c[0x05BC]" => 's',  # סּ samech with dagesh
    "\c[0x05E2]" => "'",      # ע ayin - sometimes omitted
    "\c[0x05E3]" => 'f',      # ף fei sofit
    "\c[0x05E4]" => 'f',      # פ fei
    "\c[0x05E3]\c[0x05BC]" => 'p',  # ףּ pei sofit with dagesh (rare)
    "\c[0x05E4]\c[0x05BC]" => 'p',  # פּ pei
    "\c[0x05E5]" => 'tz',     # ץ tzadi sofit (also ts)
    "\c[0x05E6]" => 'tz',     # צ tzadi (also ts)
    "\c[0x05E6]\c[0x05BC]" => 'tz', # צּ tzadi with dagesh
    "\c[0x05E5]\c[0x05F3]" => 'tsh',# ץ׳ tshadi sofit (loanword, also ch)
    "\c[0x05E6]\c[0x05F3]" => 'tsh',# צ׳ tshadi (loanword, also ch)
    "\c[0x05E7]" => 'k',      # ק kuf (also c)
    "\c[0x05E7]\c[0x05BC]" => 'k',  # קּ kuf with dagesh
    "\c[0x05E8]" => 'r',      # ר reish
    "\c[0x05E8]\c[0x05BC]" => 'r',  # רּ reish with dagesh (foreign)
    "\c[0x05E9]\c[0x05C1]" => 'sh', # שׁ shin
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => 'sh', # שּׁ shin with dagesh
    "\c[0x05E9]\c[0x05C2]" => 's',  # שׂ sin
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => 's',  # שּׂ sin with dagesh
    "\c[0x05EA]" => 't',      # ת tav
    "\c[0x05EA]\c[0x05BC]" => 't',  # תּ tav with dagesh
    "\c[0x05EA]\c[0x05F3]" => 'th', # ת׳ thav (foreign)
    
    # Arabic transliteration forms
    "\c[0x05D7]\c[0x05F3]" => 'ḫ',  # ח׳ ḫāʾ
    "\c[0x05D8]\c[0x05F3]" => 'ẓ',  # ט׳ ẓāʾ
    "\c[0x05E2]\c[0x05F3]" => 'ġ',  # ע׳ ġayn
    "\c[0x05E8]\c[0x05F3]" => 'ġ',  # ר׳ ġayn (alternate)
    "\c[0x05E6]\c[0x05F3]" => 'ḍ',  # צ׳ ḍād (when not tsh)
    
    # Basic vowels - note many are represented by diacritics on consonants
    # We'll handle the most common patterns
    "\c[0x05D0]\c[0x05B7]" => 'a',  # אַ alef with patach
    "\c[0x05D0]\c[0x05B8]" => 'a',  # אָ alef with kamatz
    "\c[0x05D0]\c[0x05B5]" => 'e',  # אֵ alef with tzere
    "\c[0x05D0]\c[0x05B6]" => 'e',  # אֶ alef with segol
    "\c[0x05D0]\c[0x05B4]" => 'i',  # אִ alef with chirik
    "\c[0x05D0]\c[0x05B9]" => 'o',  # אֹ alef with cholam
    "\c[0x05D0]\c[0x05BB]" => 'u',  # אֻ alef with kubutz
    "\c[0x05D0]\c[0x05D5]\c[0x05BC]" => 'u', # אוּ alef with shuruk
    
    # Common letter combinations
    "\c[0x05E9]" => 'sh',     # ש shin/sin without dots - defaults to sh
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Common Israeli reverse mappings
    # Note: This is lossy due to multiple Hebrew letters mapping to same Latin
    return (
        # Multi-character mappings first
        'ch' => "\c[0x05D7]",    # maps to ח (could also be כ)
        'kh' => "\c[0x05D7]",    # alternate for ח
        'sh' => "\c[0x05E9]\c[0x05C1]",  # שׁ
        'tz' => "\c[0x05E6]",    # צ
        'ts' => "\c[0x05E6]",    # alternate for צ
        'tsh' => "\c[0x05E6]\c[0x05F3]", # צ׳
        'zh' => "\c[0x05D6]\c[0x05F3]",  # ז׳
        'dh' => "\c[0x05D3]\c[0x05F3]",  # ד׳
        'th' => "\c[0x05EA]\c[0x05F3]",  # ת׳
        
        # Single character mappings
        'a' => "\c[0x05D0]",     # א (could be vowel)
        'b' => "\c[0x05D1]\c[0x05BC]",   # בּ
        'c' => "\c[0x05E7]",     # ק
        'd' => "\c[0x05D3]",     # ד
        'e' => '',               # usually vowel
        'f' => "\c[0x05E4]",     # פ
        'g' => "\c[0x05D2]",     # ג
        'h' => "\c[0x05D4]",     # ה
        'i' => "\c[0x05D9]",     # י
        'j' => "\c[0x05D2]\c[0x05F3]",   # ג׳
        'k' => "\c[0x05E7]",     # ק (could also be כּ)
        'l' => "\c[0x05DC]",     # ל
        'm' => "\c[0x05DE]",     # מ
        'n' => "\c[0x05E0]",     # נ
        'o' => "\c[0x05D5]",     # ו (as vowel)
        'p' => "\c[0x05E4]\c[0x05BC]",   # פּ
        'q' => "\c[0x05E7]",     # ק
        'r' => "\c[0x05E8]",     # ר
        's' => "\c[0x05E1]",     # ס (could also be שׂ)
        't' => "\c[0x05EA]",     # ת (could also be ט)
        'u' => "\c[0x05D5]",     # ו (as vowel)
        'v' => "\c[0x05D1]",     # ב (could also be ו)
        'w' => "\c[0x05D5]",     # ו
        'x' => "\c[0x05E7]\c[0x05E1]",   # קס
        'y' => "\c[0x05D9]",     # י
        'z' => "\c[0x05D6]",     # ז
        "'" => '',               # could be א or ע
    );
}

# Common Israeli often omits alef and ayin at word boundaries
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try longest possible matches first
        for (4, 3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                if %mappings{$substr}:exists {
                    my $mapped = %mappings{$substr};
                    
                    # Special handling for alef and ayin
                    if $substr eq "\c[0x05D0]" || $substr eq "\c[0x05E2]" {
                        # Omit at beginning of word
                        if $i == 0 || ($i > 0 && @chars[$i - 1] ~~ /\s/) {
                            # Skip this character
                            $found = True;
                            $i += $len;
                            last;
                        }
                        # Also often omitted between vowels
                    }
                    
                    # Special handling for final hei  
                    if $substr eq "\c[0x05D4]" {
                        # Often omitted at end of words
                        if $i + $len == @chars.elems || ($i + $len < @chars.elems && @chars[$i + $len] ~~ /\s/) {
                            # Skip this character
                            $found = True;
                            $i += $len;
                            last;
                        }
                    }
                    
                    # Check if this is an uppercase character with multi-char mapping
                    if $len == 1 && $substr ~~ /<:Lu>/ && $mapped.chars > 1 {
                        # Check if we're in an all-caps context
                        my $apply-full-upper = False;
                        if $i > 0 && $i + $len < @chars.elems {
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/ && @chars[$i + $len] ~~ /<:Lu>/;
                        } elsif $i == 0 && $i + $len < @chars.elems {
                            $apply-full-upper = @chars[$i + $len] ~~ /<:Lu>/;
                        } elsif $i + $len == @chars.elems && $i > 0 {
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/;
                        }
                        
                        $result ~= $apply-full-upper ?? $mapped.uc !! $mapped.tc;
                    } else {
                        $result ~= $mapped;
                    }
                    
                    $found = True;
                    $i += $len;
                    last;
                }
            }
        }
        
        unless $found {
            $result ~= @chars[$i];
            $i++;
        }
    }
    
    return $result;
}