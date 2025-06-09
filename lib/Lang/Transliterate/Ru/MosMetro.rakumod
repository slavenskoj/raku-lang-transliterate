use Lang::Transliterate;

unit class Lang::Transliterate::Ru::MosMetro does Lang::Transliterate::Transliterator;

# Moscow Metro transliteration system
# Based on https://iuliia.ru/mosmetro/
# Used by Moscow Metro for station names and signage
my %base-mappings = (
    # Russian Cyrillic to Latin Moscow Metro
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'e',      # Context-dependent: e/yo
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'y',
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
    'ц' => 'ts',     # Context-dependent: ts/s
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'sch',
    'ъ' => '',       # Context-dependent: —/y
    'ы' => 'y',
    'ь' => '',       # Context-dependent: —/y
    'э' => 'e',
    'ю' => 'yu',
    'я' => 'ya',
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'e',      # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method !preserve-case(Str $original, Str $replacement, Int $pos, @chars --> Str) {
    # If original is not uppercase, return as-is
    return $replacement unless $original ~~ /<:Lu>/;
    
    # For multi-character replacements, check if we're in all-caps context
    if $replacement.chars > 1 {
        my $all-caps = False;
        
        # Check surrounding context
        if $pos > 0 && $pos + 1 < @chars.elems {
            # Middle of word: check both neighbors
            $all-caps = @chars[$pos - 1] ~~ /<:Lu>/ && @chars[$pos + 1] ~~ /<:Lu>/;
        } elsif $pos == 0 && $pos + 1 < @chars.elems {
            # Start of word: check next char
            $all-caps = @chars[$pos + 1] ~~ /<:Lu>/;
        } elsif $pos + 1 == @chars.elems && $pos > 0 {
            # End of word: check previous char
            $all-caps = @chars[$pos - 1] ~~ /<:Lu>/;
        }
        
        return $all-caps ?? $replacement.uc !! $replacement.tc;
    }
    
    # Single character replacement
    return $replacement.uc;
}

method !is-vowel-for-signs(Str $char --> Bool) {
    # For ъ and ь rules: before а, е, и, о, у, э
    return so $char ~~ /<[аеиоуэ]>/;
}

method transliterate-context-aware(Str $text --> Str) {
    # Moscow Metro has specific rules for ё, ц, ъ, ь, and endings
    
    my $result = '';
    my @chars = $text.comb;
    my $length = @chars.elems;
    
    loop (my $i = 0; $i < $length; $i++) {
        my $char = @chars[$i];
        my $lower = $char.lc;
        
        if %base-mappings{$lower}:exists {
            given $lower {
                when 'ё' {
                    # ё → yo after ъ and ь, otherwise e
                    if $i > 0 && @chars[$i - 1].lc ~~ any(<ъ ь>) {
                        $result ~= self!preserve-case($char, 'yo', $i, @chars);
                    } else {
                        $result ~= self!preserve-case($char, 'e', $i, @chars);
                    }
                }
                when 'ц' {
                    # ц → s after т, otherwise ts
                    if $i > 0 && @chars[$i - 1].lc eq 'т' {
                        $result ~= self!preserve-case($char, 's', $i, @chars);
                    } else {
                        $result ~= self!preserve-case($char, 'ts', $i, @chars);
                    }
                }
                when 'ъ' {
                    # ъ → y before а, е, и, о, у, э; omitted otherwise
                    if $i + 1 < $length && self!is-vowel-for-signs(@chars[$i + 1].lc) {
                        $result ~= 'y';
                    }
                    # Otherwise omitted (empty string from mapping)
                }
                when 'ь' {
                    # ь → y before а, е, и, о, у, э; omitted otherwise
                    if $i + 1 < $length && self!is-vowel-for-signs(@chars[$i + 1].lc) {
                        $result ~= 'y';
                    }
                    # Otherwise omitted (empty string from mapping)
                }
                when 'ы' {
                    # Check for -ый and -ий endings: both → -y
                    if $i + 1 < $length && @chars[$i + 1].lc eq 'й' {
                        # This is -ый ending, becomes -y
                        $result ~= self!preserve-case($char, 'y', $i, @chars);
                        # Skip the next й, we handle it here as part of ending
                        $i++;
                        # Don't add anything more - the ending is just 'y'
                    } else {
                        # Regular ы → y
                        $result ~= self!preserve-case($char, 'y', $i, @chars);
                    }
                }
                when 'и' {
                    # Check for -ий ending: ий → -y
                    if $i + 1 < $length && @chars[$i + 1].lc eq 'й' {
                        # This is -ий ending, becomes -y
                        $result ~= self!preserve-case($char, 'y', $i, @chars);
                        # Skip the next й
                        $i++;
                        # Don't add anything more - the ending is just 'y'
                    } else {
                        # Regular и → i
                        $result ~= self!preserve-case($char, 'i', $i, @chars);
                    }
                }
                default {
                    # Apply regular mapping
                    my $mapping = %base-mappings{$lower};
                    if $mapping ne '' {
                        $result ~= self!preserve-case($char, $mapping, $i, @chars);
                    }
                    # If mapping is empty string (ъ, ь in other contexts), nothing is added
                }
            }
        } else {
            # Keep non-Cyrillic characters as-is
            $result ~= $char;
        }
    }
    
    return $result;
}

method get-reverse-mappings(--> List) {
    # Moscow Metro reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be э, ё
        'yo' => 'ё',     # Special case after ъ/ь
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
        'y' => 'й',      # Could also be ы, or ъ/ь before vowels
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',
        'p' => 'п',
        'r' => 'р',
        's' => 'с',      # Could also be ц after т
        't' => 'т',
        'u' => 'у',
        'f' => 'ф',      # Could also be ѳ
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'sch' => 'щ',
        'yu' => 'ю',
        'ya' => 'я',
    );
}