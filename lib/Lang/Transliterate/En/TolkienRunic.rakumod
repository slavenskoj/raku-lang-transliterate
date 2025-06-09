use Lang::Transliterate;

unit class Lang::Transliterate::En::TolkienRunic does Lang::Transliterate::Transliterator;

# English to Tolkien's Runic System (Cirth/Angerthas)
# Based on Tolkien's Angerthas Daeron and Angerthas Moria from The Lord of the Rings
# Using Unicode Runic block (U+16A0-U+16FF) as approximations
# Note: Tolkien's Cirth are not identical to historical runes, but share similarities

my %base-mappings = (
    # Consonants - using closest Unicode runic equivalents
    'p' => "\c[0x16C8]",    # ᛈ - Cirth #1
    'b' => "\c[0x16D2]",    # ᛒ - Cirth #2
    't' => "\c[0x16CF]",    # ᛏ - Cirth #8
    'd' => "\c[0x16DE]",    # ᛞ - Cirth #9
    'k' => "\c[0x16B2]",    # ᚲ - Cirth #18
    'g' => "\c[0x16B7]",    # ᚷ - Cirth #19
    'f' => "\c[0x16A0]",    # ᚠ - Cirth #3
    'v' => "\c[0x16A1]",    # ᚡ - Cirth #4
    'th' => "\c[0x16A6]",   # ᚦ - Cirth #10 (voiceless th)
    'dh' => "\c[0x16A7]",   # ᚧ - Cirth #11 (voiced th)
    's' => "\c[0x16CB]",    # ᛋ - Cirth #15
    'z' => "\c[0x16C9]",    # ᛉ - Cirth #16
    'sh' => "\c[0x16BA]",   # ᚺ - Cirth #14
    'zh' => "\c[0x16DA]",   # ᛚ - used for zh sound
    'h' => "\c[0x16BB]",    # ᚻ - Cirth #13
    'n' => "\c[0x16BE]",    # ᚾ - Cirth #22
    'm' => "\c[0x16D7]",    # ᛗ - Cirth #6
    'r' => "\c[0x16B1]",    # ᚱ - Cirth #12
    'l' => "\c[0x16DA]",    # ᛚ - Cirth #31
    'y' => "\c[0x16E3]",    # ᛣ - Cirth #35
    'w' => "\c[0x16B9]",    # ᚹ - Cirth #34
    
    # Special combinations
    'ng' => "\c[0x16DC]",   # ᛜ - Cirth #20
    'nd' => "\c[0x16BE]\c[0x16DE]",  # n+d combination
    'mb' => "\c[0x16D7]\c[0x16D2]",  # m+b combination
    'ch' => "\c[0x16C7]",   # ᛇ - used for ch
    'j' => "\c[0x16C4]",    # ᛄ - Cirth #36
    'kw' => "\c[0x16B2]\c[0x16B9]",  # k+w
    'gw' => "\c[0x16B7]\c[0x16B9]",  # g+w
    'hw' => "\c[0x16F1]",   # ᛱ - Cirth #33
    'kh' => "\c[0x16B2]\c[0x16BB]",  # k+h
    'gh' => "\c[0x16B7]\c[0x16BB]",  # g+h
    
    # Vowels - Tolkien's system uses diacritics (tehtar) over consonants
    # For simplicity, using separate runes here
    'a' => "\c[0x16A8]",    # ᚨ - Cirth #48
    'e' => "\c[0x16D6]",    # ᛖ - Cirth #46
    'i' => "\c[0x16C1]",    # ᛁ - Cirth #39
    'o' => "\c[0x16A9]",    # ᚩ - Cirth #50
    'u' => "\c[0x16A2]",    # ᚢ - Cirth #42
    
    # Long vowels (marked with macron or doubling in Tolkien)
    'aa' => "\c[0x16A8]\c[0x16EC]",  # a + length mark
    'ee' => "\c[0x16D6]\c[0x16EC]",  # e + length mark
    'ii' => "\c[0x16C1]\c[0x16EC]",  # i + length mark
    'oo' => "\c[0x16A9]\c[0x16EC]",  # o + length mark
    'uu' => "\c[0x16A2]\c[0x16EC]",  # u + length mark
    
    # Diphthongs
    'ai' => "\c[0x16A8]\c[0x16C1]",  # a+i
    'ei' => "\c[0x16D6]\c[0x16C1]",  # e+i
    'oi' => "\c[0x16A9]\c[0x16C1]",  # o+i
    'ui' => "\c[0x16A2]\c[0x16C1]",  # u+i
    'au' => "\c[0x16A8]\c[0x16A2]",  # a+u
    'eu' => "\c[0x16D6]\c[0x16A2]",  # e+u
    'ou' => "\c[0x16A9]\c[0x16A2]",  # o+u
    
    # Special marks
    ' ' => "\c[0x16EB]",    # ᛫ - word separator (Tolkien uses dots/spaces)
    '.' => "\c[0x16EC]",    # ᛬ - sentence end
    ',' => "\c[0x16ED]",    # ᛭ - pause mark
    
    # Common English digraphs
    'ck' => "\c[0x16B2]",   # k (ck = k phonetically)
    'qu' => "\c[0x16B2]\c[0x16B9]",  # kw
    'x' => "\c[0x16B2]\c[0x16CB]",   # ks
    'ph' => "\c[0x16A0]",   # f (ph = f phonetically)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Runic to English reverse mappings
    return (
        # Multi-rune sequences first
        "\c[0x16DC]" => 'ng',
        "\c[0x16BE]\c[0x16DE]" => 'nd',
        "\c[0x16D7]\c[0x16D2]" => 'mb',
        "\c[0x16B2]\c[0x16B9]" => 'kw',
        "\c[0x16B7]\c[0x16B9]" => 'gw',
        "\c[0x16B2]\c[0x16BB]" => 'kh',
        "\c[0x16B7]\c[0x16BB]" => 'gh',
        "\c[0x16B2]\c[0x16CB]" => 'x',
        
        # Vowel combinations
        "\c[0x16A8]\c[0x16EC]" => 'aa',
        "\c[0x16D6]\c[0x16EC]" => 'ee',
        "\c[0x16C1]\c[0x16EC]" => 'ii',
        "\c[0x16A9]\c[0x16EC]" => 'oo',
        "\c[0x16A2]\c[0x16EC]" => 'uu',
        "\c[0x16A8]\c[0x16C1]" => 'ai',
        "\c[0x16D6]\c[0x16C1]" => 'ei',
        "\c[0x16A9]\c[0x16C1]" => 'oi',
        "\c[0x16A2]\c[0x16C1]" => 'ui',
        "\c[0x16A8]\c[0x16A2]" => 'au',
        "\c[0x16D6]\c[0x16A2]" => 'eu',
        "\c[0x16A9]\c[0x16A2]" => 'ou',
        
        # Single runes
        "\c[0x16C8]" => 'p',
        "\c[0x16D2]" => 'b',
        "\c[0x16CF]" => 't',
        "\c[0x16DE]" => 'd',
        "\c[0x16B2]" => 'k',
        "\c[0x16B7]" => 'g',
        "\c[0x16A0]" => 'f',
        "\c[0x16A1]" => 'v',
        "\c[0x16A6]" => 'th',
        "\c[0x16A7]" => 'dh',
        "\c[0x16CB]" => 's',
        "\c[0x16C9]" => 'z',
        "\c[0x16BA]" => 'sh',
        "\c[0x16BB]" => 'h',
        "\c[0x16BE]" => 'n',
        "\c[0x16D7]" => 'm',
        "\c[0x16B1]" => 'r',
        "\c[0x16DA]" => 'l',
        "\c[0x16E3]" => 'y',
        "\c[0x16B9]" => 'w',
        "\c[0x16C7]" => 'ch',
        "\c[0x16C4]" => 'j',
        "\c[0x16F1]" => 'hw',
        "\c[0x16A8]" => 'a',
        "\c[0x16D6]" => 'e',
        "\c[0x16C1]" => 'i',
        "\c[0x16A9]" => 'o',
        "\c[0x16A2]" => 'u',
        "\c[0x16EB]" => ' ',
        "\c[0x16EC]" => '.',
        "\c[0x16ED]" => ',',
    );
}

