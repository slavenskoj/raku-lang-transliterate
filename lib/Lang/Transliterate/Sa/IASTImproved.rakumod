use Lang::Transliterate;

unit class Lang::Transliterate::Sa::IASTImproved does Lang::Transliterate::Transliterator;

# Improved IAST implementation with better reverse transliteration

has %.mappings;
has %.reverse-mappings;
has %.alternative-mappings;

method BUILD() {
    self!initialize-mappings();
}

method !initialize-mappings() {
    # Initialize forward mappings (same as original)
    # ... (would copy from original)
    
    # Initialize reverse mappings with improvements
    self!build-reverse-mappings();
    
    # Initialize alternative input mappings
    %!alternative-mappings = (
        # Common variations
        'ṃ' => 'ṁ',  # Alternative anusvara
        'śh' => 'ś',  # Common mistake
        'chh' => 'ch', # Common mistake  
        'ksh' => 'kṣ', # Alternative for kṣ
        'gn' => 'jñ',  # Alternative for jñ
        'ri' => 'ṛ',   # Alternative for ṛ
        'aa' => 'ā',   # Double a for ā
        'ii' => 'ī',   # Double i for ī
        'uu' => 'ū',   # Double u for ū
        'ee' => 'ī',   # Common mistake
        'oo' => 'ū',   # Common mistake
    );
}

method !build-reverse-mappings() {
    # Build comprehensive reverse mappings
    %!reverse-mappings = ();
    
    # Add all mappings from the original implementation
    # ... (would be populated from original)
}

# Main improved reverse transliteration method
method transliterate-reverse(Str $text --> Str) {
    # Pre-process to normalize alternative inputs
    my $normalized = self!normalize-input($text);
    
    # Split into words to handle mixed languages
    my @words = $normalized.split(/\s+/, :v);
    my @results;
    
    for @words -> $word {
        if $word ~~ /^\s+$/ {
            # Preserve whitespace
            @results.push($word);
        } elsif self!is-english-word($word) {
            # Keep English words as-is
            @results.push($word);
        } else {
            # Transliterate Sanskrit/IAST words
            @results.push(self!transliterate-word($word));
        }
    }
    
    return @results.join('');
}

method !normalize-input(Str $text --> Str) {
    my $result = $text;
    
    # Apply alternative mappings
    for %!alternative-mappings.kv -> $alt, $standard {
        $result ~~ s:g/$alt/$standard/;
    }
    
    return $result;
}

method !is-english-word(Str $word --> Bool) {
    # Heuristics to detect English words
    
    # Check if word is capitalized (first letter uppercase, rest lowercase)
    if $word ~~ /^<[A..Z]><[a..z]>+$/ && $word !~~ /<[āīūṛṝḷḹṁḥṅñṭḍṇśṣ]>/ {
        return True;
    }
    
    # Check if word is all uppercase (likely acronym)
    if $word ~~ /^<[A..Z]>+$/ && $word.chars > 1 {
        return True;
    }
    
    # Check common English patterns
    if $word ~~ /^(the|of|and|or|but|in|on|at|to|for|with|from|by|about|into|through|during|before|after)$/i {
        return True;
    }
    
    # Check if word contains no diacritics and matches English pattern
    if $word !~~ /<[āīūṛṝḷḹṁḥṅñṭḍṇśṣ]>/ && $word ~~ /^<[a..z]>+$/ {
        # Common English letter patterns
        if $word ~~ /(ing|ed|er|est|ly|tion|sion|ment|ness|ful|less|ive|ous|able|ible)$/ {
            return True;
        }
        
        # Common English words
        my @common-english = <
            email web site page class chapter book lesson
            computer phone mobile laptop internet website
            monday tuesday wednesday thursday friday saturday sunday
            january february march april may june july august september october november december
        >;
        
        if $word.lc ∈ @common-english {
            return True;
        }
    }
    
    return False;
}

method !transliterate-word(Str $word --> Str) {
    # Extract and preserve punctuation
    my $prefix = '';
    my $suffix = '';
    my $core = $word;
    
    # Extract leading punctuation
    if $core ~~ s/^(<-[a..z A..Z 0..9 āīūṛṝḷḹṁḥṅñṭḍṇśṣ]>+)// {
        $prefix = $/[0].Str;
    }
    
    # Extract trailing punctuation
    if $core ~~ s/(<-[a..z A..Z 0..9 āīūṛṝḷḹṁḥṅñṭḍṇśṣ]>+)$// {
        $suffix = $/[0].Str;
    }
    
    # Transliterate the core word
    my $result = self!transliterate-core($core);
    
    return $prefix ~ $result ~ $suffix;
}

method !transliterate-core(Str $text --> Str) {
    # Core transliteration logic (would use improved mappings)
    # This would be similar to the original implementation but with
    # the comprehensive mapping table
    
    # Placeholder - would implement full logic
    return $text;
}

# Additional helper methods for specific improvements

method !handle-case-sensitive(Str $text --> Str) {
    # Handle uppercase IAST properly
    # E.g., KṚṢṆA → कृष्ण
    
    if $text ~~ /^<[A..Z]>+$/ && $text ~~ /<[ĀĪŪṚṜḶḸṀḤṄÑṬḌṆŚṢ]>/ {
        # All uppercase with diacritics - transliterate as lowercase
        return self!transliterate-core($text.lc);
    }
    
    return $text;
}

method !handle-compound-vowels(Str $text --> Str) {
    # Handle sequences like 'aī' vs 'ai'
    # Need to look ahead to disambiguate
    
    # Implementation would go here
    return $text;
}