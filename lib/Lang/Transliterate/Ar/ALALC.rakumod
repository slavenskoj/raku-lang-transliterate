use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Ar::ALALC does Lang::Transliterate::Transliterator;

# Arabic ALA-LC Transliteration
# Based on the ALA-LC romanization standard for Arabic

my %base-mappings = (
    # Basic Arabic letters
    "\c[0x0621]" => 'ʼ',      # hamza (ء)
    "\c[0x0627]" => 'ā',      # alif (ا)
    "\c[0x0628]" => 'b',      # ba (ب)
    "\c[0x062A]" => 't',      # ta (ت)
    "\c[0x062B]" => 'th',     # tha (ث)
    "\c[0x062C]" => 'j',      # jim (ج)
    "\c[0x062D]" => 'ḥ',      # ha (ح)
    "\c[0x062E]" => 'kh',     # kha (خ)
    "\c[0x062F]" => 'd',      # dal (د)
    "\c[0x0630]" => 'dh',     # dhal (ذ)
    "\c[0x0631]" => 'r',      # ra (ر)
    "\c[0x0632]" => 'z',      # zay (ز)
    "\c[0x0633]" => 's',      # sin (س)
    "\c[0x0634]" => 'sh',     # shin (ش)
    "\c[0x0635]" => 'ṣ',      # sad (ص)
    "\c[0x0636]" => 'ḍ',      # dad (ض)
    "\c[0x0637]" => 'ṭ',      # ta (ط)
    "\c[0x0638]" => 'ẓ',      # za (ظ)
    "\c[0x0639]" => 'ʻ',      # ayn (ع)
    "\c[0x063A]" => 'gh',     # ghayn (غ)
    "\c[0x0641]" => 'f',      # fa (ف)
    "\c[0x0642]" => 'q',      # qaf (ق)
    "\c[0x0643]" => 'k',      # kaf (ك)
    "\c[0x0644]" => 'l',      # lam (ل)
    "\c[0x0645]" => 'm',      # mim (م)
    "\c[0x0646]" => 'n',      # nun (ن)
    "\c[0x0647]" => 'h',      # ha (ه)
    "\c[0x0648]" => 'w',      # waw (و)
    "\c[0x064A]" => 'y',      # ya (ي)
    
    # Special forms
    "\c[0x0622]" => 'ʼā',     # alif madda (آ)
    "\c[0x0629]" => 'h',      # ta marbuta (ة)
    "\c[0x0649]" => 'á',      # alif maqsura (ى) - with acute accent
    
    # Definite article
    "\c[0x0627]\c[0x0644]" => 'al-',   # definite article (ال)
    
    # Diacritics and short vowels
    "\c[0x064E]" => 'a',      # fatha (َ)
    "\c[0x0650]" => 'i',      # kasra (ِ)
    "\c[0x064F]" => 'u',      # damma (ُ)
    "\c[0x064B]" => 'an',     # fathatan (ً)
    "\c[0x064D]" => 'in',     # kasratan (ٍ)
    "\c[0x064C]" => 'un',     # dammatan (ٌ)
    "\c[0x0652]" => '',       # sukun (ْ)
    "\c[0x0651]" => '',       # shadda (ّ)
    
    # Hamza forms
    "\c[0x0624]" => 'ʼu',     # hamza on waw (ؤ)
    "\c[0x0626]" => 'ʼi',     # hamza on ya (ئ)
    "\c[0x0623]" => 'ʼa',     # hamza on alif (أ)
    "\c[0x0625]" => 'ʼi',     # hamza under alif (إ)
    
    # Long vowels (combinations)
    "\c[0x064E]\c[0x0627]" => 'ā',     # fatha + alif
    "\c[0x0650]\c[0x064A]" => 'ī',     # kasra + ya
    "\c[0x064F]\c[0x0648]" => 'ū',     # damma + waw
    "\c[0x064E]\c[0x064A]" => 'ay',    # fatha + ya (diphthong)
    "\c[0x064E]\c[0x0648]" => 'aw',    # fatha + waw (diphthong)
    
    # Digits
    "\c[0x0660]" => '0',      # (٠)
    "\c[0x0661]" => '1',      # (١)
    "\c[0x0662]" => '2',      # (٢)
    "\c[0x0663]" => '3',      # (٣)
    "\c[0x0664]" => '4',      # (٤)
    "\c[0x0665]" => '5',      # (٥)
    "\c[0x0666]" => '6',      # (٦)
    "\c[0x0667]" => '7',      # (٧)
    "\c[0x0668]" => '8',      # (٨)
    "\c[0x0669]" => '9',      # (٩)
    
    # Punctuation
    "\c[0x061F]" => '?',      # Arabic question mark (؟)
    "\c[0x061B]" => ';',      # Arabic semicolon (؛)
    "\c[0x060C]" => ',',      # Arabic comma (،)
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Arabic ALA-LC reverse mappings
    return (
        # Multi-character mappings first
        'al-' => "\c[0x0627]\c[0x0644]",
        'th' => "\c[0x062B]",
        'kh' => "\c[0x062E]",
        'dh' => "\c[0x0630]",
        'sh' => "\c[0x0634]",
        'gh' => "\c[0x063A]",
        'ʼā' => "\c[0x0622]",
        'ʼa' => "\c[0x0623]",
        'ʼi' => "\c[0x0625]",
        'ʼu' => "\c[0x0624]",
        'an' => "\c[0x064B]",
        'in' => "\c[0x064D]",
        'un' => "\c[0x064C]",
        'ay' => "\c[0x064E]\c[0x064A]",
        'aw' => "\c[0x064E]\c[0x0648]",
        
        # Single characters with diacritics
        'ā' => "\c[0x0627]",
        'ḥ' => "\c[0x062D]",
        'ṣ' => "\c[0x0635]",
        'ḍ' => "\c[0x0636]",
        'ṭ' => "\c[0x0637]",
        'ẓ' => "\c[0x0638]",
        'ʻ' => "\c[0x0639]",
        'ʼ' => "\c[0x0621]",
        'á' => "\c[0x0649]",
        'ī' => "\c[0x0650]\c[0x064A]",
        'ū' => "\c[0x064F]\c[0x0648]",
        
        # Basic letters
        'b' => "\c[0x0628]",
        't' => "\c[0x062A]",
        'j' => "\c[0x062C]",
        'd' => "\c[0x062F]",
        'r' => "\c[0x0631]",
        'z' => "\c[0x0632]",
        's' => "\c[0x0633]",
        'f' => "\c[0x0641]",
        'q' => "\c[0x0642]",
        'k' => "\c[0x0643]",
        'l' => "\c[0x0644]",
        'm' => "\c[0x0645]",
        'n' => "\c[0x0646]",
        'h' => "\c[0x0647]",
        'w' => "\c[0x0648]",
        'y' => "\c[0x064A]",
        'a' => "\c[0x064E]",
        'i' => "\c[0x0650]",
        'u' => "\c[0x064F]",
        
        # Digits
        '0' => "\c[0x0660]",
        '1' => "\c[0x0661]",
        '2' => "\c[0x0662]",
        '3' => "\c[0x0663]",
        '4' => "\c[0x0664]",
        '5' => "\c[0x0665]",
        '6' => "\c[0x0666]",
        '7' => "\c[0x0667]",
        '8' => "\c[0x0668]",
        '9' => "\c[0x0669]",
        
        # Punctuation
        '?' => "\c[0x061F]",
        ';' => "\c[0x061B]",
        ',' => "\c[0x060C]",
    );
}