# Context-aware transliteration to handle digraphs and special cases
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.lc.comb;  # Convert to lowercase for processing
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try longest possible matches first (up to 3 for 'igh', etc.)
        for (3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                
                # Special handling for common English patterns
                if $substr eq 'igh' {
                    # 'igh' = long i sound
                    $result ~= %mappings<ii> // %mappings<i>;
                    $found = True;
                    $i += $len;
                    last;
                }
                elsif $substr eq 'ough' {
                    # 'ough' has various pronunciations; default to 'o'
                    $result ~= %mappings<o>;
                    $found = True;
                    $i += $len;
                    last;
                }
                elsif $substr eq 'tion' {
                    # 'tion' = 'shun'
                    $result ~= (%mappings<sh> // '') ~ (%mappings<u> // '') ~ (%mappings<n> // '');
                    $found = True;
                    $i += $len;
                    last;
                }
                
                if %mappings{$substr}:exists {
                    $result ~= %mappings{$substr};
                    $found = True;
                    $i += $len;
                    last;
                }
            }
        }
        
        unless $found {
            # Handle individual character
            my $char = @chars[$i];
            if $char ~~ /<[a..z]>/ && %mappings{$char}:exists {
                $result ~= %mappings{$char};
            } elsif $char ~~ /\s/ {
                $result ~= %mappings<{ }> // "\c[0x16EB]";
            } elsif $char eq '.' {
                $result ~= %mappings<{.}> // "\c[0x16EC]";
            } elsif $char eq ',' {
                $result ~= %mappings<{,}> // "\c[0x16ED]";
            } else {
                # Keep non-alphabetic characters as-is
                $result ~= $char;
            }
            $i++;
        }
    }
    
    return $result;
}