use Lang::Transliterate;

unit class Lang::Transliterate::He::HebrewAcademy1953 does Lang::Transliterate::Transliterator;

# Hebrew Academy Transliteration 1953 for Hebrew
# Based on the Wikipedia comparison table
my %base-mappings = (
    # Hebrew to Latin - Hebrew Academy 1953 system
    # Consonants
    "\c[0x05D0]" => 'ʼ',      # א alef - omitted at word initial
    "\c[0x05D1]" => 'v',      # ב vet
    "\c[0x05D1]\c[0x05BC]" => 'b',  # בּ bet
    "\c[0x05D2]" => 'g',      # ג gimel
    "\c[0x05D2]\c[0x05BC]" => 'g',  # גּ gimel with dagesh
    "\c[0x05D2]\c[0x05F3]" => 'ǧ',  # ג׳ jimel (loanword)
    "\c[0x05D3]" => 'd',      # ד dalet
    "\c[0x05D3]\c[0x05BC]" => 'd',  # דּ dalet with dagesh
    "\c[0x05D3]\c[0x05F3]" => 'ḏ',  # ד׳ dhalet (foreign)
    "\c[0x05D4]" => 'h',      # ה he - omitted at word final
    "\c[0x05D4]\c[0x05BC]" => 'h',  # הּ he with dagesh
    "\c[0x05D5]" => 'w',      # ו waw
    "\c[0x05D5]\c[0x05BC]" => 'w',  # וּ waw with dagesh (not shuruk)
    "\c[0x05D6]" => 'z',      # ז zayin
    "\c[0x05D6]\c[0x05BC]" => 'z',  # זּ zayin with dagesh
    "\c[0x05D6]\c[0x05F3]" => 'ž',  # ז׳ zhayin (loanword)
    "\c[0x05D7]" => 'ẖ',      # ח ẖet
    "\c[0x05D8]" => 't',      # ט tet
    "\c[0x05D8]\c[0x05BC]" => 't',  # טּ tet with dagesh
    "\c[0x05D9]" => 'y',      # י yud
    "\c[0x05D9]\c[0x05BC]" => 'y',  # יּ yud with dagesh
    "\c[0x05DA]" => 'kh',     # ך khaf sofit
    "\c[0x05DB]" => 'kh',     # כ khaf
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
    "\c[0x05E1]" => 's',      # ס samekh
    "\c[0x05E1]\c[0x05BC]" => 's',  # סּ samekh with dagesh
    "\c[0x05E2]" => 'ʻ',      # ע ʻayin
    "\c[0x05E3]" => 'f',      # ף fe sofit
    "\c[0x05E4]" => 'f',      # פ fe
    "\c[0x05E3]\c[0x05BC]" => 'p',  # ףּ pe sofit with dagesh (rare)
    "\c[0x05E4]\c[0x05BC]" => 'p',  # פּ pe
    "\c[0x05E5]" => 'ẕ',      # ץ ẕadi sofit
    "\c[0x05E6]" => 'ẕ',      # צ ẕadi
    "\c[0x05E6]\c[0x05BC]" => 'ẕ',  # צּ ẕadi with dagesh
    "\c[0x05E5]\c[0x05F3]" => 'č',  # ץ׳ čadi sofit (loanword)
    "\c[0x05E6]\c[0x05F3]" => 'č',  # צ׳ čadi (loanword)
    "\c[0x05E7]" => 'q',      # ק quf
    "\c[0x05E7]\c[0x05BC]" => 'q',  # קּ quf with dagesh
    "\c[0x05E8]" => 'r',      # ר resh
    "\c[0x05E8]\c[0x05BC]" => 'r',  # רּ resh with dagesh (foreign)
    "\c[0x05E9]\c[0x05C1]" => 'sh', # שׁ shin
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => 'sh', # שּׁ shin with dagesh
    "\c[0x05E9]\c[0x05C2]" => 's',  # שׂ sin
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => 's',  # שּׂ sin with dagesh
    "\c[0x05EA]" => 't',      # ת taw
    "\c[0x05EA]\c[0x05BC]" => 't',  # תּ taw with dagesh
    "\c[0x05EA]\c[0x05F3]" => 'ṯ',  # ת׳ ṯaw (foreign)
    
    # Basic shin/sin without dots defaults to shin
    "\c[0x05E9]" => 'sh',     # ש shin/sin without dots
    
    # Double consonants with dagesh hazak
    "\c[0x05D1]\c[0x05BC]\c[0x05BC]" => 'bb',  # בּּ bet hazak
    "\c[0x05D2]\c[0x05BC]\c[0x05BC]" => 'gg',  # גּּ gimel hazak
    "\c[0x05D3]\c[0x05BC]\c[0x05BC]" => 'dd',  # דּּ dalet hazak
    "\c[0x05D5]\c[0x05BC]\c[0x05BC]" => 'ww',  # וּּ waw hazak
    "\c[0x05D6]\c[0x05BC]\c[0x05BC]" => 'zz',  # זּּ zayin hazak
    "\c[0x05D8]\c[0x05BC]\c[0x05BC]" => 'tt',  # טּּ tet hazak
    "\c[0x05D9]\c[0x05BC]\c[0x05BC]" => 'yy',  # יּּ yud hazak
    "\c[0x05DB]\c[0x05BC]\c[0x05BC]" => 'kk',  # כּּ kaf hazak
    "\c[0x05DC]\c[0x05BC]\c[0x05BC]" => 'll',  # לּּ lamed hazak
    "\c[0x05DE]\c[0x05BC]\c[0x05BC]" => 'mm',  # מּּ mem hazak
    "\c[0x05E0]\c[0x05BC]\c[0x05BC]" => 'nn',  # נּּ nun hazak
    "\c[0x05E1]\c[0x05BC]\c[0x05BC]" => 'ss',  # סּּ samekh hazak
    "\c[0x05E4]\c[0x05BC]\c[0x05BC]" => 'pp',  # פּּ pe hazak
    "\c[0x05E6]\c[0x05BC]\c[0x05BC]" => 'ẕẕ',  # צּּ ẕadi hazak
    "\c[0x05E7]\c[0x05BC]\c[0x05BC]" => 'qq',  # קּּ quf hazak
    "\c[0x05E8]\c[0x05BC]\c[0x05BC]" => 'rr',  # רּּ resh hazak
    "\c[0x05EA]\c[0x05BC]\c[0x05BC]" => 'tt',  # תּּ taw hazak
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Hebrew Academy 1953 reverse mappings
    return (
        # Multi-character mappings first
        'kh' => "\c[0x05DB]",    # כ khaf
        'sh' => "\c[0x05E9]\c[0x05C1]",  # שׁ
        'bb' => "\c[0x05D1]\c[0x05BC]\c[0x05BC]",  # בּּ
        'gg' => "\c[0x05D2]\c[0x05BC]\c[0x05BC]",  # גּּ
        'dd' => "\c[0x05D3]\c[0x05BC]\c[0x05BC]",  # דּּ
        'ww' => "\c[0x05D5]\c[0x05BC]\c[0x05BC]",  # וּּ
        'zz' => "\c[0x05D6]\c[0x05BC]\c[0x05BC]",  # זּּ
        'tt' => "\c[0x05D8]\c[0x05BC]\c[0x05BC]",  # טּּ (could also be תּּ)
        'yy' => "\c[0x05D9]\c[0x05BC]\c[0x05BC]",  # יּּ
        'kk' => "\c[0x05DB]\c[0x05BC]\c[0x05BC]",  # כּּ
        'll' => "\c[0x05DC]\c[0x05BC]\c[0x05BC]",  # לּּ
        'mm' => "\c[0x05DE]\c[0x05BC]\c[0x05BC]",  # מּּ
        'nn' => "\c[0x05E0]\c[0x05BC]\c[0x05BC]",  # נּּ
        'ss' => "\c[0x05E1]\c[0x05BC]\c[0x05BC]",  # סּּ
        'pp' => "\c[0x05E4]\c[0x05BC]\c[0x05BC]",  # פּּ
        'ẕẕ' => "\c[0x05E6]\c[0x05BC]\c[0x05BC]",  # צּּ
        'qq' => "\c[0x05E7]\c[0x05BC]\c[0x05BC]",  # קּּ
        'rr' => "\c[0x05E8]\c[0x05BC]\c[0x05BC]",  # רּּ
        
        # Single character mappings
        'a' => '',               # usually vowel
        'b' => "\c[0x05D1]\c[0x05BC]",   # בּ
        'c' => '',               # not used
        'd' => "\c[0x05D3]",     # ד
        'e' => '',               # usually vowel
        'f' => "\c[0x05E4]",     # פ
        'g' => "\c[0x05D2]",     # ג
        'h' => "\c[0x05D4]",     # ה
        'i' => '',               # usually vowel
        'k' => "\c[0x05DB]\c[0x05BC]",   # כּ
        'l' => "\c[0x05DC]",     # ל
        'm' => "\c[0x05DE]",     # מ
        'n' => "\c[0x05E0]",     # נ
        'o' => '',               # usually vowel
        'p' => "\c[0x05E4]\c[0x05BC]",   # פּ
        'q' => "\c[0x05E7]",     # ק
        'r' => "\c[0x05E8]",     # ר
        's' => "\c[0x05E1]",     # ס (could also be שׂ)
        't' => "\c[0x05EA]",     # ת (could also be ט)
        'u' => '',               # usually vowel
        'v' => "\c[0x05D1]",     # ב
        'w' => "\c[0x05D5]",     # ו
        'y' => "\c[0x05D9]",     # י
        'z' => "\c[0x05D6]",     # ז
        'ʼ' => "\c[0x05D0]",     # א
        'ʻ' => "\c[0x05E2]",     # ע
        
        # Special characters
        'ǧ' => "\c[0x05D2]\c[0x05F3]",   # ג׳
        'ḏ' => "\c[0x05D3]\c[0x05F3]",   # ד׳
        'ž' => "\c[0x05D6]\c[0x05F3]",   # ז׳
        'ẖ' => "\c[0x05D7]",     # ח
        'ẕ' => "\c[0x05E6]",     # צ
        'č' => "\c[0x05E6]\c[0x05F3]",   # צ׳
        'ṯ' => "\c[0x05EA]\c[0x05F3]",   # ת׳
    );
}

# Hebrew Academy 1953 omits alef at word initial and he at word final
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
                    
                    # Special handling for alef
                    if $substr eq "\c[0x05D0]" {
                        # Omit at beginning of word
                        if $i == 0 || ($i > 0 && @chars[$i - 1] ~~ /\s/) {
                            # Skip this character
                            $found = True;
                            $i += $len;
                            last;
                        }
                    }
                    
                    # Special handling for final he  
                    if $substr eq "\c[0x05D4]" {
                        # Omit at end of words
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