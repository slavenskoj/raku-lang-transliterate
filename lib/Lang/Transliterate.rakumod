unit module Lang::Transliterate;

# Role that all transliterators must implement
role Transliterator is export {
    method get-mappings(--> Hash) { ... }
    method get-reverse-mappings(--> List) { ... }
    
    # Default implementation for context-aware transliteration
    # Can be overridden by specific transliterators
    method transliterate-context-aware(Str $text --> Str) {
        my %mappings = self.get-mappings();
        return apply-mapping($text, %mappings);
    }
    
    # Default implementation for context-aware detransliteration
    # Can be overridden by specific transliterators
    method detransliterate-context-aware(Str $text --> Str) {
        my @mappings = self.get-reverse-mappings();
        my %reverse-map = @mappings;
        return apply-mapping($text, %reverse-map);
    }
}

# Helper function to apply character mappings with intelligent capitalization
sub apply-mapping(Str $text, %mappings --> Str) is export(:ALL) {
    my $result = '';
    my @chars = $text.comb;
    
    my $i = 0;
    while $i < @chars.elems {
        my $found = False;
        
        # Try to match longest sequences first (up to 3 characters)
        for (3, 2, 1) -> $len {
            if $i + $len <= @chars.elems {
                my $substr = @chars[$i ..^ $i + $len].join;
                
                # First try exact match (handles pre-defined uppercase mappings)
                if %mappings{$substr}:exists {
                    my $mapped = %mappings{$substr};
                    
                    # Check if this is an uppercase character with multi-char mapping
                    if $len == 1 && $substr ~~ /<:Lu>/ && $mapped.chars > 1 {
                        # Check if we're in an all-caps context
                        my $apply-full-upper = False;
                        if $i > 0 && $i + $len < @chars.elems {
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/ && @chars[$i + $len] ~~ /<:Lu>/;
                        } elsif $i == 0 && $i + $len < @chars.elems {
                            $apply-full-upper = @chars[$i + $len] ~~ /<:Lu>/;
                        } elsif $i + $len == @chars.elems && $i > 0 {
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/;
                        }
                        $result ~= $apply-full-upper ?? $mapped.uc !! $mapped.tc;
                    } else {
                        $result ~= $mapped;
                    }
                    
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
                        if $i > 0 && $i + $len < @chars.elems {
                            # Check if previous and next chars are also uppercase
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/ && @chars[$i + $len] ~~ /<:Lu>/;
                        } elsif $i == 0 && $i + $len < @chars.elems {
                            # At start, check if next char is uppercase
                            $apply-full-upper = @chars[$i + $len] ~~ /<:Lu>/;
                        } elsif $i + $len == @chars.elems && $i > 0 {
                            # At end, check if previous char is uppercase
                            $apply-full-upper = @chars[$i - 1] ~~ /<:Lu>/;
                        }
                        
                        # Apply appropriate capitalization
                        $result ~= $apply-full-upper ?? $mapped.uc !! $mapped.tc;
                        $i += $len;
                        $found = True;
                        last;
                    }
                }
            }
        }
        
        unless $found {
            $result ~= @chars[$i];
            $i++;
        }
    }
    
    return $result;
}

# Main transliteration function
sub transliterate(Str $text, Transliterator $scheme --> Str) is export {
    return $scheme.transliterate-context-aware($text);
}

# Reverse transliteration function
sub detransliterate(Str $text, Transliterator $scheme --> Str) is export {
    return $scheme.detransliterate-context-aware($text);
}