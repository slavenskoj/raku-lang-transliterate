use Lang::Transliterate;

unit class Lang::Transliterate::Cu::Sci does Lang::Transliterate::Transliterator;

# Church Slavonic Scientific Transliteration
# Based on the scientific transliteration standard

my %base-mappings = (
    # Basic Cyrillic letters
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Note: є also maps to 'e' in Church Slavonic
    'э' => 'e',      # cannot be treated as a separate letter of the alphabet https://www.unicode.org/notes/tn41/tn41-1.pdf
    'ж' => 'ž',
    'з' => 'z',
    'и' => 'i',
    'і' => 'i',      # Both и and і map to 'i'
    'ї' => 'i',      # Also maps to 'i' in Church Slavonic
    'й' => 'j',      # Short I
    'к' => 'k',
    'л' => 'l',
    'м' => 'm',
    'н' => 'n',
    'о' => 'o',
    'п' => 'p',
    'р' => 'r',
    'с' => 's',
    'т' => 't',
    'у' => 'u',
    'ф' => 'f',
    'х' => 'x',      # Primary: x, alternative: ch
    'ц' => 'c',
    'ꙡ' => 'c',      # Reversed tse (Old Novgorodian, same as ц)
    'ч' => 'č',
    'ш' => 'š',
    'щ' => 'št',
    'ъ' => 'ъ',      # Keep as is (alternatives: ǔ, ŏ, ŭ)
    'ы' => 'y',      # Primary: y, alternative: ū
    'ь' => 'ь',      # Keep as is (alternatives: ǐ, ĕ, ĭ)
    'ѣ' => 'ě',      # Yat
    'ю' => 'ju',     # Primary: ju, alternative: û
    'я' => 'ja',     # Primary: ja, alternative: â
    
    # Special Church Slavonic letters
    'є' => 'e',      # Ukrainian Ye in Church Slavonic context
    'ѕ' => 'ʒ',      # Zelo (alternative: dz)
    'ћ' => 'ǵ',      # Tshe
    'ѡ' => 'o',      # Omega (alternative: ô, ō)
    'ꙍ' => 'o',      # Broad omega (U+A64D)
    'ᲂ' => 'o',      # Narrow o (U+1C82)
    'ᲂу' => 'u',     # Narrow o + u digraph
    'ᲈ' => 'u',      # Unblended uk (U+1C88)
    'ѻ' => 'o',      # Broad o (word initial)
    'ꚛ' => 'o',      # Crossed o (for окрестъ, округъ)
    'ꚙ' => 'o',      # Double o (early Old Church Slavonic)
    'ꙩ' => 'o',      # Monocular o / eyed o (for око)
    'ꙫ' => 'o',      # Binocular o variant 1
    'ꙭ' => 'o',      # Binocular o variant 2
    'ꙮ' => 'o',      # Multiocular o (for многоочитый)
    'оу' => 'u',     # Uk digraph (recommended Unicode composition)
    'Оу' => 'U',     # Uk digraph uppercase
    'ОУ' => 'U',     # Uk digraph all caps
    'ꙋ' => 'u',      # Monograph uk (U+A64B)
    'Ꙋ' => 'U',      # Monograph uk capital (U+A64A)
    
    # Variant forms of basic letters (Cyrillic Extended-C)
    'ᲀ' => 'v',      # Rounded ve (U+1C80)
    'ᲁ' => 'd',      # Long-legged de (U+1C81)
    'ᲃ' => 's',      # Wide es (U+1C83)
    'ᲄ' => 't',      # Tall te (U+1C84)
    'ᲅ' => 't',      # Three-legged te (U+1C85)
    'ᲆ' => 'ъ',      # Tall hard sign (U+1C86)
    'ᲇ' => 'ě',      # Tall yat (U+1C87)
    'ᲊ' => 't',      # Tje (U+1C8A)
    
    # Early letter forms
    'ꙃ' => 'ʒ',     # Early form of DZELO
    'ꙅ' => 'ʒ',      # Reversed form of DZELO
    'ꙁ' => 'z',      # Early form of з
    'ѹ' => 'u',      # Deprecated uk ligature (U+0479)
    'Ѹ' => 'U',      # Deprecated uk ligature capital (U+0478)
    'оѵ' => 'u',     # Uk digraph with izhitsa
    
    # Yuses and their variants
    'ѧ' => 'ę',      # Little yus
    'ѩ' => 'ję',     # Iotified little yus
    'ѫ' => 'ǫ',      # Big yus
    'ѭ' => 'jǫ',     # Iotified big yus
    'ꙛ' => 'ǫ',      # Blended yus
    'ꙙ' => 'ę',      # Closed little yus
    'ꙝ' => 'ję',     # Iotated closed little yus
    
    # Various forms of yery
    'ꙑ' => 'y',      # Alternative form of yery
    'ъї' => 'y',     # Yery ligature
    'ъи' => 'y',     # Yery ligature
    'ьї' => 'y',     # Yery ligature
    'ьи' => 'y',     # Yery ligature
    
    # Greek-derived letters
    'ѯ' => 'ks',     # Ksi (alternative: ξ)
    'ѱ' => 'ps',     # Psi (alternative: ψ)
    'ѳ' => 'th',     # Fita (alternatives: θ, t, f, ph)
    'ѵ' => 'ü',      # Izhitsa (alternatives: y, i, v)
    'ѷ' => 'ü',      # Izhitsa with diaeresis
    
    # Additional iotated letters
    'ѥ' => 'je',     # Iotated E
    'ꙗ' => 'ja',     # Iotated A
    
    # Titlo marks and abbreviation signs (removed in transliteration)
    "\c[COMBINING CYRILLIC TITLO]" => '',        # Combining titlo (U+0483)
    "\c[COMBINING CYRILLIC POKRYTIE]" => '',     # Combining pokrytie (U+0487)
    
    # Combining titlo letters (Cyrillic Extended-A U+2DE0-U+2DFF)
    "\c[0x2DE0]" => "b\c[COMBINING OVERLINE]",      # Combining Cyrillic letter be
    "\c[0x2DE1]" => "v\c[COMBINING OVERLINE]",      # Combining Cyrillic letter ve
    "\c[0x2DE2]" => "g\c[COMBINING OVERLINE]",      # Combining Cyrillic letter ghe
    "\c[0x2DE3]" => "d\c[COMBINING OVERLINE]",      # Combining Cyrillic letter de
    "\c[0x2DE4]" => "ž\c[COMBINING OVERLINE]",      # Combining Cyrillic letter zhe
    "\c[0x2DE5]" => "z\c[COMBINING OVERLINE]",      # Combining Cyrillic letter ze
    "\c[0x2DE6]" => "k\c[COMBINING OVERLINE]",      # Combining Cyrillic letter ka
    "\c[0x2DE7]" => "l\c[COMBINING OVERLINE]",      # Combining Cyrillic letter el
    "\c[0x2DE8]" => "m\c[COMBINING OVERLINE]",      # Combining Cyrillic letter em
    "\c[0x2DE9]" => "n\c[COMBINING OVERLINE]",      # Combining Cyrillic letter en
    "\c[0x2DEA]" => "o\c[COMBINING OVERLINE]",      # Combining Cyrillic letter o
    "\c[0x2DEB]" => "p\c[COMBINING OVERLINE]",      # Combining Cyrillic letter pe
    "\c[0x2DEC]" => "r\c[COMBINING OVERLINE]",      # Combining Cyrillic letter er
    "\c[0x2DED]" => "s\c[COMBINING OVERLINE]",      # Combining Cyrillic letter es
    "\c[0x2DEE]" => "t\c[COMBINING OVERLINE]",      # Combining Cyrillic letter te
    "\c[0x2DEF]" => "x\c[COMBINING OVERLINE]",      # Combining Cyrillic letter ha
    "\c[0x2DF0]" => "c\c[COMBINING OVERLINE]",      # Combining Cyrillic letter tse
    "\c[0x2DF1]" => "č\c[COMBINING OVERLINE]",      # Combining Cyrillic letter che
    "\c[0x2DF2]" => "š\c[COMBINING OVERLINE]",      # Combining Cyrillic letter sha
    "\c[0x2DF3]" => "št\c[COMBINING OVERLINE]",     # Combining Cyrillic letter shcha
    "\c[0x2DF4]" => "th\c[COMBINING OVERLINE]",     # Combining Cyrillic letter fita
    "\c[0x2DF5]" => "st\c[COMBINING OVERLINE]",     # Combining Cyrillic letter es-te
    "\c[0x2DF6]" => "a\c[COMBINING OVERLINE]",      # Combining Cyrillic letter a
    "\c[0x2DF7]" => "e\c[COMBINING OVERLINE]",      # Combining Cyrillic letter ie
    "\c[0x2DF8]" => "ǵ\c[COMBINING OVERLINE]",      # Combining Cyrillic letter djerv
    "\c[0x2DF9]" => "u\c[COMBINING OVERLINE]",      # Combining Cyrillic letter monograph uk
    "\c[0x2DFA]" => "ě\c[COMBINING OVERLINE]",      # Combining Cyrillic letter yat
    "\c[0x2DFB]" => "ju\c[COMBINING OVERLINE]",     # Combining Cyrillic letter yu
    "\c[0x2DFC]" => "ja\c[COMBINING OVERLINE]",     # Combining Cyrillic letter iotified a
    "\c[0x2DFD]" => "ę\c[COMBINING OVERLINE]",      # Combining Cyrillic letter little yus
    "\c[0x2DFE]" => "ǫ\c[COMBINING OVERLINE]",      # Combining Cyrillic letter big yus
    "\c[0x2DFF]" => "jǫ\c[COMBINING OVERLINE]",     # Combining Cyrillic letter iotified big yus
    
    # Rare/variant forms
    'ѿ' => 'ot',     # Ot ligature (alternative: ōt)
    'ѻ' => 'o',      # Round omega
    'ҁ' => 'ҁ',      # Koppa - no phonetic value, kept as is
    'ꙉ' => 'ǵ',      # Djerv - Serbian regional variant
    'ꙕ' => 'ju',     # Reversed yu - early variant
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

# Override to handle combining characters properly
method transliterate-context-aware(Str $text --> Str) {
    my %mappings = self.get-mappings();
    return apply-combining-mapping($text, %mappings);
}

# Special mapping function that processes combining characters
sub apply-combining-mapping(Str $text, %mappings --> Str) {
    my $result = '';
    my @chars = $text.ords.map(*.chr); # Convert to individual codepoints
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try to match longest sequences first (up to 3 characters)
        for (3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                
                # First try exact match
                if %mappings{$substr}:exists {
                    $result ~= %mappings{$substr};
                    $i += $len;
                    $found = True;
                    last;
                }
                
                # If no exact match and it's a single uppercase char, try lowercase
                if $len == 1 && $substr ~~ /<:Lu>/ {
                    my $lower = $substr.lc;
                    if %mappings{$lower}:exists {
                        my $mapped = %mappings{$lower};
                        
                        # Check if we should apply full uppercase (look ahead)
                        my $apply-full-upper = False;
                        if $i > 0 && $i + 1 < @chars.elems {
                            # Check if previous and next chars are also uppercase
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/ && @chars[$i + 1] ~~ /<:Lu>/;
                        } elsif $i == 0 && @chars.elems > 1 {
                            # At start, check if next char is uppercase
                            $apply-full-upper = @chars[$i + 1] ~~ /<:Lu>/;
                        }
                        
                        if $apply-full-upper {
                            $result ~= $mapped.uc;
                        } else {
                            # Only capitalize first character
                            $result ~= $mapped.tc;
                        }
                        
                        $i += $len;
                        $found = True;
                        last;
                    }
                }
            }
        }
        
        # If no mapping found, keep original character
        if !$found {
            $result ~= @chars[$i];
            $i++;
        }
    }
    
    return $result;
}

