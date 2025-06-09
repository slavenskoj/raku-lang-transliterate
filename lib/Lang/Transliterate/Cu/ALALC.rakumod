use Lang::Transliterate;

unit class Lang::Transliterate::Cu::ALALC does Lang::Transliterate::Transliterator;

# Church Slavonic ALA-LC (American Library Association - Library of Congress) Transliteration
# Based on: https://www.loc.gov/catdir/cpso/romanization/churchsl.pdf

my %base-mappings = (
    # Basic Cyrillic letters
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'є' => 'e',      # Ukrainian Ye in Church Slavonic context
    'ж' => 'zh',
    'з' => 'z',
    'ѕ' => 'ż',      # Zelo
    'и' => 'i',
    'і' => 'i',      # Decimal I
    'ї' => 'i',      # Yi
    'й' => 'ĭ',      # Short I
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
    'х' => 'kh',
    'ц' => 't͡s',    # with tie
    'ꙡ' => 't͡s',    # Reversed tse (Old Novgorodian, same as ц)
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sht',
    'ъ' => 'ʺ',      # Hard sign → double prime (U+02BA)
    'ы' => 'y',      # Primary form (alternative ȳ)
    'ь' => 'ʹ',      # Soft sign → prime (U+02B9)
    'ѣ' => 'ě',      # Yat
    'ю' => 'i͡u',    # with tie
    'я' => 'ja',     # Not shown in table but standard
    
    # Special Church Slavonic letters
    'ѡ' => 'ō',      # Omega (with macron)
    'ꙍ' => 'ō',      # Broad omega (with macron)
    'ѿ' => 'ō͡t',    # Ot ligature (with tie)
    'ᲂ' => 'o',      # Narrow o (U+1C82)
    'ᲂу' => 'u',     # Narrow o + u digraph
    'ᲈ' => 'ū',      # Unblended uk (U+1C88) - with macron like monograph
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
    'ѹ' => 'u',      # Deprecated uk ligature (U+0479)
    'Ѹ' => 'U',      # Deprecated uk ligature capital (U+0478)
    'ꙋ' => 'ū',      # Monograph uk (with macron)
    'Ꙋ' => 'Ū',      # Monograph uk capital (with macron)
    
    # Iotated letters
    'ꙗ' => 'i͡a',    # Iotated A (with tie)
    'ѥ' => 'i͡e',    # Iotated E (with tie)
    
    # Yuses
    'ѧ' => 'ę',      # Small yus
    'ѩ' => 'i͡ę',    # Iotified small yus (with tie)
    'ѫ' => 'ǫ',      # Big yus
    'ѭ' => 'i͡ǫ',    # Iotified big yus (with tie)
    
    # Greek-derived letters
    'ѯ' => 'k͡s',    # Ksi (with tie)
    'ѱ' => 'p͡s',    # Psi (with tie)
    'ѳ' => 'ḟ',      # Fita (f with dot above)
    'ѵ' => 'ẏ',      # Izhitsa (y with dot above, alternative v̇)
    
    # Cyrillic Extended-C variant forms
    'ᲀ' => 'v',      # Rounded ve (U+1C80)
    'ᲁ' => 'd',      # Long-legged de (U+1C81)
    'ᲃ' => 's',      # Wide es (U+1C83)
    'ᲄ' => 't',      # Tall te (U+1C84)
    'ᲅ' => 't',      # Three-legged te (U+1C85)
    'ᲆ' => 'ʺ',      # Tall hard sign (U+1C86) → double prime
    'ᲇ' => 'ě',      # Tall yat (U+1C87)
    'ᲊ' => 't',      # Tje (U+1C8A)
    
    # Titlo marks and abbreviation signs (removed in transliteration)
    "\c[COMBINING CYRILLIC TITLO]" => '',        # Combining titlo (U+0483)
    "\c[COMBINING CYRILLIC POKRYTIE]" => '',     # Combining pokrytie (U+0487)
    
    # Combining titlo letters (Cyrillic Extended-A U+2DE0-U+2DFF)
    "\c[0x2DE0]" => '(b)',      # Combining Cyrillic letter be
    "\c[0x2DE1]" => '(v)',      # Combining Cyrillic letter ve
    "\c[0x2DE2]" => '(g)',      # Combining Cyrillic letter ghe
    "\c[0x2DE3]" => '(d)',      # Combining Cyrillic letter de
    "\c[0x2DE4]" => '(zh)',     # Combining Cyrillic letter zhe (zh in ALA-LC)
    "\c[0x2DE5]" => '(z)',      # Combining Cyrillic letter ze
    "\c[0x2DE6]" => '(k)',      # Combining Cyrillic letter ka
    "\c[0x2DE7]" => '(l)',      # Combining Cyrillic letter el
    "\c[0x2DE8]" => '(m)',      # Combining Cyrillic letter em
    "\c[0x2DE9]" => '(n)',      # Combining Cyrillic letter en
    "\c[0x2DEA]" => '(o)',      # Combining Cyrillic letter o
    "\c[0x2DEB]" => '(p)',      # Combining Cyrillic letter pe
    "\c[0x2DEC]" => '(r)',      # Combining Cyrillic letter er
    "\c[0x2DED]" => '(s)',      # Combining Cyrillic letter es
    "\c[0x2DEE]" => '(t)',      # Combining Cyrillic letter te
    "\c[0x2DEF]" => '(kh)',     # Combining Cyrillic letter ha (kh in ALA-LC)
    "\c[0x2DF0]" => '(t͡s)',     # Combining Cyrillic letter tse (t͡s in ALA-LC)
    "\c[0x2DF1]" => '(ch)',     # Combining Cyrillic letter che
    "\c[0x2DF2]" => '(sh)',     # Combining Cyrillic letter sha
    "\c[0x2DF3]" => '(sht)',    # Combining Cyrillic letter shcha
    "\c[0x2DF4]" => '(ḟ)',      # Combining Cyrillic letter fita (f with dot above)
    "\c[0x2DF5]" => '(st)',     # Combining Cyrillic letter es-te
    "\c[0x2DF6]" => '(a)',      # Combining Cyrillic letter a
    "\c[0x2DF7]" => '(e)',      # Combining Cyrillic letter ie
    "\c[0x2DF8]" => '(ǵ)',      # Combining Cyrillic letter djerv
    "\c[0x2DF9]" => '(ū)',      # Combining Cyrillic letter monograph uk (with macron)
    "\c[0x2DFA]" => '(ě)',      # Combining Cyrillic letter yat
    "\c[0x2DFB]" => '(i͡u)',     # Combining Cyrillic letter yu (with tie)
    "\c[0x2DFC]" => '(i͡a)',     # Combining Cyrillic letter iotified a (with tie)
    "\c[0x2DFD]" => '(ę)',      # Combining Cyrillic letter little yus
    "\c[0x2DFE]" => '(ǫ)',      # Combining Cyrillic letter big yus
    "\c[0x2DFF]" => '(i͡ǫ)',     # Combining Cyrillic letter iotified big yus (with tie)
    
    # Rare/variant forms
    'ѻ' => 'o',      # Round omega
    'ꙑ' => 'y',      # Alternative form of yery
    'ѷ' => 'ẏ',      # Izhitsa with diaeresis
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
    # Church Slavonic ALA-LC reverse mappings
    return (
        # Multi-character with ties first
        'i͡a' => 'ꙗ',
        'i͡e' => 'ѥ',
        'i͡u' => 'ю',
        'i͡ę' => 'ѩ',
        'i͡ǫ' => 'ѭ',
        'k͡s' => 'ѯ',
        'p͡s' => 'ѱ',
        't͡s' => 'ц',
        'ō͡t' => 'ѿ',
        
        # Multi-character without ties
        'zh' => 'ж',
        'kh' => 'х',
        'ch' => 'ч',
        'sh' => 'ш',
        'sht' => 'щ',
        'ja' => 'я',
        
        # Characters with diacritics
        'ż' => 'ѕ',
        'ĭ' => 'й',
        'ě' => 'ѣ',
        'ō' => 'ѡ',
        'ū' => 'ꙋ',
        'ę' => 'ѧ',
        'ǫ' => 'ѫ',
        'ḟ' => 'ѳ',
        'ẏ' => 'ѵ',
        'ȳ' => 'ы',      # Alternative for yery
        'v̇' => 'ѵ',      # Alternative for izhitsa
        
        # Modifier letters
        'ʺ' => 'ъ',      # Double prime
        'ʹ' => 'ь',      # Prime
        '″' => 'ъ',      # Alternative double prime
        '′' => 'ь',      # Alternative prime
        '\'' => 'ь',     # Apostrophe as alternative
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',
        'z' => 'з',
        'i' => 'и',      # Primary mapping for i
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',      # Primary mapping for o
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',
        'u' => 'у',      # Primary mapping for u
        'f' => 'ф',
        'y' => 'ы',      # Primary mapping for y
    );
}