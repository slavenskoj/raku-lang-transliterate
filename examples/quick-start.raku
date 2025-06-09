#!/usr/bin/env raku

use lib 'lib';
use Lang::Transliterate;

# Sanskrit example
use Lang::Transliterate::Sa::IAST;
my $sanskrit-text = "नमस्ते";
my $iast = Lang::Transliterate::Sa::IAST.new;
say "Sanskrit: $sanskrit-text → ", transliterate($sanskrit-text, $iast);

# Round-trip example with Sanskrit
say "\nRound-trip conversion:";
my $original = "भगवद्गीता";
my $romanized = transliterate($original, $iast);
my $back = detransliterate($romanized, $iast);
say "Original: $original → Romanized: $romanized → Back: $back";

# Greek example
use Lang::Transliterate::El::ISO843;
my $greek-text = "Γεια σου κόσμε";
my $iso843 = Lang::Transliterate::El::ISO843.new;
say "Greek: $greek-text → ", transliterate($greek-text, $iso843);

# Egyptian hieroglyphics example
use Lang::Transliterate::Egy::Gardiner1927;
my $hieroglyphic = "𓊪𓏏𓇯𓃭𓅓𓏏";
my $gardiner = Lang::Transliterate::Egy::Gardiner1927.new;
say "Egyptian: $hieroglyphic → ", transliterate($hieroglyphic, $gardiner);

# Detransliteration example - converting romanized text back to original script
say "\nDetransliteration (Latin → Original Script):";
# Convert romanized Sanskrit back to Devanagari
my $latin-sanskrit = "yoga";
my $devanagari = detransliterate($latin-sanskrit, $iast);
say "Latin: $latin-sanskrit → Devanagari: $devanagari";

# Another example
my $latin-sanskrit2 = "karma";
my $devanagari2 = detransliterate($latin-sanskrit2, $iast);
say "Latin: $latin-sanskrit2 → Devanagari: $devanagari2";
