use Lang::Transliterate;

unit class Lang::Transliterate::Yi::YIVO does Lang::Transliterate::Transliterator;

# YIVO Transliteration for Yiddish
# Based on the YIVO romanizations from Uriel Weinreich's English–Yiddish–English Dictionary
my %base-mappings = (
    # Yiddish to Latin - YIVO system
    # Note: Shtumer alef (א) has no pronunciation/transcription
    
    # Vowels and vowel combinations
    "\c[0x05D0]\c[0x05B7]" => 'a',      # אַ pasekh alef
    "\c[0x05D0]\c[0x05B8]" => 'o',      # אָ komets alef
    "\c[0x05D5]" => 'u',                 # ו vov
    "\c[0x05D5]\c[0x05BC]" => 'u',       # וּ melupm vov
    "\c[0x05D5]\c[0x05D9]" => 'oy',      # וי vov yud
    "\c[0x05E2]" => 'e',                 # ע ayin
    "\c[0x05D9]" => 'i',                 # י yud (when vocalic)
    "\c[0x05D9]\c[0x05B4]" => 'i',       # יִ khirik yud
    "\c[0x05D9]\c[0x05D9]" => 'ey',      # יי tsvey yudn
    "\c[0x05F2]\c[0x05B7]" => 'ay',      # ײַ pasekh tsvey yudn
    
    # Consonants
    "\c[0x05D1]" => 'b',                 # ב beys
    "\c[0x05D1]\c[0x05BC]" => 'b',       # בּ beys (non-YIVO alternative)
    "\c[0x05D1]\c[0x05BF]" => 'v',       # בֿ veys (Semitic words)
    "\c[0x05D2]" => 'g',                 # ג giml
    "\c[0x05D3]" => 'd',                 # ד daled
    "\c[0x05D3]\c[0x05D6]\c[0x05E9]" => 'dzh', # דזש daled zayen shin
    "\c[0x05D4]" => 'h',                 # ה hey
    "\c[0x05D5]\c[0x05D5]" => 'v',       # וו tsvey vovn
    "\c[0x05D6]" => 'z',                 # ז zayen
    "\c[0x05D6]\c[0x05E9]" => 'zh',      # זש zayen shin
    "\c[0x05D7]" => 'kh',                # ח khes (Semitic)
    "\c[0x05D8]" => 't',                 # ט tes
    "\c[0x05D8]\c[0x05E9]" => 'tsh',     # טש tes shin
    "\c[0x05DB]\c[0x05BC]" => 'k',       # כּ kof (Semitic)
    "\c[0x05DB]" => 'kh',                # כ khof
    "\c[0x05DA]" => 'kh',                # ך lange/ende khof
    "\c[0x05DC]" => 'l',                 # ל lamed
    "\c[0x05DE]" => 'm',                 # מ mem
    "\c[0x05DD]" => 'm',                 # ם shlos/ende mem
    "\c[0x05E0]" => 'n',                 # נ nun
    "\c[0x05DF]" => 'n',                 # ן lange/ende nun
    "\c[0x05E1]" => 's',                 # ס samekh
    "\c[0x05E4]\c[0x05BC]" => 'p',       # פּ pey
    "\c[0x05E4]\c[0x05BF]" => 'f',       # פֿ fey
    "\c[0x05E4]" => 'f',                 # פ fey (non-YIVO alternative)
    "\c[0x05E3]" => 'f',                 # ף lange/ende fey
    "\c[0x05E6]" => 'ts',                # צ tsadek
    "\c[0x05E5]" => 'ts',                # ץ lange/ende tsadik
    "\c[0x05E7]" => 'k',                 # ק kuf
    "\c[0x05E8]" => 'r',                 # ר reysh
    "\c[0x05E9]" => 'sh',                # ש shin
    "\c[0x05E9]\c[0x05C2]" => 's',       # שׂ sin (Semitic)
    "\c[0x05EA]\c[0x05BC]" => 't',       # תּ tof (Semitic)
    "\c[0x05EA]" => 's',                 # ת sof (Semitic)
    
    # Special case for consonantal yud
    "\c[0x05D9]" => 'y',                 # י yud (when consonantal)
);

