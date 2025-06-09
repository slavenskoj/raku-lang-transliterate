use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Fa::EI does Lang::Transliterate::Transliterator;

# Persian Encyclopaedia of Islam (EI) Transliteration
# Based on the Encyclopaedia of Islam transliteration standard from 2012

my %base-mappings = (
    # Basic Persian letters (using hex codes to avoid Unicode issues)
    "\c[0x0627]" => 'ā',      # alef (ا) - long a, no hamza at word beginning
    "\c[0x0628]" => 'b',      # be (ب)
    "\c[0x067E]" => 'p',      # pe (پ)
    "\c[0x062A]" => 't',      # te (ت)
    "\c[0x062B]" => 'ṯ',      # se (ث) - t with dot below
    "\c[0x062C]" => 'j',      # jim (ج)
    "\c[0x0686]" => 'č',      # che (چ) - c with caron
    "\c[0x062D]" => 'ḥ',      # he jimi (ح) - h with dot below
    "\c[0x062E]" => 'ḵ',      # khe (خ) - k with line below
    "\c[0x062F]" => 'd',      # dal (د)
    "\c[0x0630]" => 'ḏ',      # zal (ذ) - d with line below
    "\c[0x0631]" => 'r',      # re (ر)
    "\c[0x0632]" => 'z',      # ze (ز)
    "\c[0x0698]" => 'ž',      # zhe (ژ) - z with caron
    "\c[0x0633]" => 's',      # sin (س)
    "\c[0x0634]" => 'š',      # shin (ش) - s with caron
    "\c[0x0635]" => 'ṣ',      # sad (ص) - s with dot below
    "\c[0x0636]" => 'ż',      # zad (ض) - z with dot above
    "\c[0x0637]" => 'ṭ',      # ta (ط) - t with dot below
    "\c[0x0638]" => 'ẓ',      # za (ظ) - z with dot below
    "\c[0x0639]" => 'ʻ',      # eyn (ع) - turned comma
    "\c[0x063A]" => 'ḡ',      # gheyn (غ) - g with macron above
    "\c[0x0641]" => 'f',      # fe (ف)
    "\c[0x0642]" => 'ḳ',      # qaf (ق) - k with dot below
    "\c[0x06A9]" => 'k',      # kaf (ک)
    "\c[0x06AF]" => 'g',      # gaf (گ)
    "\c[0x0644]" => 'l',      # lam (ل)
    "\c[0x0645]" => 'm',      # mim (م)
    "\c[0x0646]" => 'n',      # nun (ن)
    "\c[0x0648]" => 'v',      # vav (و) - as consonant v (w in Dari)
    "\c[0x0647]" => 'h',      # he (ه)
    "\c[0x06CC]" => 'y',      # ye (ی)
    
    # Hamza forms
    "\c[0x0621]" => 'ʼ',      # hamza (ء) - apostrophe
    "\c[0x0623]" => 'ʼ',      # alef with hamza above (أ)
    "\c[0x0624]" => 'ʼ',      # vav with hamza above (ؤ)
    "\c[0x0626]" => 'ʼ',      # ye with hamza above (ئ)
    
    # Special forms
    "\c[0x0622]" => 'ā',      # alef madda (آ)
    "\c[0x0629]" => 'h',      # te marbuta (ة) - h (or t when used as ت)
    
    # Short vowels (diacritics - rarely written)
    "\c[0x064E]" => 'a',      # fatha (َ) - short a
    "\c[0x064F]" => 'u',      # zamma (ُ) - short u (not o)
    "\c[0x0650]" => 'e',      # kasra (ِ) - short e
    
    # Long vowels and diphthongs
    "\c[0x064E]\c[0x0627]" => 'ā',     # fatha + alef → ā
    "\c[0x064F]\c[0x0648]" => 'u',     # zamma + vav → u (ō in Dari)
    "\c[0x0650]\c[0x06CC]" => 'i',     # kasra + ye → i (ē in Dari)
    "\c[0x064E]\c[0x0648]" => 'ow',    # fatha + vav → ow (aw in Dari)
    "\c[0x064E]\c[0x06CC]" => 'ey',    # fatha + ye → ey (ay in Dari)
    
    # Special Persian vowel combinations
    "\c[0x0648]\c[0x064F]" => 'o',     # vav with zamma → o
    "\c[0x064E]\c[0x06CC]" => 'ā',     # fatha + ye at word end → ā
    "\c[0x06CC]\c[0x0670]" => 'ā',     # ye + superscript alef → ā
    
    # Final ye forms
    "\c[0x06CC]" => '–e',     # ye at word end preceded by consonant → -e
    "\c[0x06C0]" => '–ye',    # he ye (ۀ) → -ye
    
    # Digits
    "\c[0x06F0]" => '0',      # Persian zero (۰)
    "\c[0x06F1]" => '1',      # Persian one (۱)
    "\c[0x06F2]" => '2',      # Persian two (۲)
    "\c[0x06F3]" => '3',      # Persian three (۳)
    "\c[0x06F4]" => '4',      # Persian four (۴)
    "\c[0x06F5]" => '5',      # Persian five (۵)
    "\c[0x06F6]" => '6',      # Persian six (۶)
    "\c[0x06F7]" => '7',      # Persian seven (۷)
    "\c[0x06F8]" => '8',      # Persian eight (۸)
    "\c[0x06F9]" => '9',      # Persian nine (۹)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Persian EI reverse mappings
    return (
        # Multi-character mappings first
        '–ye' => "\c[0x06C0]",
        '–e' => "\c[0x06CC]",
        'ow' => "\c[0x064E]\c[0x0648]",
        'ey' => "\c[0x064E]\c[0x06CC]",
        
        # Single characters with diacritics
        'ā' => "\c[0x0627]",
        'ṯ' => "\c[0x062B]",
        'č' => "\c[0x0686]",
        'ḥ' => "\c[0x062D]",
        'ḵ' => "\c[0x062E]",
        'ḏ' => "\c[0x0630]",
        'ž' => "\c[0x0698]",
        'š' => "\c[0x0634]",
        'ṣ' => "\c[0x0635]",
        'ż' => "\c[0x0636]",
        'ṭ' => "\c[0x0637]",
        'ẓ' => "\c[0x0638]",
        'ʻ' => "\c[0x0639]",
        'ḡ' => "\c[0x063A]",
        'ḳ' => "\c[0x0642]",
        'ʼ' => "\c[0x0621]",
        'i' => "\c[0x0650]\c[0x06CC]",
        'u' => "\c[0x064F]\c[0x0648]",
        
        # Basic letters
        'b' => "\c[0x0628]",
        'p' => "\c[0x067E]",
        't' => "\c[0x062A]",
        'j' => "\c[0x062C]",
        'd' => "\c[0x062F]",
        'r' => "\c[0x0631]",
        'z' => "\c[0x0632]",
        's' => "\c[0x0633]",
        'f' => "\c[0x0641]",
        'k' => "\c[0x06A9]",
        'g' => "\c[0x06AF]",
        'l' => "\c[0x0644]",
        'm' => "\c[0x0645]",
        'n' => "\c[0x0646]",
        'v' => "\c[0x0648]",
        'h' => "\c[0x0647]",
        'y' => "\c[0x06CC]",
        'a' => "\c[0x064E]",
        'e' => "\c[0x0650]",
        
        # Digits
        '0' => "\c[0x06F0]",
        '1' => "\c[0x06F1]",
        '2' => "\c[0x06F2]",
        '3' => "\c[0x06F3]",
        '4' => "\c[0x06F4]",
        '5' => "\c[0x06F5]",
        '6' => "\c[0x06F6]",
        '7' => "\c[0x06F7]",
        '8' => "\c[0x06F8]",
        '9' => "\c[0x06F9]",
    );
}