method get-reverse-mappings(--> List) {
    # Church Slavonic Scientific reverse mappings
    return (
        # Multi-character mappings first
        'ję' => 'ѩ',
        'jǫ' => 'ѭ',
        'ju' => 'ю',
        'ja' => 'я',     # Primary mapping for ja
        'je' => 'є',     # Primary mapping for je (could also be ѥ)
        'ks' => 'ѯ',
        'ps' => 'ѱ',
        'th' => 'ѳ',
        'št' => 'щ',
        'ot' => 'ѿ',
        'dz' => 'ѕ',     # Alternative for ʒ
        'ch' => 'х',     # Alternative for х
        'ōt' => 'ѿ',     # Alternative for ot ligature
        'ph' => 'ѳ',     # Alternative for fita
        
        # Diacritical and special characters
        'ž' => 'ж',
        'č' => 'ч',
        'š' => 'ш',
        'ě' => 'ѣ',
        'ę' => 'ѧ',
        'ǫ' => 'ѫ',
        'ʒ' => 'ѕ',
        'ǵ' => 'ћ',
        'ü' => 'ѵ',
        
        # Alternative forms for yers
        'ǔ' => 'ъ',      # Alternative for hard sign
        'ŏ' => 'ъ',      # Alternative for hard sign
        'ŭ' => 'ъ',      # Alternative for hard sign
        'ǐ' => 'ь',      # Alternative for soft sign
        'ĕ' => 'ь',      # Alternative for soft sign
        'ĭ' => 'ь',      # Alternative for soft sign
        'ū' => 'ы',      # Alternative for yery
        
        # Alternative forms for other letters
        'ô' => 'ѡ',      # Alternative for omega
        'ō' => 'ѡ',      # Alternative for omega
        'û' => 'ю',      # Alternative for yu
        'â' => 'я',      # Alternative for ya
        
        # Greek letter alternatives
        'θ' => 'ѳ',      # Greek theta
        'ξ' => 'ѯ',      # Greek xi
        'ψ' => 'ѱ',      # Greek psi
        'υ' => 'ѵ',      # Greek upsilon
        'ω' => 'ѡ',      # Greek omega
        'ϙ' => 'ҁ',      # Greek koppa
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',      # Primary mapping for i
        'j' => 'й',      # Short i
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',      # Primary mapping for o
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',      # Note: in some contexts could be ѳ
        'u' => 'у',      # Primary mapping for u
        'f' => 'ф',      # Note: in some contexts could be ѳ
        'x' => 'х',
        'c' => 'ц',
        'y' => 'ы',      # Note: in some contexts could be ѵ
        'ъ' => 'ъ',      # Direct mapping
        'ь' => 'ь',      # Direct mapping
    );
}