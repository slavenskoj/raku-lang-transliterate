use Lang::Transliterate;

unit class Lang::Transliterate::He::PaleoHebrew does Lang::Transliterate::Transliterator;

# Hebrew to Paleo-Hebrew Script Conversion
# Based on the Wikipedia table of Phoenician/Paleo-Hebrew letters
# Note: Paleo-Hebrew uses the same letter shapes as Phoenician
my %base-mappings = (
    # Square Hebrew to Paleo-Hebrew/Phoenician
    "\c[0x05D0]" => "\c[0x10900]",  # א → 𐤀 aleph
    "\c[0x05D1]" => "\c[0x10901]",  # ב → 𐤁 beth
    "\c[0x05D2]" => "\c[0x10902]",  # ג → 𐤂 gimel
    "\c[0x05D3]" => "\c[0x10903]",  # ד → 𐤃 daleth
    "\c[0x05D4]" => "\c[0x10904]",  # ה → 𐤄 he
    "\c[0x05D5]" => "\c[0x10905]",  # ו → 𐤅 waw
    "\c[0x05D6]" => "\c[0x10906]",  # ז → 𐤆 zayin
    "\c[0x05D7]" => "\c[0x10907]",  # ח → 𐤇 heth
    "\c[0x05D8]" => "\c[0x10908]",  # ט → 𐤈 teth
    "\c[0x05D9]" => "\c[0x10909]",  # י → 𐤉 yodh
    "\c[0x05DA]" => "\c[0x1090A]",  # ך → 𐤊 kaph (final)
    "\c[0x05DB]" => "\c[0x1090A]",  # כ → 𐤊 kaph
    "\c[0x05DC]" => "\c[0x1090B]",  # ל → 𐤋 lamedh
    "\c[0x05DD]" => "\c[0x1090C]",  # ם → 𐤌 mem (final)
    "\c[0x05DE]" => "\c[0x1090C]",  # מ → 𐤌 mem
    "\c[0x05DF]" => "\c[0x1090D]",  # ן → 𐤍 nun (final)
    "\c[0x05E0]" => "\c[0x1090D]",  # נ → 𐤍 nun
    "\c[0x05E1]" => "\c[0x1090E]",  # ס → 𐤎 samekh
    "\c[0x05E2]" => "\c[0x1090F]",  # ע → 𐤏 ayin
    "\c[0x05E3]" => "\c[0x10910]",  # ף → 𐤐 pe (final)
    "\c[0x05E4]" => "\c[0x10910]",  # פ → 𐤐 pe
    "\c[0x05E5]" => "\c[0x10911]",  # ץ → 𐤑 tsade (final)
    "\c[0x05E6]" => "\c[0x10911]",  # צ → 𐤑 tsade
    "\c[0x05E7]" => "\c[0x10912]",  # ק → 𐤒 qoph
    "\c[0x05E8]" => "\c[0x10913]",  # ר → 𐤓 resh
    "\c[0x05E9]" => "\c[0x10914]",  # ש → 𐤔 shin
    "\c[0x05EA]" => "\c[0x10915]",  # ת → 𐤕 taw
    
    # Handle letters with dagesh (simply map to same Paleo-Hebrew letter)
    "\c[0x05D1]\c[0x05BC]" => "\c[0x10901]",  # בּ → 𐤁
    "\c[0x05D2]\c[0x05BC]" => "\c[0x10902]",  # גּ → 𐤂
    "\c[0x05D3]\c[0x05BC]" => "\c[0x10903]",  # דּ → 𐤃
    "\c[0x05D4]\c[0x05BC]" => "\c[0x10904]",  # הּ → 𐤄
    "\c[0x05D5]\c[0x05BC]" => "\c[0x10905]",  # וּ → 𐤅
    "\c[0x05D6]\c[0x05BC]" => "\c[0x10906]",  # זּ → 𐤆
    "\c[0x05D8]\c[0x05BC]" => "\c[0x10908]",  # טּ → 𐤈
    "\c[0x05D9]\c[0x05BC]" => "\c[0x10909]",  # יּ → 𐤉
    "\c[0x05DA]\c[0x05BC]" => "\c[0x1090A]",  # ךּ → 𐤊
    "\c[0x05DB]\c[0x05BC]" => "\c[0x1090A]",  # כּ → 𐤊
    "\c[0x05DC]\c[0x05BC]" => "\c[0x1090B]",  # לּ → 𐤋
    "\c[0x05DE]\c[0x05BC]" => "\c[0x1090C]",  # מּ → 𐤌
    "\c[0x05E0]\c[0x05BC]" => "\c[0x1090D]",  # נּ → 𐤍
    "\c[0x05E1]\c[0x05BC]" => "\c[0x1090E]",  # סּ → 𐤎
    "\c[0x05E3]\c[0x05BC]" => "\c[0x10910]",  # ףּ → 𐤐
    "\c[0x05E4]\c[0x05BC]" => "\c[0x10910]",  # פּ → 𐤐
    "\c[0x05E6]\c[0x05BC]" => "\c[0x10911]",  # צּ → 𐤑
    "\c[0x05E7]\c[0x05BC]" => "\c[0x10912]",  # קּ → 𐤒
    "\c[0x05E8]\c[0x05BC]" => "\c[0x10913]",  # רּ → 𐤓
    "\c[0x05EA]\c[0x05BC]" => "\c[0x10915]",  # תּ → 𐤕
    
    # Shin and sin both map to the same letter
    "\c[0x05E9]\c[0x05C1]" => "\c[0x10914]",  # שׁ → 𐤔
    "\c[0x05E9]\c[0x05C2]" => "\c[0x10914]",  # שׂ → 𐤔
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => "\c[0x10914]",  # שּׁ → 𐤔
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => "\c[0x10914]",  # שּׂ → 𐤔
    
    # Letters with rafe
    "\c[0x05D1]\c[0x05BF]" => "\c[0x10901]",  # בֿ → 𐤁
    "\c[0x05DB]\c[0x05BF]" => "\c[0x1090A]",  # כֿ → 𐤊
    "\c[0x05E4]\c[0x05BF]" => "\c[0x10910]",  # פֿ → 𐤐
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Paleo-Hebrew to Square Hebrew reverse mappings
    return (
        "\c[0x10900]" => "\c[0x05D0]",  # 𐤀 → א
        "\c[0x10901]" => "\c[0x05D1]",  # 𐤁 → ב
        "\c[0x10902]" => "\c[0x05D2]",  # 𐤂 → ג
        "\c[0x10903]" => "\c[0x05D3]",  # 𐤃 → ד
        "\c[0x10904]" => "\c[0x05D4]",  # 𐤄 → ה
        "\c[0x10905]" => "\c[0x05D5]",  # 𐤅 → ו
        "\c[0x10906]" => "\c[0x05D6]",  # 𐤆 → ז
        "\c[0x10907]" => "\c[0x05D7]",  # 𐤇 → ח
        "\c[0x10908]" => "\c[0x05D8]",  # 𐤈 → ט
        "\c[0x10909]" => "\c[0x05D9]",  # 𐤉 → י
        "\c[0x1090A]" => "\c[0x05DB]",  # 𐤊 → כ (not final form)
        "\c[0x1090B]" => "\c[0x05DC]",  # 𐤋 → ל
        "\c[0x1090C]" => "\c[0x05DE]",  # 𐤌 → מ (not final form)
        "\c[0x1090D]" => "\c[0x05E0]",  # 𐤍 → נ (not final form)
        "\c[0x1090E]" => "\c[0x05E1]",  # 𐤎 → ס
        "\c[0x1090F]" => "\c[0x05E2]",  # 𐤏 → ע
        "\c[0x10910]" => "\c[0x05E4]",  # 𐤐 → פ (not final form)
        "\c[0x10911]" => "\c[0x05E6]",  # 𐤑 → צ (not final form)
        "\c[0x10912]" => "\c[0x05E7]",  # 𐤒 → ק
        "\c[0x10913]" => "\c[0x05E8]",  # 𐤓 → ר
        "\c[0x10914]" => "\c[0x05E9]",  # 𐤔 → ש
        "\c[0x10915]" => "\c[0x05EA]",  # 𐤕 → ת
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
            if $char.ord >= 0x0591 && $char.ord <= 0x05C7 {
                # Don't add vowel points to output
                $i++;
            } else {
                # Keep non-Hebrew characters as is
                $result ~= $char;
                $i++;
            }
        }
    }
    
    return $result;
}