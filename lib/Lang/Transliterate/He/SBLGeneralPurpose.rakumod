use Lang::Transliterate;

unit class Lang::Transliterate::He::SBLGeneralPurpose does Lang::Transliterate::Transliterator;

# SBL General Purpose Transliteration for Hebrew
# Based on the Wikipedia comparison table and SBL Handbook of Style
# This system is simpler than the Academic version, avoiding special characters
my %base-mappings = (
    # Hebrew to Latin - SBL General Purpose system
    # Consonants
    "\c[0x05D0]" => "'",      # א alef - ' or omit
    "\c[0x05D1]" => 'v',      # ב bet (without dagesh)
    "\c[0x05D1]\c[0x05BC]" => 'b',  # בּ bet (with dagesh)
    "\c[0x05D2]" => 'gh',     # ג gimel (without dagesh)
    "\c[0x05D2]\c[0x05BC]" => 'g',  # גּ gimel (with dagesh)
    "\c[0x05D3]" => 'dh',     # ד dalet (without dagesh)
    "\c[0x05D3]\c[0x05BC]" => 'd',  # דּ dalet (with dagesh)
    "\c[0x05D4]" => 'h',      # ה he
    "\c[0x05D4]\c[0x05BC]" => 'h',  # הּ he with dagesh
    "\c[0x05D5]" => 'w',      # ו vav (or w)
    "\c[0x05D5]\c[0x05BC]" => 'w',  # וּ vav with dagesh (not shuruk)
    "\c[0x05D6]" => 'z',      # ז zayin
    "\c[0x05D6]\c[0x05BC]" => 'z',  # זּ zayin with dagesh
    "\c[0x05D7]" => 'kh',     # ח khet (or h)
    "\c[0x05D8]" => 't',      # ט tet
    "\c[0x05D8]\c[0x05BC]" => 't',  # טּ tet with dagesh
    "\c[0x05D9]" => 'y',      # י yod
    "\c[0x05D9]\c[0x05BC]" => 'y',  # יּ yod with dagesh
    "\c[0x05DA]" => 'kh',     # ך kaf sofit (without dagesh)
    "\c[0x05DB]" => 'kh',     # כ kaf (without dagesh)
    "\c[0x05DA]\c[0x05BC]" => 'k',  # ךּ kaf sofit (with dagesh)
    "\c[0x05DB]\c[0x05BC]" => 'k',  # כּ kaf (with dagesh)
    "\c[0x05DC]" => 'l',      # ל lamed
    "\c[0x05DC]\c[0x05BC]" => 'l',  # לּ lamed with dagesh
    "\c[0x05DD]" => 'm',      # ם mem sofit
    "\c[0x05DE]" => 'm',      # מ mem
    "\c[0x05DE]\c[0x05BC]" => 'm',  # מּ mem with dagesh
    "\c[0x05DF]" => 'n',      # ן nun sofit
    "\c[0x05E0]" => 'n',      # נ nun
    "\c[0x05E0]\c[0x05BC]" => 'n',  # נּ nun with dagesh
    "\c[0x05E1]" => 's',      # ס samek
    "\c[0x05E1]\c[0x05BC]" => 's',  # סּ samek with dagesh
    "\c[0x05E2]" => "'",      # ע ayin - ' or omit
    "\c[0x05E3]" => 'f',      # ף pe sofit (without dagesh)
    "\c[0x05E4]" => 'f',      # פ pe (without dagesh)
    "\c[0x05E3]\c[0x05BC]" => 'p',  # ףּ pe sofit (with dagesh - rare)
    "\c[0x05E4]\c[0x05BC]" => 'p',  # פּ pe (with dagesh)
    "\c[0x05E5]" => 'ts',     # ץ tsade sofit
    "\c[0x05E6]" => 'ts',     # צ tsade
    "\c[0x05E6]\c[0x05BC]" => 'ts', # צּ tsade with dagesh
    "\c[0x05E7]" => 'q',      # ק qof
    "\c[0x05E7]\c[0x05BC]" => 'q',  # קּ qof with dagesh
    "\c[0x05E8]" => 'r',      # ר resh
    "\c[0x05E8]\c[0x05BC]" => 'r',  # רּ resh with dagesh
    "\c[0x05E9]\c[0x05C1]" => 'sh', # שׁ shin
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => 'sh', # שּׁ shin with dagesh
    "\c[0x05E9]\c[0x05C2]" => 's',  # שׂ sin
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => 's',  # שּׂ sin with dagesh
    "\c[0x05EA]" => 'th',     # ת tav (without dagesh)
    "\c[0x05EA]\c[0x05BC]" => 't',  # תּ tav (with dagesh)
    
    # Basic shin/sin without dots defaults to shin
    "\c[0x05E9]" => 'sh',     # ש shin/sin without dots
    
    # Common vowel patterns (simplified for general use)
    "\c[0x05D0]\c[0x05B7]" => 'a',  # אַ alef with patach
    "\c[0x05D0]\c[0x05B8]" => 'a',  # אָ alef with kamatz
    "\c[0x05D0]\c[0x05B5]" => 'e',  # אֵ alef with tzere
    "\c[0x05D0]\c[0x05B6]" => 'e',  # אֶ alef with segol
    "\c[0x05D0]\c[0x05B4]" => 'i',  # אִ alef with chirik
    "\c[0x05D0]\c[0x05B9]" => 'o',  # אֹ alef with cholam
    "\c[0x05D0]\c[0x05BA]" => 'u',  # אֻ alef with kubutz
    "\c[0x05D0]\c[0x05D5]\c[0x05BC]" => 'u', # אוּ alef with shuruk
    
    # Final qamets he
    "\c[0x05D8]\c[0x05B8]\c[0x05D4]" => 'ah', # טָה final qamets he
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # SBL General Purpose reverse mappings
    # Note: This is lossy due to simplified transliteration
    return (
        # Multi-character mappings first
        'gh' => "\c[0x05D2]",    # ג gimel (without dagesh)
        'dh' => "\c[0x05D3]",    # ד dalet (without dagesh) 
        'kh' => "\c[0x05D7]",    # ח khet (could also be כ)
        'sh' => "\c[0x05E9]\c[0x05C1]",  # שׁ
        'ts' => "\c[0x05E6]",    # צ tsade
        'th' => "\c[0x05EA]",    # ת tav (without dagesh)
        'ah' => "\c[0x05D0]\c[0x05B8]\c[0x05D4]", # אָה
        
        # Single character mappings
        'a' => "\c[0x05D0]",     # א (could be vowel)
        'b' => "\c[0x05D1]\c[0x05BC]",   # בּ
        'c' => '',               # not used
        'd' => "\c[0x05D3]\c[0x05BC]",   # דּ
        'e' => '',               # usually vowel
        'f' => "\c[0x05E4]",     # פ
        'g' => "\c[0x05D2]\c[0x05BC]",   # גּ
        'h' => "\c[0x05D4]",     # ה (could also be ח)
        'i' => "\c[0x05D9]",     # י
        'j' => '',               # not used
        'k' => "\c[0x05DB]\c[0x05BC]",   # כּ
        'l' => "\c[0x05DC]",     # ל
        'm' => "\c[0x05DE]",     # מ
        'n' => "\c[0x05E0]",     # נ
        'o' => "\c[0x05D5]",     # ו (as vowel)
        'p' => "\c[0x05E4]\c[0x05BC]",   # פּ
        'q' => "\c[0x05E7]",     # ק
        'r' => "\c[0x05E8]",     # ר
        's' => "\c[0x05E1]",     # ס (could also be שׂ)
        't' => "\c[0x05EA]\c[0x05BC]",   # תּ (could also be ט)
        'u' => "\c[0x05D5]",     # ו (as vowel)
        'v' => "\c[0x05D1]",     # ב (could also be ו)
        'w' => "\c[0x05D5]",     # ו
        'x' => '',               # not used
        'y' => "\c[0x05D9]",     # י
        'z' => "\c[0x05D6]",     # ז
        "'" => '',               # could be א or ע
    );
}

# SBL General Purpose often omits alef and ayin
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
                    
                    # Special handling for alef and ayin - often omitted
                    if ($substr eq "\c[0x05D0]" || $substr eq "\c[0x05E2]") {
                        # Often omit at beginning of word or between vowels
                        if $i == 0 || ($i > 0 && @chars[$i - 1] ~~ /\s/) {
                            # Skip this character at word beginning
                            $found = True;
                            $i += $len;
                            last;
                        }
                        # Also often omitted between vowels or in middle of words
                        # But keep the apostrophe for clarity in some cases
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