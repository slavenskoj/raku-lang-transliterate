use Lang::Transliterate;

unit class Lang::Transliterate::Ru::BGNPCGN does Lang::Transliterate::Transliterator;

# BGN/PCGN Romanization for Russian
# US Board on Geographic Names / Permanent Committee on Geographical Names
# Used for geographic names transliteration
my %base-mappings = (
    # Russian Cyrillic to Latin BGN/PCGN (1944) - from Wikipedia table
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',      # Note: 'ye' at start of words and after vowels (context-dependent)
    'ё' => 'ë',      # Note: 'yë' at start of words and after vowels (context-dependent)
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
    'ц' => 'ts',
    'ч' => 'ch',
    'ш' => 'sh',
    'щ' => 'shch',
    'ъ' => 'ʺ',      # Hard sign (U+02BA modifier letter double prime)
    'ы' => 'y',
    'ь' => 'ʹ',      # Soft sign (U+02B9 modifier letter prime)
    'э' => 'e',
    'ю' => 'yu',
    'я' => 'ya',
    
    # Historic letters (pre-1918)
    'і' => 'i',      # и десятеричное
    'ѣ' => 'ě',      # ять
    'ѳ' => 'f',      # фита
    'ѵ' => 'i',      # ижица
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Override default to implement BGN/PCGN context-dependent rules
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $char = @chars[$i];
        my $lower = $char.lc;
        my $found = False;
        
        # Context-dependent rules for BGN/PCGN
        given $lower {
            when 'е' {
                # 'ye' at start of words and after vowels
                if $i == 0 || self!is-vowel(@chars[$i - 1]) {
                    $result ~= self!preserve-case($char, 'ye');
                } else {
                    $result ~= self!preserve-case($char, 'e');
                }
                $found = True;
            }
            when 'ё' {
                # 'yë' at start of words and after vowels  
                if $i == 0 || self!is-vowel(@chars[$i - 1]) {
                    $result ~= self!preserve-case($char, 'yë');
                } else {
                    $result ~= self!preserve-case($char, 'ë');
                }
                $found = True;
            }
            default {
                # Use standard mapping
                if %base-mappings{$lower}:exists {
                    $result ~= self!preserve-case($char, %base-mappings{$lower});
                    $found = True;
                }
            }
        }
        
        unless $found {
            $result ~= $char;
        }
        $i++;
    }
    
    return $result;
}

method !is-vowel(Str $char --> Bool) {
    my $lower = $char.lc;
    return $lower ~~ any(<а е ё и о у ы э ю я a e i o u>);
}

method !preserve-case(Str $original, Str $replacement --> Str) {
    return $original ~~ /<:Lu>/ ?? $replacement.tc !! $replacement;
}

method get-reverse-mappings(--> List) {
    # BGN/PCGN reverse mapping
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be э
        'yo' => 'ё',
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be і, ѵ
        'y' => 'й',      # Could also be ы
        'k' => 'к',
        'l' => 'л',
        'm' => 'м',
        'n' => 'н',
        'o' => 'о',
        'p' => 'п',
        'r' => 'р',
        's' => 'с',
        't' => 'т',
        'u' => 'у',
        'f' => 'ф',      # Could also be ѳ
        'kh' => 'х',
        'ts' => 'ц',
        'ch' => 'ч',
        'sh' => 'ш',
        'shch' => 'щ',
        'ʺ' => 'ъ',
        'ʹ' => 'ь',
        'yu' => 'ю',
        'ya' => 'я',
        'ye' => 'ѣ',
    );
}