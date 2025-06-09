use Lang::Transliterate;

unit class Lang::Transliterate::Be::National2007 does Lang::Transliterate::Transliterator;

# Belarusian National 2007 Transliteration
# Revised instruction on transliteration
# Same contextual rules as 2000 for е, ё, ю, я
my %base-mappings = (
    # Belarusian Cyrillic to Latin National 2007
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'h',
    'д' => 'd',
    'е' => 'e',  # or 'je' contextually
    'ё' => 'o',  # or 'jo' contextually  
    'ж' => 'ž',
    'з' => 'z',
    'і' => 'i',
    'й' => 'j',
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
    'ў' => 'ŭ',  # u with breve (changed from 2000)
    'ф' => 'f',
    'х' => 'ch',
    'ц' => 'c',
    'ч' => 'č',
    'ш' => 'š',
    'ы' => 'y',
    'ь' => "\c[COMBINING ACUTE ACCENT]",  # U+0301 combining acute accent
    'э' => 'e',
    'ю' => 'u',  # or 'ju' contextually
    'я' => 'a',  # or 'ja' contextually
    'ʼ' => '-',  # apostrophe becomes hyphen
);

method get-mappings(--> Hash) {
    # Return only lowercase mappings
    # The framework will handle capitalization
    return %base-mappings;
}

method transliterate-context-aware(Str $text --> Str) {
    # Handle contextual rules for е, ё, ю, я
    my $result = '';
    my @chars = $text.comb;
    
    for @chars.kv -> $i, $char {
        my $prev-char = $i > 0 ?? @chars[$i - 1] !! '';
        
        # Check if we need j-forms
        my $use-j-form = False;
        if $i == 0 {
            # Word-initial
            $use-j-form = True;
        } elsif $prev-char ~~ /<[аеёіоуыэюяў]>/ {
            # After vowel or ў
            $use-j-form = True;
        } elsif $prev-char eq 'ʼ' || $prev-char eq 'ь' {
            # After apostrophe or soft sign
            $use-j-form = True;
        }
        
        given $char.lc {  # Handle both upper and lowercase
            when 'е' { 
                my $trans = $use-j-form ?? 'je' !! 'ie';
                $result ~= $char ~~ /<:Lu>/ ?? $trans.tc !! $trans;
            }
            when 'ё' { 
                my $trans = $use-j-form ?? 'jo' !! 'io';
                $result ~= $char ~~ /<:Lu>/ ?? $trans.tc !! $trans;
            }
            when 'ю' { 
                my $trans = $use-j-form ?? 'ju' !! 'iu';
                $result ~= $char ~~ /<:Lu>/ ?? $trans.tc !! $trans;
            }
            when 'я' { 
                my $trans = $use-j-form ?? 'ja' !! 'ia';
                $result ~= $char ~~ /<:Lu>/ ?? $trans.tc !! $trans;
            }
            default  { 
                my %mappings = self.get-mappings();
                if $char ~~ /<:Lu>/ {
                    # Handle uppercase
                    my $lc = $char.lc;
                    my $mapped = %mappings{$lc} // $char;
                    $result ~= $mapped.tc;
                } else {
                    $result ~= %mappings{$char} // $char;
                }
            }
        }
    }
    
    return $result;
}

method get-reverse-mappings(--> List) {
    # National 2007 reverse mappings
    return (
        # Contextual forms
        'je' => 'е',
        'jo' => 'ё', 
        'ju' => 'ю',
        'ja' => 'я',
        'ie' => 'е',
        'io' => 'ё',
        'iu' => 'ю',
        'ia' => 'я',
        
        # Multi-character mappings
        'ch' => 'х',
        
        # Diacritical marks
        'ž' => 'ж',
        'ŭ' => 'ў',
        'č' => 'ч',
        'š' => 'ш',
        "\c[COMBINING ACUTE ACCENT]" => 'ь',
        
        # Simple letters
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'h' => 'г',
        'd' => 'д',
        'e' => 'э',
        'z' => 'з',
        'i' => 'і',
        'j' => 'й',
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
        'f' => 'ф',
        'c' => 'ц',
        'y' => 'ы',
        '-' => 'ʼ',
    );
}