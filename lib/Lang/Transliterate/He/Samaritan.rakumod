use Lang::Transliterate;

unit class Lang::Transliterate::He::Samaritan does Lang::Transliterate::Transliterator;

# Hebrew to Samaritan Script Conversion
# Based on the Wikipedia table of Phoenician/Paleo-Hebrew/Samaritan letters
my %base-mappings = (
    # Square Hebrew to Samaritan
    "\c[0x05D0]" => "\c[0x0800]",  # א → ࠀ aleph
    "\c[0x05D1]" => "\c[0x0801]",  # ב → ࠁ bet
    "\c[0x05D2]" => "\c[0x0802]",  # ג → ࠂ gimel
    "\c[0x05D3]" => "\c[0x0803]",  # ד → ࠃ dalet
    "\c[0x05D4]" => "\c[0x0804]",  # ה → ࠄ he
    "\c[0x05D5]" => "\c[0x0805]",  # ו → ࠅ waw
    "\c[0x05D6]" => "\c[0x0806]",  # ז → ࠆ zayin
    "\c[0x05D7]" => "\c[0x0807]",  # ח → ࠇ het
    "\c[0x05D8]" => "\c[0x0808]",  # ט → ࠈ tet
    "\c[0x05D9]" => "\c[0x0809]",  # י → ࠉ yod
    "\c[0x05DA]" => "\c[0x080A]",  # ך → ࠊ kaf (final)
    "\c[0x05DB]" => "\c[0x080A]",  # כ → ࠊ kaf
    "\c[0x05DC]" => "\c[0x080B]",  # ל → ࠋ lamed
    "\c[0x05DD]" => "\c[0x080C]",  # ם → ࠌ mem (final)
    "\c[0x05DE]" => "\c[0x080C]",  # מ → ࠌ mem
    "\c[0x05DF]" => "\c[0x080D]",  # ן → ࠍ nun (final)
    "\c[0x05E0]" => "\c[0x080D]",  # נ → ࠍ nun
    "\c[0x05E1]" => "\c[0x080E]",  # ס → ࠎ samek
    "\c[0x05E2]" => "\c[0x080F]",  # ע → ࠏ ayin
    "\c[0x05E3]" => "\c[0x0810]",  # ף → ࠐ pe (final)
    "\c[0x05E4]" => "\c[0x0810]",  # פ → ࠐ pe
    "\c[0x05E5]" => "\c[0x0811]",  # ץ → ࠑ tsade (final)
    "\c[0x05E6]" => "\c[0x0811]",  # צ → ࠑ tsade
    "\c[0x05E7]" => "\c[0x0812]",  # ק → ࠒ qof
    "\c[0x05E8]" => "\c[0x0813]",  # ר → ࠓ resh
    "\c[0x05E9]" => "\c[0x0814]",  # ש → ࠔ shin
    "\c[0x05EA]" => "\c[0x0815]",  # ת → ࠕ taw
    
    # Handle letters with dagesh (simply map to same Samaritan letter)
    "\c[0x05D1]\c[0x05BC]" => "\c[0x0801]",  # בּ → ࠁ
    "\c[0x05D2]\c[0x05BC]" => "\c[0x0802]",  # גּ → ࠂ
    "\c[0x05D3]\c[0x05BC]" => "\c[0x0803]",  # דּ → ࠃ
    "\c[0x05D4]\c[0x05BC]" => "\c[0x0804]",  # הּ → ࠄ
    "\c[0x05D5]\c[0x05BC]" => "\c[0x0805]",  # וּ → ࠅ
    "\c[0x05D6]\c[0x05BC]" => "\c[0x0806]",  # זּ → ࠆ
    "\c[0x05D8]\c[0x05BC]" => "\c[0x0808]",  # טּ → ࠈ
    "\c[0x05D9]\c[0x05BC]" => "\c[0x0809]",  # יּ → ࠉ
    "\c[0x05DA]\c[0x05BC]" => "\c[0x080A]",  # ךּ → ࠊ
    "\c[0x05DB]\c[0x05BC]" => "\c[0x080A]",  # כּ → ࠊ
    "\c[0x05DC]\c[0x05BC]" => "\c[0x080B]",  # לּ → ࠋ
    "\c[0x05DE]\c[0x05BC]" => "\c[0x080C]",  # מּ → ࠌ
    "\c[0x05E0]\c[0x05BC]" => "\c[0x080D]",  # נּ → ࠍ
    "\c[0x05E1]\c[0x05BC]" => "\c[0x080E]",  # סּ → ࠎ
    "\c[0x05E3]\c[0x05BC]" => "\c[0x0810]",  # ףּ → ࠐ
    "\c[0x05E4]\c[0x05BC]" => "\c[0x0810]",  # פּ → ࠐ
    "\c[0x05E6]\c[0x05BC]" => "\c[0x0811]",  # צּ → ࠑ
    "\c[0x05E7]\c[0x05BC]" => "\c[0x0812]",  # קּ → ࠒ
    "\c[0x05E8]\c[0x05BC]" => "\c[0x0813]",  # רּ → ࠓ
    "\c[0x05EA]\c[0x05BC]" => "\c[0x0815]",  # תּ → ࠕ
    
    # Shin and sin both map to the same letter
    "\c[0x05E9]\c[0x05C1]" => "\c[0x0814]",  # שׁ → ࠔ
    "\c[0x05E9]\c[0x05C2]" => "\c[0x0814]",  # שׂ → ࠔ
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => "\c[0x0814]",  # שּׁ → ࠔ
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => "\c[0x0814]",  # שּׂ → ࠔ
    
    # Letters with rafe
    "\c[0x05D1]\c[0x05BF]" => "\c[0x0801]",  # בֿ → ࠁ
    "\c[0x05DB]\c[0x05BF]" => "\c[0x080A]",  # כֿ → ࠊ
    "\c[0x05E4]\c[0x05BF]" => "\c[0x0810]",  # פֿ → ࠐ
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Samaritan to Square Hebrew reverse mappings
    return (
        "\c[0x0800]" => "\c[0x05D0]",  # ࠀ → א
        "\c[0x0801]" => "\c[0x05D1]",  # ࠁ → ב
        "\c[0x0802]" => "\c[0x05D2]",  # ࠂ → ג
        "\c[0x0803]" => "\c[0x05D3]",  # ࠃ → ד
        "\c[0x0804]" => "\c[0x05D4]",  # ࠄ → ה
        "\c[0x0805]" => "\c[0x05D5]",  # ࠅ → ו
        "\c[0x0806]" => "\c[0x05D6]",  # ࠆ → ז
        "\c[0x0807]" => "\c[0x05D7]",  # ࠇ → ח
        "\c[0x0808]" => "\c[0x05D8]",  # ࠈ → ט
        "\c[0x0809]" => "\c[0x05D9]",  # ࠉ → י
        "\c[0x080A]" => "\c[0x05DB]",  # ࠊ → כ (not final form)
        "\c[0x080B]" => "\c[0x05DC]",  # ࠋ → ל
        "\c[0x080C]" => "\c[0x05DE]",  # ࠌ → מ (not final form)
        "\c[0x080D]" => "\c[0x05E0]",  # ࠍ → נ (not final form)
        "\c[0x080E]" => "\c[0x05E1]",  # ࠎ → ס
        "\c[0x080F]" => "\c[0x05E2]",  # ࠏ → ע
        "\c[0x0810]" => "\c[0x05E4]",  # ࠐ → פ (not final form)
        "\c[0x0811]" => "\c[0x05E6]",  # ࠑ → צ (not final form)
        "\c[0x0812]" => "\c[0x05E7]",  # ࠒ → ק
        "\c[0x0813]" => "\c[0x05E8]",  # ࠓ → ר
        "\c[0x0814]" => "\c[0x05E9]",  # ࠔ → ש
        "\c[0x0815]" => "\c[0x05EA]",  # ࠕ → ת
    );
}

# Override transliterate to handle vowel points and other diacritics
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try longest possible matches first (up to 3 for shin/sin with dagesh)
        for (3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                if %mappings{$substr}:exists {
                    $result ~= %mappings{$substr};
                    $found = True;
                    $i += $len;
                    last;
                }
            }
        }
        
        unless $found {
            my $char = @chars[$i];
            # Skip Hebrew vowel points and cantillation marks (U+0591-U+05C7)
            # but allow Samaritan vowel marks (U+0816-U+082D) to pass through
            if $char.ord >= 0x0591 && $char.ord <= 0x05C7 {
                # Don't add Hebrew vowel points to output
                $i++;
            } else {
                # Keep non-Hebrew characters and Samaritan marks as is
                $result ~= $char;
                $i++;
            }
        }
    }
    
    return $result;
}