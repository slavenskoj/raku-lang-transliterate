use Lang::Transliterate;

unit class Lang::Transliterate::Tlh::PIqaD does Lang::Transliterate::Transliterator;

# Klingon pIqaD Script to Latin Transliteration
# Using CSUR (ConScript Unicode Registry) Private Use Area: U+F8D0..U+F8FF
# Standard romanization system used by the Klingon Language Institute

my %base-mappings = (
    # pIqaD (CSUR) to Latin mappings
    "\c[0xF8D0]" => 'a',     #  a
    "\c[0xF8D1]" => 'b',     #  b
    "\c[0xF8D2]" => 'ch',    #  ch
    "\c[0xF8D3]" => 'D',     #  D (capital - different phoneme)
    "\c[0xF8D4]" => 'e',     #  e
    "\c[0xF8D5]" => 'gh',    #  gh
    "\c[0xF8D6]" => 'H',     #  H (capital - different phoneme)
    "\c[0xF8D7]" => 'I',     #  I (capital - different phoneme)
    "\c[0xF8D8]" => 'j',     #  j
    "\c[0xF8D9]" => 'l',     #  l
    "\c[0xF8DA]" => 'm',     #  m
    "\c[0xF8DB]" => 'n',     #  n
    "\c[0xF8DC]" => 'ng',    #  ng
    "\c[0xF8DD]" => 'o',     #  o
    "\c[0xF8DE]" => 'p',     #  p
    "\c[0xF8DF]" => 'q',     #  q (lowercase)
    "\c[0xF8E0]" => 'Q',     #  Q (capital - different phoneme)
    "\c[0xF8E1]" => 'r',     #  r
    "\c[0xF8E2]" => 'S',     #  S (capital - different phoneme)
    "\c[0xF8E3]" => 't',     #  t
    "\c[0xF8E4]" => 'tlh',   #  tlh
    "\c[0xF8E5]" => 'u',     #  u
    "\c[0xF8E6]" => 'v',     #  v
    "\c[0xF8E7]" => 'w',     #  w
    "\c[0xF8E8]" => 'y',     #  y
    "\c[0xF8E9]" => "'",     #  ' (qaghwI' - glottal stop)
    
    # Numbers 0-9 in pIqaD
    "\c[0xF8F0]" => '0',     #  0
    "\c[0xF8F1]" => '1',     #  1
    "\c[0xF8F2]" => '2',     #  2
    "\c[0xF8F3]" => '3',     #  3
    "\c[0xF8F4]" => '4',     #  4
    "\c[0xF8F5]" => '5',     #  5
    "\c[0xF8F6]" => '6',     #  6
    "\c[0xF8F7]" => '7',     #  7
    "\c[0xF8F8]" => '8',     #  8
    "\c[0xF8F9]" => '9',     #  9
    
    # Punctuation marks
    "\c[0xF8FD]" => ' ',     #  space/separator
    "\c[0xF8FE]" => '.',     #  full stop
    "\c[0xF8FF]" => ',',     #  comma/separator
);

method get-mappings(--> Hash) {
    return %base-mappings;
}

method get-reverse-mappings(--> List) {
    # Latin to pIqaD (CSUR) reverse mappings
    # Multi-character sequences must come first
    return (
        # Multi-character sequences
        'tlh' => "\c[0xF8E4]",   # tlh
        'ng' => "\c[0xF8DC]",    # ng
        'gh' => "\c[0xF8D5]",    # gh
        'ch' => "\c[0xF8D2]",    # ch
        
        # Single characters
        'a' => "\c[0xF8D0]",     # a
        'b' => "\c[0xF8D1]",     # b
        'D' => "\c[0xF8D3]",     # D
        'e' => "\c[0xF8D4]",     # e
        'H' => "\c[0xF8D6]",     # H
        'I' => "\c[0xF8D7]",     # I
        'j' => "\c[0xF8D8]",     # j
        'l' => "\c[0xF8D9]",     # l
        'm' => "\c[0xF8DA]",     # m
        'n' => "\c[0xF8DB]",     # n
        'o' => "\c[0xF8DD]",     # o
        'p' => "\c[0xF8DE]",     # p
        'q' => "\c[0xF8DF]",     # q
        'Q' => "\c[0xF8E0]",     # Q
        'r' => "\c[0xF8E1]",     # r
        'S' => "\c[0xF8E2]",     # S
        't' => "\c[0xF8E3]",     # t
        'u' => "\c[0xF8E5]",     # u
        'v' => "\c[0xF8E6]",     # v
        'w' => "\c[0xF8E7]",     # w
        'y' => "\c[0xF8E8]",     # y
        "'" => "\c[0xF8E9]",     # '
        
        # Numbers
        '0' => "\c[0xF8F0]",
        '1' => "\c[0xF8F1]",
        '2' => "\c[0xF8F2]",
        '3' => "\c[0xF8F3]",
        '4' => "\c[0xF8F4]",
        '5' => "\c[0xF8F5]",
        '6' => "\c[0xF8F6]",
        '7' => "\c[0xF8F7]",
        '8' => "\c[0xF8F8]",
        '9' => "\c[0xF8F9]",
        
        # Punctuation
        ' ' => "\c[0xF8FD]",
        '.' => "\c[0xF8FE]",
        ',' => "\c[0xF8FF]",
    );
}

# Override to handle multi-character sequences properly
method transliterate-context-aware(Str $text, :%mappings = self.get-mappings() --> Str) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # For pIqaD to Latin, we just need single character mapping
        my $char = @chars[$i];
        if %mappings{$char}:exists {
            $result ~= %mappings{$char};
            $found = True;
        }
        
        unless $found {
            # Keep unknown characters as-is
            $result ~= $char;
        }
        
        $i++;
    }
    
    return $result;
}

# Override reverse transliteration to handle multi-character Latin sequences
method detransliterate(Str $text --> Str) {
    my $result = '';
    my @chars = $text.comb;
    my %reverse = self.get-reverse-mappings();
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try longest possible matches first (up to 3 for 'tlh')
        for (3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                if %reverse{$substr}:exists {
                    $result ~= %reverse{$substr};
                    $found = True;
                    $i += $len;
                    last;
                }
            }
        }
        
        unless $found {
            # Keep unknown characters as-is
            $result ~= @chars[$i];
            $i++;
        }
    }
    
    return $result;
}