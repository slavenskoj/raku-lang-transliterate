use Lang::Transliterate :ALL;

unit class Lang::Transliterate::Ar::ArabTeX does Lang::Transliterate::Transliterator;

# Arabic ArabTeX Transliteration
# Based on the ArabTeX system for typesetting Arabic
# Distinctive features: uses ASCII-only characters with underscores and dots

my %base-mappings = (
    # Basic Arabic letters (using hex codes to avoid Unicode issues)
    "\c[0x0621]" => "'",      # hamza (ء) - apostrophe
    "\c[0x0627]" => 'A',      # alif (ا) - capital A
    "\c[0x0628]" => 'b',      # ba (ب)
    "\c[0x062A]" => 't',      # ta (ت)
    "\c[0x062B]" => '_t',     # tha (ث) - underscore t
    "\c[0x062C]" => '^g',     # jim (ج) - caret g
    "\c[0x062D]" => '.h',     # ha (ح) - dot h
    "\c[0x062E]" => '_h',     # kha (خ) - underscore h
    "\c[0x062F]" => 'd',      # dal (د)
    "\c[0x0630]" => '_d',     # dhal (ذ) - underscore d
    "\c[0x0631]" => 'r',      # ra (ر)
    "\c[0x0632]" => 'z',      # zay (ز)
    "\c[0x0633]" => 's',      # sin (س)
    "\c[0x0634]" => '^s',     # shin (ش) - caret s
    "\c[0x0635]" => '.s',     # sad (ص) - dot s
    "\c[0x0636]" => '.d',     # dad (ض) - dot d
    "\c[0x0637]" => '.t',     # ta (ط) - dot t
    "\c[0x0638]" => '.z',     # za (ظ) - dot z
    "\c[0x0639]" => '`',      # ayn (ع) - grave accent
    "\c[0x063A]" => '.g',     # ghayn (غ) - dot g
    "\c[0x0641]" => 'f',      # fa (ف)
    "\c[0x0642]" => 'q',      # qaf (ق)
    "\c[0x0643]" => 'k',      # kaf (ك)
    "\c[0x0644]" => 'l',      # lam (ل)
    "\c[0x0645]" => 'm',      # mim (م)
    "\c[0x0646]" => 'n',      # nun (ن)
    "\c[0x0647]" => 'h',      # ha (ه)
    "\c[0x0648]" => 'w',      # waw (و) - consonant; 'U' for long u
    "\c[0x064A]" => 'y',      # ya (ي) - consonant; 'I' for long i
    
    # Special forms
    "\c[0x0622]" => "'A",     # alif madda (آ) - apostrophe A
    "\c[0x0629]" => 'T',      # ta marbuta (ة) - capital T
    "\c[0x0649]" => '_A',     # alif maqsura (ى) - underscore A
    
    # Definite article (ArabTeX uses al-)
    "\c[0x0627]\c[0x0644]" => 'al-',   # definite article (ال)
    
    # Diacritics and short vowels
    "\c[0x064E]" => 'a',      # fatha (َ)
    "\c[0x0650]" => 'i',      # kasra (ِ)
    "\c[0x064F]" => 'u',      # damma (ُ)
    "\c[0x064B]" => 'aN',     # fathatan (ً) - a + N
    "\c[0x064D]" => 'iN',     # kasratan (ٍ) - i + N
    "\c[0x064C]" => 'uN',     # dammatan (ٌ) - u + N
    "\c[0x0652]" => '',       # sukun (ْ) - no vowel
    "\c[0x0651]" => '',       # shadda (ّ) - gemination
    
    # Hamza forms
    "\c[0x0624]" => "'u",     # hamza on waw (ؤ)
    "\c[0x0626]" => "'i",     # hamza on ya (ئ)
    "\c[0x0623]" => "'a",     # hamza on alif (أ)
    "\c[0x0625]" => "'i",     # hamza under alif (إ)
    
    # Long vowels and diphthongs (ArabTeX uses capital letters)
    "\c[0x064E]\c[0x0627]" => 'A',     # fatha + alif → A
    "\c[0x0650]\c[0x064A]" => 'I',     # kasra + ya → I
    "\c[0x064F]\c[0x0648]" => 'U',     # damma + waw → U
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
    # Arabic ArabTeX reverse mappings
    return (
        # Multi-character mappings first (order matters!)
        'al-' => "\c[0x0627]\c[0x0644]",
        "'A" => "\c[0x0622]",     # alif madda
        "'a" => "\c[0x0623]",     # hamza on alif
        "'i" => "\c[0x0625]",     # hamza under alif
        "'u" => "\c[0x0624]",     # hamza on waw
        '_t' => "\c[0x062B]",     # tha
        '^g' => "\c[0x062C]",     # jim
        '.h' => "\c[0x062D]",     # ha
        '_h' => "\c[0x062E]",     # kha
        '_d' => "\c[0x0630]",     # dhal
        '^s' => "\c[0x0634]",     # shin
        '.s' => "\c[0x0635]",     # sad
        '.d' => "\c[0x0636]",     # dad
        '.t' => "\c[0x0637]",     # ta (emphatic)
        '.z' => "\c[0x0638]",     # za
        '.g' => "\c[0x063A]",     # ghayn
        '_A' => "\c[0x0649]",     # alif maqsura
        'aN' => "\c[0x064B]",     # fathatan
        'iN' => "\c[0x064D]",     # kasratan
        'uN' => "\c[0x064C]",     # dammatan
        'ay' => "\c[0x064E]\c[0x064A]",
        'aw' => "\c[0x064E]\c[0x0648]",
        
        # Single characters
        'A' => "\c[0x0627]",      # alif / long a
        'I' => "\c[0x0650]\c[0x064A]",  # long i
        'U' => "\c[0x064F]\c[0x0648]",  # long u
        'T' => "\c[0x0629]",      # ta marbuta
        '`' => "\c[0x0639]",      # ayn
        "'" => "\c[0x0621]",      # hamza
        
        # Basic letters
        'b' => "\c[0x0628]",
        't' => "\c[0x062A]",
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