# We need special handling for yud since it can be consonantal [y] or vocalic [i]
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try longest possible matches first (up to 3 for דזש)
        for (3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                
                # Special handling for yud
                if $substr eq "\c[0x05D9]" {
                    # Yud is consonantal [y] when:
                    # 1. At the beginning of a word
                    # 2. After a vowel letter
                    my $is-consonantal = False;
                    
                    if $i == 0 || ($i > 0 && @chars[$i - 1] ~~ /\s/) {
                        # Beginning of text or word
                        $is-consonantal = True;
                    } elsif $i > 0 {
                        my $prev = @chars[$i - 1];
                        # After vowel letters (alef, ayin, vov)
                        if $prev eq "\c[0x05D0]" || $prev eq "\c[0x05E2]" || $prev eq "\c[0x05D5]" {
                            $is-consonantal = True;
                        }
                        # After pasekh alef or komets alef
                        if $i > 1 && @chars[$i - 2] eq "\c[0x05D0]" && 
                           ($prev eq "\c[0x05B7]" || $prev eq "\c[0x05B8]") {
                            $is-consonantal = True;
                        }
                    }
                    
                    $result ~= $is-consonantal ?? 'y' !! 'i';
                    $found = True;
                    $i += $len;
                    last;
                }
                
                if %mappings{$substr}:exists {
                    my $mapped = %mappings{$substr};
                    
                    # Skip shtumer alef (plain א with no vowel)
                    if $substr eq "\c[0x05D0]" && 
                       ($i + 1 >= @chars.elems || @chars[$i + 1] ne "\c[0x05B7]" && @chars[$i + 1] ne "\c[0x05B8]") {
                        # This is shtumer alef - skip it
                        $found = True;
                        $i += $len;
                        last;
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

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # YIVO reverse mappings
    # Note: This is lossy due to multiple Yiddish letters mapping to same Latin
    return (
        # Multi-character mappings first
        'dzh' => "\c[0x05D3]\c[0x05D6]\c[0x05E9]",  # דזש
        'tsh' => "\c[0x05D8]\c[0x05E9]",             # טש
        'zh' => "\c[0x05D6]\c[0x05E9]",              # זש
        'kh' => "\c[0x05D7]",                         # ח (could also be כ/ך)
        'sh' => "\c[0x05E9]",                         # ש
        'ts' => "\c[0x05E6]",                         # צ
        'oy' => "\c[0x05D5]\c[0x05D9]",              # וי
        'ey' => "\c[0x05D9]\c[0x05D9]",              # יי
        'ay' => "\c[0x05F2]\c[0x05B7]",              # ײַ
        
        # Single character mappings
        'a' => "\c[0x05D0]\c[0x05B7]",               # אַ
        'b' => "\c[0x05D1]",                          # ב
        'c' => "\c[0x05E6]",                          # צ (alternative for ts)
        'd' => "\c[0x05D3]",                          # ד
        'e' => "\c[0x05E2]",                          # ע
        'f' => "\c[0x05E4]\c[0x05BF]",               # פֿ
        'g' => "\c[0x05D2]",                          # ג
        'h' => "\c[0x05D4]",                          # ה
        'i' => "\c[0x05D9]",                          # י (vocalic)
        'j' => "\c[0x05D6]\c[0x05E9]",               # זש (alternative for zh)
        'k' => "\c[0x05E7]",                          # ק
        'l' => "\c[0x05DC]",                          # ל
        'm' => "\c[0x05DE]",                          # מ
        'n' => "\c[0x05E0]",                          # נ
        'o' => "\c[0x05D0]\c[0x05B8]",               # אָ
        'p' => "\c[0x05E4]\c[0x05BC]",               # פּ
        'q' => "\c[0x05E7]",                          # ק
        'r' => "\c[0x05E8]",                          # ר
        's' => "\c[0x05E1]",                          # ס (could also be שׂ or ת)
        't' => "\c[0x05D8]",                          # ט (could also be תּ)
        'u' => "\c[0x05D5]",                          # ו
        'v' => "\c[0x05D5]\c[0x05D5]",               # וו (could also be בֿ)
        'w' => "\c[0x05D5]\c[0x05D5]",               # וו
        'x' => "\c[0x05E7]\c[0x05E1]",               # קס
        'y' => "\c[0x05D9]",                          # י (consonantal)
        'z' => "\c[0x05D6]",                          # ז
    );
}