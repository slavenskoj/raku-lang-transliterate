use Lang::Transliterate;

unit class Lang::Transliterate::He::ISO259 does Lang::Transliterate::Transliterator;

# ISO 259 Transliteration for Hebrew
# Based on the Wikipedia comparison table
my %base-mappings = (
    # Hebrew to Latin - ISO 259 system
    # Consonants
    "\c[0x05D0]" => 'ʾ',      # א ʾālep̄
    "\c[0x05D1]" => 'ḇ',      # ב ḇēṯ (without dagesh)
    "\c[0x05D1]\c[0x05BC]" => 'b',  # בּ bēṯ (with dagesh)
    "\c[0x05D2]" => 'ḡ',      # ג ḡīmel (without dagesh)
    "\c[0x05D2]\c[0x05BC]" => 'g',  # גּ gīmel (with dagesh)
    "\c[0x05D3]" => 'ḏ',      # ד ḏāleṯ (without dagesh)
    "\c[0x05D3]\c[0x05BC]" => 'd',  # דּ dāleṯ (with dagesh)
    "\c[0x05D4]" => 'h',      # ה hē
    "\c[0x05D4]\c[0x05BC]" => 'h',  # הּ hē with dagesh
    "\c[0x05D5]" => 'w',      # ו wāw
    "\c[0x05D5]\c[0x05BC]" => 'w',  # וּ wāw with dagesh (not shuruk)
    "\c[0x05D6]" => 'z',      # ז záyin
    "\c[0x05D6]\c[0x05BC]" => 'z',  # זּ záyin with dagesh
    "\c[0x05D7]" => 'ḥ',      # ח ḥēṯ
    "\c[0x05D8]" => 'ṭ',      # ט ṭēṯ
    "\c[0x05D8]\c[0x05BC]" => 'ṭ',  # טּ ṭēṯ with dagesh
    "\c[0x05D9]" => 'y',      # י yōḏ
    "\c[0x05D9]\c[0x05BC]" => 'y',  # יּ yōḏ with dagesh
    "\c[0x05DA]" => 'ḵ',      # ך ḵāp̄ sofit (without dagesh)
    "\c[0x05DB]" => 'ḵ',      # כ ḵāp̄ (without dagesh)
    "\c[0x05DA]\c[0x05BC]" => 'k',  # ךּ kāp̄ sofit (with dagesh)
    "\c[0x05DB]\c[0x05BC]" => 'k',  # כּ kāp̄ (with dagesh)
    "\c[0x05DC]" => 'l',      # ל lāmeḏ
    "\c[0x05DC]\c[0x05BC]" => 'l',  # לּ lāmeḏ with dagesh
    "\c[0x05DD]" => 'm',      # ם mēm sofit
    "\c[0x05DE]" => 'm',      # מ mēm
    "\c[0x05DE]\c[0x05BC]" => 'm',  # מּ mēm with dagesh
    "\c[0x05DF]" => 'n',      # ן nūn sofit
    "\c[0x05E0]" => 'n',      # נ nūn
    "\c[0x05E0]\c[0x05BC]" => 'n',  # נּ nūn with dagesh
    "\c[0x05E1]" => 's',      # ס sāmeḵ
    "\c[0x05E1]\c[0x05BC]" => 's',  # סּ sāmeḵ with dagesh
    "\c[0x05E2]" => 'ʿ',      # ע ʿáyin
    "\c[0x05E3]" => 'p̄',      # ף p̄ē sofit (without dagesh)
    "\c[0x05E4]" => 'p̄',      # פ p̄ē (without dagesh)
    "\c[0x05E3]\c[0x05BC]" => 'p',  # ףּ pē sofit (with dagesh - rare)
    "\c[0x05E4]\c[0x05BC]" => 'p',  # פּ pē (with dagesh)
    "\c[0x05E5]" => 'ṣ',      # ץ ṣāḏē sofit
    "\c[0x05E6]" => 'ṣ',      # צ ṣāḏē
    "\c[0x05E6]\c[0x05BC]" => 'ṣ',  # צּ ṣāḏē with dagesh
    "\c[0x05E7]" => 'q',      # ק qōp̄
    "\c[0x05E7]\c[0x05BC]" => 'q',  # קּ qōp̄ with dagesh
    "\c[0x05E8]" => 'r',      # ר rēš
    "\c[0x05E8]\c[0x05BC]" => 'r',  # רּ rēš with dagesh
    "\c[0x05E9]\c[0x05C1]" => 'š',  # שׁ šīn
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => 'š', # שּׁ šīn with dagesh
    "\c[0x05E9]\c[0x05C2]" => 'ś',  # שׂ śīn
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => 'ś', # שּׂ śīn with dagesh
    "\c[0x05EA]" => 'ṯ',      # ת ṯāw (without dagesh)
    "\c[0x05EA]\c[0x05BC]" => 't',  # תּ tāw (with dagesh)
    
    # Basic shin/sin without dots defaults to shin
    "\c[0x05E9]" => 'š',      # ש shin/sin without dots
    
    # Double consonants with dagesh hazak (chazaq)
    "\c[0x05D1]\c[0x05BC]\c[0x05BC]" => 'bb',  # בּּ bēṯ ḥāzāq
    "\c[0x05D2]\c[0x05BC]\c[0x05BC]" => 'gg',  # גּּ gīmel ḥāzāq
    "\c[0x05D3]\c[0x05BC]\c[0x05BC]" => 'dd',  # דּּ dāleṯ ḥāzāq
    "\c[0x05D5]\c[0x05BC]\c[0x05BC]" => 'ww',  # וּּ wāw ḥāzāq
    "\c[0x05D6]\c[0x05BC]\c[0x05BC]" => 'zz',  # זּּ záyin ḥāzāq
    "\c[0x05D8]\c[0x05BC]\c[0x05BC]" => 'ṭṭ',  # טּּ ṭēṯ ḥāzāq
    "\c[0x05D9]\c[0x05BC]\c[0x05BC]" => 'yy',  # יּּ yōḏ ḥāzāq
    "\c[0x05DB]\c[0x05BC]\c[0x05BC]" => 'kk',  # כּּ kāp̄ ḥāzāq
    "\c[0x05DC]\c[0x05BC]\c[0x05BC]" => 'll',  # לּּ lāmeḏ ḥāzāq
    "\c[0x05DE]\c[0x05BC]\c[0x05BC]" => 'mm',  # מּּ mēm ḥāzāq
    "\c[0x05E0]\c[0x05BC]\c[0x05BC]" => 'nn',  # נּּ nūn ḥāzāq
    "\c[0x05E1]\c[0x05BC]\c[0x05BC]" => 'ss',  # סּּ sāmeḵ ḥāzāq
    "\c[0x05E4]\c[0x05BC]\c[0x05BC]" => 'pp',  # פּּ pē ḥāzāq
    "\c[0x05E6]\c[0x05BC]\c[0x05BC]" => 'ṣṣ',  # צּּ ṣāḏē ḥāzāq
    "\c[0x05E7]\c[0x05BC]\c[0x05BC]" => 'qq',  # קּּ qōp̄ ḥāzāq
    "\c[0x05E8]\c[0x05BC]\c[0x05BC]" => 'rr',  # רּּ rēš ḥāzāq
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]\c[0x05BC]" => 'šš', # שּׁשּׁ šīn ḥāzāq
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]\c[0x05BC]" => 'śś', # שּׂשּׂ śīn ḥāzāq
    "\c[0x05EA]\c[0x05BC]\c[0x05BC]" => 'tt',  # תּּ tāw ḥāzāq
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # ISO 259 reverse mappings
    return (
        # Multi-character mappings first
        'bb' => "\c[0x05D1]\c[0x05BC]\c[0x05BC]",  # בּּ
        'gg' => "\c[0x05D2]\c[0x05BC]\c[0x05BC]",  # גּּ
        'dd' => "\c[0x05D3]\c[0x05BC]\c[0x05BC]",  # דּּ
        'ww' => "\c[0x05D5]\c[0x05BC]\c[0x05BC]",  # וּּ
        'zz' => "\c[0x05D6]\c[0x05BC]\c[0x05BC]",  # זּּ
        'ṭṭ' => "\c[0x05D8]\c[0x05BC]\c[0x05BC]",  # טּּ
        'yy' => "\c[0x05D9]\c[0x05BC]\c[0x05BC]",  # יּּ
        'kk' => "\c[0x05DB]\c[0x05BC]\c[0x05BC]",  # כּּ
        'll' => "\c[0x05DC]\c[0x05BC]\c[0x05BC]",  # לּּ
        'mm' => "\c[0x05DE]\c[0x05BC]\c[0x05BC]",  # מּּ
        'nn' => "\c[0x05E0]\c[0x05BC]\c[0x05BC]",  # נּּ
        'ss' => "\c[0x05E1]\c[0x05BC]\c[0x05BC]",  # סּּ
        'pp' => "\c[0x05E4]\c[0x05BC]\c[0x05BC]",  # פּּ
        'ṣṣ' => "\c[0x05E6]\c[0x05BC]\c[0x05BC]",  # צּּ
        'qq' => "\c[0x05E7]\c[0x05BC]\c[0x05BC]",  # קּּ
        'rr' => "\c[0x05E8]\c[0x05BC]\c[0x05BC]",  # רּּ
        'šš' => "\c[0x05E9]\c[0x05BC]\c[0x05C1]\c[0x05BC]", # שּׁשּׁ
        'śś' => "\c[0x05E9]\c[0x05BC]\c[0x05C2]\c[0x05BC]", # שּׂשּׂ
        'tt' => "\c[0x05EA]\c[0x05BC]\c[0x05BC]",  # תּּ
        
        # Single character mappings
        'ʾ' => "\c[0x05D0]",     # א
        'b' => "\c[0x05D1]\c[0x05BC]",   # בּ
        'ḇ' => "\c[0x05D1]",     # ב
        'g' => "\c[0x05D2]\c[0x05BC]",   # גּ
        'ḡ' => "\c[0x05D2]",     # ג
        'd' => "\c[0x05D3]\c[0x05BC]",   # דּ
        'ḏ' => "\c[0x05D3]",     # ד
        'h' => "\c[0x05D4]",     # ה
        'w' => "\c[0x05D5]",     # ו
        'z' => "\c[0x05D6]",     # ז
        'ḥ' => "\c[0x05D7]",     # ח
        'ṭ' => "\c[0x05D8]",     # ט
        'y' => "\c[0x05D9]",     # י
        'k' => "\c[0x05DB]\c[0x05BC]",   # כּ
        'ḵ' => "\c[0x05DB]",     # כ
        'l' => "\c[0x05DC]",     # ל
        'm' => "\c[0x05DE]",     # מ
        'n' => "\c[0x05E0]",     # נ
        's' => "\c[0x05E1]",     # ס
        'ʿ' => "\c[0x05E2]",     # ע
        'p' => "\c[0x05E4]\c[0x05BC]",   # פּ
        'p̄' => "\c[0x05E4]",     # פ
        'ṣ' => "\c[0x05E6]",     # צ
        'q' => "\c[0x05E7]",     # ק
        'r' => "\c[0x05E8]",     # ר
        'š' => "\c[0x05E9]\c[0x05C1]",   # שׁ
        'ś' => "\c[0x05E9]\c[0x05C2]",   # שׂ
        't' => "\c[0x05EA]\c[0x05BC]",   # תּ
        'ṯ' => "\c[0x05EA]",     # ת
    );
}