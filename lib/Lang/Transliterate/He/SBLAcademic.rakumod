use Lang::Transliterate;

unit class Lang::Transliterate::He::SBLAcademic does Lang::Transliterate::Transliterator;

# SBL Academic Transliteration for Hebrew
# Based on the Wikipedia comparison table and SBL Handbook of Style
my %base-mappings = (
    # Hebrew to Latin - SBL Academic system
    # Consonants
    "\c[0x05D0]" => 'ʾ',      # א ʾālep̄
    "\c[0x05D1]" => 'ḇ',      # ב bêt (without dagesh)
    "\c[0x05D1]\c[0x05BC]" => 'b',  # בּ bêt (with dagesh)
    "\c[0x05D2]" => 'ḡ',      # ג gîmel (without dagesh)
    "\c[0x05D2]\c[0x05BC]" => 'g',  # גּ gîmel (with dagesh)
    "\c[0x05D3]" => 'ḏ',      # ד dālet (without dagesh)
    "\c[0x05D3]\c[0x05BC]" => 'd',  # דּ dālet (with dagesh)
    "\c[0x05D4]" => 'h',      # ה hê
    "\c[0x05D4]\c[0x05BC]" => 'h',  # הּ hê with dagesh
    "\c[0x05D5]" => 'w',      # ו wāw
    "\c[0x05D5]\c[0x05BC]" => 'w',  # וּ wāw with dagesh (not shuruk)
    "\c[0x05D6]" => 'z',      # ז zayin
    "\c[0x05D6]\c[0x05BC]" => 'z',  # זּ zayin with dagesh
    "\c[0x05D7]" => 'ḥ',      # ח ḥêt
    "\c[0x05D8]" => 'ṭ',      # ט ṭêt
    "\c[0x05D8]\c[0x05BC]" => 'ṭ',  # טּ ṭêt with dagesh
    "\c[0x05D9]" => 'y',      # י yôd
    "\c[0x05D9]\c[0x05BC]" => 'y',  # יּ yôd with dagesh
    "\c[0x05DA]" => 'ḵ',      # ך kāp sofit (without dagesh)
    "\c[0x05DB]" => 'ḵ',      # כ kāp (without dagesh)
    "\c[0x05DA]\c[0x05BC]" => 'k',  # ךּ kāp sofit (with dagesh)
    "\c[0x05DB]\c[0x05BC]" => 'k',  # כּ kāp (with dagesh)
    "\c[0x05DC]" => 'l',      # ל lāmed
    "\c[0x05DC]\c[0x05BC]" => 'l',  # לּ lāmed with dagesh
    "\c[0x05DD]" => 'm',      # ם mêm sofit
    "\c[0x05DE]" => 'm',      # מ mêm
    "\c[0x05DE]\c[0x05BC]" => 'm',  # מּ mêm with dagesh
    "\c[0x05DF]" => 'n',      # ן nûn sofit
    "\c[0x05E0]" => 'n',      # נ nûn
    "\c[0x05E0]\c[0x05BC]" => 'n',  # נּ nûn with dagesh
    "\c[0x05E1]" => 's',      # ס sāmek
    "\c[0x05E1]\c[0x05BC]" => 's',  # סּ sāmek with dagesh
    "\c[0x05E2]" => 'ʿ',      # ע ʿayin
    "\c[0x05E3]" => 'p̄',      # ף pê sofit (without dagesh)
    "\c[0x05E4]" => 'p̄',      # פ pê (without dagesh)
    "\c[0x05E3]\c[0x05BC]" => 'p',  # ףּ pê sofit (with dagesh - rare)
    "\c[0x05E4]\c[0x05BC]" => 'p',  # פּ pê (with dagesh)
    "\c[0x05E5]" => 'ṣ',      # ץ ṣādê sofit
    "\c[0x05E6]" => 'ṣ',      # צ ṣādê
    "\c[0x05E6]\c[0x05BC]" => 'ṣ',  # צּ ṣādê with dagesh
    "\c[0x05E7]" => 'q',      # ק qôp̄
    "\c[0x05E7]\c[0x05BC]" => 'q',  # קּ qôp̄ with dagesh
    "\c[0x05E8]" => 'r',      # ר rêš
    "\c[0x05E8]\c[0x05BC]" => 'r',  # רּ rêš with dagesh
    "\c[0x05E9]\c[0x05C1]" => 'š',  # שׁ šîn
    "\c[0x05E9]\c[0x05BC]\c[0x05C1]" => 'š', # שּׁ šîn with dagesh
    "\c[0x05E9]\c[0x05C2]" => 'ś',  # שׂ śîn
    "\c[0x05E9]\c[0x05BC]\c[0x05C2]" => 'ś', # שּׂ śîn with dagesh
    "\c[0x05EA]" => 'ṯ',      # ת tāw (without dagesh)
    "\c[0x05EA]\c[0x05BC]" => 't',  # תּ tāw (with dagesh)
    
    # Basic shin/sin without dots defaults to shin
    "\c[0x05E9]" => 'š',      # ש shin/sin without dots
    
    # Vowels - SBL Academic includes basic vowel markings
    # Note: Hebrew vowels are diacritics, shown here on ט as placeholder
    "\c[0x05D8]\c[0x05B0]" => 'ĕ',  # טְ vocal šĕwăʾ
    "\c[0x05D7]\c[0x05B1]" => 'ĕ',  # חֱ ḥāṭēp sĕgŏl
    "\c[0x05D7]\c[0x05B2]" => 'ă',  # חֲ ḥāṭēp pataḥ
    "\c[0x05D7]\c[0x05B3]" => 'ŏ',  # חֳ ḥāṭēp qāmeṣ
    "\c[0x05D8]\c[0x05B4]" => 'i',  # טִ short ḥîreq
    "\c[0x05D8]\c[0x05B4]\c[0x05D9]" => 'ī', # טִי ḥîreq yôd
    "\c[0x05D8]\c[0x05B5]" => 'ē',  # טֵ ṣērê
    "\c[0x05D8]\c[0x05B5]\c[0x05D9]" => 'ê', # טֵי ṣērê yôd
    "\c[0x05D8]\c[0x05B6]" => 'e',  # טֶ sĕgōl
    "\c[0x05D8]\c[0x05B6]\c[0x05D9]" => 'e', # טֶי sĕgōl yôd
    "\c[0x05D8]\c[0x05B7]" => 'a',  # טַ pataḥ
    "\c[0x05D8]\c[0x05B7]\c[0x05D9]" => 'ai', # טַי pataḥ yôd
    "\c[0x05D8]\c[0x05B8]" => 'ā',  # טָ qāmeṣ (as long a)
    "\c[0x05D8]\c[0x05B8]" => 'o',  # טָ qāmeṣ ḥāṭûp (as short o)
    "\c[0x05D8]\c[0x05B8]\c[0x05D9]" => 'āi', # טָי qāmeṣ yôd
    "\c[0x05D8]\c[0x05B9]" => 'ō',  # טֹ ḥōlem
    "\c[0x05D5]\c[0x05B9]" => 'ô',  # וֹ full ḥōlem
    "\c[0x05D8]\c[0x05B9]\c[0x05D9]" => 'ōi', # טֹי ḥōlem yôd
    "\c[0x05D8]\c[0x05BA]" => 'u',  # טֻ short qibbûṣ
    "\c[0x05D8]\c[0x05BB]" => 'ū',  # טֻ long qibbûṣ
    "\c[0x05D8]\c[0x05BA]\c[0x05D9]" => 'ui', # טֻי qibbûṣ yôd
    "\c[0x05D8]\c[0x05D5]\c[0x05BC]" => 'û', # טוּ šûreq
    "\c[0x05D8]\c[0x05D5]\c[0x05BC]\c[0x05D9]" => 'ûi', # טוּי šûreq yôd
    "\c[0x05D8]\c[0x05B8]\c[0x05D4]" => 'â', # טָה final qāmeṣ hê
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # SBL Academic reverse mappings
    return (
        # Vowel combinations first (longer patterns)
        'ōi' => "\c[0x05D8]\c[0x05B9]\c[0x05D9]",  # טֹי
        'ûi' => "\c[0x05D8]\c[0x05D5]\c[0x05BC]\c[0x05D9]", # טוּי
        'ui' => "\c[0x05D8]\c[0x05BA]\c[0x05D9]",  # טֻי
        'āi' => "\c[0x05D8]\c[0x05B8]\c[0x05D9]",  # טָי
        'ai' => "\c[0x05D8]\c[0x05B7]\c[0x05D9]",  # טַי
        'ī' => "\c[0x05D8]\c[0x05B4]\c[0x05D9]",   # טִי
        'ê' => "\c[0x05D8]\c[0x05B5]\c[0x05D9]",   # טֵי
        'ô' => "\c[0x05D5]\c[0x05B9]",              # וֹ
        'â' => "\c[0x05D8]\c[0x05B8]\c[0x05D4]",   # טָה
        'û' => "\c[0x05D8]\c[0x05D5]\c[0x05BC]",   # טוּ
        
        # Vowels
        'ĕ' => "\c[0x05D8]\c[0x05B0]",  # טְ
        'ă' => "\c[0x05D7]\c[0x05B2]",  # חֲ
        'ŏ' => "\c[0x05D7]\c[0x05B3]",  # חֳ
        'i' => "\c[0x05D8]\c[0x05B4]",  # טִ (could also be yod)
        'ē' => "\c[0x05D8]\c[0x05B5]",  # טֵ
        'e' => "\c[0x05D8]\c[0x05B6]",  # טֶ
        'a' => "\c[0x05D8]\c[0x05B7]",  # טַ
        'ā' => "\c[0x05D8]\c[0x05B8]",  # טָ
        'o' => "\c[0x05D8]\c[0x05B8]",  # טָ (qamets khatuf)
        'ō' => "\c[0x05D8]\c[0x05B9]",  # טֹ
        'u' => "\c[0x05D8]\c[0x05BA]",  # טֻ
        'ū' => "\c[0x05D8]\c[0x05BB]",  # טֻ (long)
        
        # Consonants
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