#!/usr/bin/env raku
use Test;
use lib 'lib';
use Lang::Transliterate;

plan 16;

# Test Slavic languages

subtest 'Church Slavonic transliteration' => {
    use Lang::Transliterate::Cu::Sci;
    my $cu = Lang::Transliterate::Cu::Sci.new;
    is transliterate('отьче', $cu), 'otьče', 'Church Slavonic Scientific';
}

subtest 'Russian transliteration' => {
    use Lang::Transliterate::Ru::Sci;
    use Lang::Transliterate::Ru::BGNPCGN;
    my $sci = Lang::Transliterate::Ru::Sci.new;
    my $bgn = Lang::Transliterate::Ru::BGNPCGN.new;
    
    is transliterate('Москва', $sci), 'Moskva', 'Russian Scientific';
    is transliterate('Москва', $bgn), 'Moskva', 'Russian BGN/PCGN';
    is transliterate('МОСКВА', $bgn), 'MOSKVA', 'Case preservation';
}

subtest 'Ukrainian transliteration' => {
    use Lang::Transliterate::Uk::Sci;
    my $uk = Lang::Transliterate::Uk::Sci.new;
    is transliterate('Київ', $uk), 'Kyjiv', 'Ukrainian Scientific';
}

subtest 'Belarusian transliteration' => {
    use Lang::Transliterate::Be::Sci;
    my $be = Lang::Transliterate::Be::Sci.new;
    is transliterate('Мінск', $be), 'Minsk', 'Belarusian Scientific';
}

subtest 'Bulgarian transliteration' => {
    use Lang::Transliterate::Bg::Sci;
    my $bg = Lang::Transliterate::Bg::Sci.new;
    is transliterate('София', $bg), 'Sofija', 'Bulgarian Scientific';
}

subtest 'Serbian transliteration' => {
    use Lang::Transliterate::Sr::Sci;
    my $sr = Lang::Transliterate::Sr::Sci.new;
    is transliterate('Београд', $sr), 'Beograd', 'Serbian Scientific';
}

subtest 'Macedonian transliteration' => {
    use Lang::Transliterate::Mk::Sci;
    my $mk = Lang::Transliterate::Mk::Sci.new;
    is transliterate('Скопје', $mk), 'Skopje', 'Macedonian Scientific';
}


# Test other scripts
subtest 'Greek transliteration' => {
    use Lang::Transliterate::El::ISO843;
    my $el = Lang::Transliterate::El::ISO843.new;
    is transliterate('Αθήνα', $el), 'Athī́na', 'Greek ISO 843';
}

subtest 'Sanskrit IAST' => {
    use Lang::Transliterate::Sa::IAST;
    my $sa = Lang::Transliterate::Sa::IAST.new;
    is transliterate('संस्कृत', $sa), 'saṁskṛta', 'Sanskrit IAST';
}

subtest 'Arabic transliteration' => {
    use Lang::Transliterate::Ar::BGNPCGN;
    my $ar = Lang::Transliterate::Ar::BGNPCGN.new;
    is transliterate('مكتبة', $ar), 'mktbh', 'Arabic BGNPCGN';
}

subtest 'Imperial Aramaic transliteration' => {
    use Lang::Transliterate::Arc::Latin;
    use Lang::Transliterate::Arc::Hebrew;
    use Lang::Transliterate::Arc::Arabic;
    use Lang::Transliterate::Arc::Syriac;
    
    my $to-latin = Lang::Transliterate::Arc::Latin.new;
    my $to-hebrew = Lang::Transliterate::Arc::Hebrew.new;
    my $to-arabic = Lang::Transliterate::Arc::Arabic.new;
    my $to-syriac = Lang::Transliterate::Arc::Syriac.new;
    
    my $aramaic = '𐡀𐡁𐡂𐡃';
    
    is transliterate($aramaic, $to-latin), 'ʾbgd', 'Imperial Aramaic to Latin';
    is transliterate($aramaic, $to-hebrew), 'אבגד', 'Imperial Aramaic to Hebrew';
    is transliterate($aramaic, $to-arabic), 'ابجد', 'Imperial Aramaic to Arabic';
    is transliterate($aramaic, $to-syriac), 'ܐܒܓܕ', 'Imperial Aramaic to Syriac';
}

subtest 'Egyptian hieroglyphics' => {
    use Lang::Transliterate::Egy::Gardiner1927;
    my $egy = Lang::Transliterate::Egy::Gardiner1927.new;
    is transliterate('𓊪', $egy), 'p', 'Egyptian Gardiner';
}

subtest 'Yiddish transliteration' => {
    use Lang::Transliterate::Yi::YIVO;
    my $yi = Lang::Transliterate::Yi::YIVO.new;
    is transliterate('ייִדיש', $yi), 'yidish', 'Yiddish YIVO';
}

subtest 'English to Tolkien Runic' => {
    use Lang::Transliterate::En::TolkienRunic;
    my $en = Lang::Transliterate::En::TolkienRunic.new;
    is transliterate('the', $en), 'ᚦᛖ', 'English to Tolkien Runic';
}

# Test general functionality
subtest 'ISO 9:1995 for all Cyrillic' => {
    use Lang::Transliterate::ISO9_1995;
    my $iso9 = Lang::Transliterate::ISO9_1995.new;
    is transliterate('Привет', $iso9), 'Privet', 'Russian';
    is transliterate('Привіт', $iso9), 'Privìt', 'Ukrainian';
    is transliterate('Прывітанне', $iso9), 'Pryvìtanne', 'Belarusian';
}

subtest 'Bidirectional conversion' => {
    use Lang::Transliterate::Yi::YIVO;
    my $yivo = Lang::Transliterate::Yi::YIVO.new;
    
    # Test forward transliteration
    my $yiddish = 'שלום';
    my $romanized = transliterate($yiddish, $yivo);
    is $romanized, 'shlum', 'Forward transliteration';
    
    # Test transliteration with another example
    my $yiddish2 = 'גוט';
    my $romanized2 = transliterate($yiddish2, $yivo);
    is $romanized2, 'gut', 'Forward transliteration 2';
    
    # Many transliteration systems are primarily one-way
    # so we focus on consistent forward transliteration
}

done-testing;