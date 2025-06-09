use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Fa::ALALC does Lang::Transliterate::Transliterator;

# Persian ALA-LC Transliteration
# Based on the American Library Association - Library of Congress standard from 1997

my %base-mappings = (
    # Basic Persian letters (using hex codes to avoid Unicode issues)
    "\c[0x0627]" => 'ā',      # alef (ا) - long a, no hamza at word beginning
    "\c[0x0628]" => 'b',      # be (ب)
    "\c[0x067E]" => 'p',      # pe (پ)
    "\c[0x062A]" => 't',      # te (ت)
    "\c[0x062B]" => 's̱',      # se (ث) - s with macron below
    "\c[0x062C]" => 'j',      # jim (ج) - plain j (different from DMG)
    "\c[0x0686]" => 'ch',     # che (چ) - digraph ch
    "\c[0x062D]" => 'ḥ',      # he jimi (ح) - h with dot below
    "\c[0x062E]" => 'kh',     # khe (خ) - digraph kh
    "\c[0x062F]" => 'd',      # dal (د)
    "\c[0x0630]" => 'ẕ',      # zal (ذ) - z with macron below
    "\c[0x0631]" => 'r',      # re (ر)
    "\c[0x0632]" => 'z',      # ze (ز)
    "\c[0x0698]" => 'zh',     # zhe (ژ) - digraph zh
    "\c[0x0633]" => 's',      # sin (س)
    "\c[0x0634]" => 'sh',     # shin (ش) - digraph sh
    "\c[0x0635]" => 'ṣ',      # sad (ص) - s with dot below
    "\c[0x0636]" => 'z̤',      # zad (ض) - z with two dots below
    "\c[0x0637]" => 'ṭ',      # ta (ط) - t with dot below
    "\c[0x0638]" => 'ẓ',      # za (ظ) - z with dot below
    "\c[0x0639]" => 'ʻ',      # eyn (ع) - turned comma
    "\c[0x063A]" => 'gh',     # gheyn (غ) - digraph gh
    "\c[0x0641]" => 'f',      # fe (ف)
    "\c[0x0642]" => 'q',      # qaf (ق)
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
    "\c[0x0629]" => 'h',      # te marbuta (ة) - h in combination یة
    
    # Short vowels (diacritics - rarely written)
    "\c[0x064E]" => 'a',      # fatha (َ) - short a
    "\c[0x064F]" => 'o',      # zamma (ُ) - short o
    "\c[0x0650]" => 'i',      # kasra (ِ) - short i (different from DMG's e)
    
    # Long vowels and diphthongs
    "\c[0x064E]\c[0x0627]" => 'ā',     # fatha + alef → ā
    "\c[0x064F]\c[0x0648]" => 'ū',     # zamma + vav → ū
    "\c[0x0650]\c[0x06CC]" => 'ī',     # kasra + ye → ī
    "\c[0x064E]\c[0x0648]" => 'aw',    # fatha + vav → aw (diphthong)
    "\c[0x064E]\c[0x06CC]" => 'ay',    # fatha + ye → ay (diphthong)
    
    # Special Persian vowel combinations
    "\c[0x0648]\c[0x064F]" => 'o',     # vav with zamma → o
    "\c[0x064E]\c[0x06CC]" => 'á',     # fatha + ye at word end → á (with acute)
    "\c[0x06CC]\c[0x0670]" => 'á',     # ye + superscript alef → á
    
    # Final ye forms
    "\c[0x06CC]" => '–i',     # ye at word end preceded by consonant → -i
    "\c[0x06C0]" => '–ʼi',    # he ye (ۀ) → -ʼi
    
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
    # Persian ALA-LC reverse mappings
    return (
        # Multi-character mappings first
        '–ʼi' => "\c[0x06C0]",
        '–i' => "\c[0x06CC]",
        'ch' => "\c[0x0686]",
        'kh' => "\c[0x062E]",
        'zh' => "\c[0x0698]",
        'sh' => "\c[0x0634]",
        'gh' => "\c[0x063A]",
        'aw' => "\c[0x064E]\c[0x0648]",
        'ay' => "\c[0x064E]\c[0x06CC]",
        'ʼā' => "\c[0x0622]",
        
        # Single characters with diacritics
        'ā' => "\c[0x0627]",
        's̱' => "\c[0x062B]",
        'ḥ' => "\c[0x062D]",
        'ẕ' => "\c[0x0630]",
        'ṣ' => "\c[0x0635]",
        'z̤' => "\c[0x0636]",
        'ṭ' => "\c[0x0637]",
        'ẓ' => "\c[0x0638]",
        'ʻ' => "\c[0x0639]",
        'ʼ' => "\c[0x0621]",
        'á' => "\c[0x064E]\c[0x06CC]",
        'ī' => "\c[0x0650]\c[0x06CC]",
        'ū' => "\c[0x064F]\c[0x0648]",
        
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
        'q' => "\c[0x0642]",
        'k' => "\c[0x06A9]",
        'g' => "\c[0x06AF]",
        'l' => "\c[0x0644]",
        'm' => "\c[0x0645]",
        'n' => "\c[0x0646]",
        'v' => "\c[0x0648]",
        'h' => "\c[0x0647]",
        'y' => "\c[0x06CC]",
        'a' => "\c[0x064E]",
        'o' => "\c[0x064F]",
        'i' => "\c[0x0650]",
        
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