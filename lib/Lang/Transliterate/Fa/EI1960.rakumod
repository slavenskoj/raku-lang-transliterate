use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Fa::EI1960 does Lang::Transliterate::Transliterator;

# Persian Encyclopaedia of Islam (EI) Transliteration - 1960 edition
# Based on the Encyclopaedia of Islam transliteration standard from 1960
# Uses underlined digraphs like Arabic EI

my %base-mappings = (
    # Basic Persian letters (using hex codes to avoid Unicode issues)
    "\c[0x0627]" => 'ā',      # alef (ا) - long a, no hamza at word beginning
    "\c[0x0628]" => 'b',      # be (ب)
    "\c[0x067E]" => 'p',      # pe (پ)
    "\c[0x062A]" => 't',      # te (ت)
    "\c[0x062B]" => 't͟h',     # se (ث) - underlined digraph
    "\c[0x062C]" => 'd͟j',     # jim (ج) - underlined digraph
    "\c[0x0686]" => 'č',      # che (چ) - c with caron
    "\c[0x062D]" => 'ḥ',      # he jimi (ح) - h with dot below
    "\c[0x062E]" => 'k͟h',     # khe (خ) - underlined digraph
    "\c[0x062F]" => 'd',      # dal (د)
    "\c[0x0630]" => 'd͟h',     # zal (ذ) - underlined digraph
    "\c[0x0631]" => 'r',      # re (ر)
    "\c[0x0632]" => 'z',      # ze (ز)
    "\c[0x0698]" => 'z͟h',     # zhe (ژ) - underlined digraph
    "\c[0x0633]" => 's',      # sin (س)
    "\c[0x0634]" => 's͟h',     # shin (ش) - underlined digraph
    "\c[0x0635]" => 'ṣ',      # sad (ص) - s with dot below
    "\c[0x0636]" => 'ḍ',      # zad (ض) - d with dot below
    "\c[0x0637]" => 'ṭ',      # ta (ط) - t with dot below
    "\c[0x0638]" => 'ẓ',      # za (ظ) - z with dot below
    "\c[0x0639]" => 'ʻ',      # eyn (ع) - turned comma
    "\c[0x063A]" => 'g͟h',     # gheyn (غ) - underlined digraph
    "\c[0x0641]" => 'f',      # fe (ف)
    "\c[0x0642]" => 'ḳ',      # qaf (ق) - k with dot below
    "\c[0x06A9]" => 'k',      # kaf (ک)
    "\c[0x06AF]" => 'g',      # gaf (گ)
    "\c[0x0644]" => 'l',      # lam (ل)
    "\c[0x0645]" => 'm',      # mim (م)
    "\c[0x0646]" => 'n',      # nun (ن)
    "\c[0x0648]" => 'v',      # vav (و) - as consonant v
    "\c[0x0647]" => 'h',      # he (ه)
    "\c[0x06CC]" => 'y',      # ye (ی)
    
    # Hamza forms
    "\c[0x0621]" => 'ʼ',      # hamza (ء) - apostrophe
    "\c[0x0623]" => 'ʼ',      # alef with hamza above (أ)
    "\c[0x0624]" => 'ʼ',      # vav with hamza above (ؤ)
    "\c[0x0626]" => 'ʼ',      # ye with hamza above (ئ)
    
    # Special forms
    "\c[0x0622]" => 'ā',      # alef madda (آ) - or ʼā after vowel
    "\c[0x0629]" => 't',      # te marbuta (ة) - t when used as ت
    
    # Short vowels (diacritics - rarely written)
    "\c[0x064E]" => 'a',      # fatha (َ) - short a
    "\c[0x064F]" => 'u',      # zamma (ُ) - short u
    "\c[0x0650]" => 'e',      # kasra (ِ) - short e
    
    # Long vowels and diphthongs
    "\c[0x064E]\c[0x0627]" => 'ā',     # fatha + alef → ā
    "\c[0x064F]\c[0x0648]" => 'ū',     # zamma + vav → ū
    "\c[0x0650]\c[0x06CC]" => 'ī',     # kasra + ye → ī
    "\c[0x064E]\c[0x0648]" => 'aw',    # fatha + vav → aw (diphthong)
    "\c[0x064E]\c[0x06CC]" => 'ay',    # fatha + ye → ay (diphthong)
    
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
    # Persian EI 1960 reverse mappings
    return (
        # Multi-character mappings first (underlined digraphs)
        '–ye' => "\c[0x06C0]",
        '–e' => "\c[0x06CC]",
        't͟h' => "\c[0x062B]",
        'd͟j' => "\c[0x062C]",
        'k͟h' => "\c[0x062E]",
        'd͟h' => "\c[0x0630]",
        'z͟h' => "\c[0x0698]",
        's͟h' => "\c[0x0634]",
        'g͟h' => "\c[0x063A]",
        'aw' => "\c[0x064E]\c[0x0648]",
        'ay' => "\c[0x064E]\c[0x06CC]",
        'ʼā' => "\c[0x0622]",
        
        # Single characters with diacritics
        'ā' => "\c[0x0627]",
        'č' => "\c[0x0686]",
        'ḥ' => "\c[0x062D]",
        'ṣ' => "\c[0x0635]",
        'ḍ' => "\c[0x0636]",
        'ṭ' => "\c[0x0637]",
        'ẓ' => "\c[0x0638]",
        'ʻ' => "\c[0x0639]",
        'ḳ' => "\c[0x0642]",
        'ʼ' => "\c[0x0621]",
        'ī' => "\c[0x0650]\c[0x06CC]",
        'ū' => "\c[0x064F]\c[0x0648]",
        
        # Basic letters
        'b' => "\c[0x0628]",
        'p' => "\c[0x067E]",
        't' => "\c[0x062A]",
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
        'u' => "\c[0x064F]",
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