# Lang::Transliterate

A comprehensive Raku library for transliterating text between different writing systems.

## Features

**Lang::Transliterate** provides context-aware transliteration with several advanced features:

- **Context-Aware Transliteration**: The library intelligently handles character combinations and contextual rules.
- **Bidirectional Conversion**: Most transliteration schemes support both forward transliteration (native script to Latin or other script) and reverse transliteration, allowing round-trip conversions.
- **Case Preservation**: The library automatically preserves the case of the original text when necessary, intelligently handling multi-character mappings.
- **Ancient and Historical Scripts**: Support for ancient writing systems including Egyptian hieroglyphics, Imperial Aramaic, Paleo-Hebrew, and Church Slavonic, with multiple scholarly transliteration standards.
- **Klingon and Tolkien Runic:** Just getting started now.
- **Extensible Architecture**: All transliterators implement a common interface, making it easy to add new scripts or customize existing ones. The modular design allows for language-specific rules and exceptions.

## Available Transliteration Systems

### General Systems

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::BasicASCII` | Basic ASCII fallback for a wide range of writing systems |
| `Lang::Transliterate::ISO9_1995` | ISO 9:1995 standard for all Cyrillic scripts |

### Greek

#### Ancient Greek (Grc)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Grc::Scientific` | Scientific (linguistic) transliteration |

#### Modern Greek (El)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::El::DIN31634` | German DIN 31634 standard |
| `Lang::Transliterate::El::ISO843` | ISO 843 international standard |

### Indo-Iranian Languages

#### Persian/Farsi (Fa)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Fa::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Fa::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Fa::DMG` | Deutsche Morgenländische Gesellschaft |
| `Lang::Transliterate::Fa::EI` | Encyclopaedia of Islam system |
| `Lang::Transliterate::Fa::EI1960` | Encyclopaedia of Islam 1960 edition |
| `Lang::Transliterate::Fa::UN` | United Nations romanization |
| `Lang::Transliterate::Fa::UN1967` | UN romanization 1967 revision |

#### Sanskrit (Sa)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Sa::IAST` | International Alphabet of Sanskrit Transliteration |

### Other Languages

#### Egyptian Hieroglyphic (Egy)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Egy::Allen2000` | James Allen (2000) Middle Egyptian |
| `Lang::Transliterate::Egy::Buurman1988` | Buurman (1988) system |
| `Lang::Transliterate::Egy::ErmanGrapow1926` | Erman & Grapow dictionary (1926) |
| `Lang::Transliterate::Egy::Gardiner1927` | Sir Alan Gardiner (1927) system |
| `Lang::Transliterate::Egy::Hannig1995` | Rainer Hannig (1995) system |
| `Lang::Transliterate::Egy::LeidenUnified2023` | Leiden Unified Transliteration (2023) |
| `Lang::Transliterate::Egy::Lepsius1874` | Karl Richard Lepsius (1874) system |

#### English (En)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::En::TolkienRunic` | J.R.R. Tolkien's runic writing system for English |

#### Klingon (Tlh)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Tlh::PIqaD` | Klingon pIqaD script transliteration |

#### Yiddish (Yi)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Yi::YIVO` | YIVO Institute standard romanization |

### Semitic Languages

#### Arabic (Ar)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Ar::ALALC` | ALA-LC romanization standard |
| `Lang::Transliterate::Ar::ArabTeX` | ArabTeX ASCII transliteration |
| `Lang::Transliterate::Ar::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Ar::BS` | British Standard 4280:1968 |
| `Lang::Transliterate::Ar::DIN31635` | German DIN 31635 standard |
| `Lang::Transliterate::Ar::EALL` | Encyclopedia of Arabic Language and Linguistics |
| `Lang::Transliterate::Ar::EI` | Encyclopaedia of Islam transliteration |
| `Lang::Transliterate::Ar::ISO233` | ISO 233 international standard |
| `Lang::Transliterate::Ar::UNGEGN` | UN Group of Experts on Geographical Names |
| `Lang::Transliterate::Ar::Wehr` | Hans Wehr dictionary system |

#### Aramaic (Arc)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Arc::Arabic` | Imperial Aramaic **↔** Arabic script |
| `Lang::Transliterate::Arc::Brahmi` | Imperial Aramaic **↔** Brahmi script |
| `Lang::Transliterate::Arc::Cyrillic` | Imperial Aramaic **↔** Cyrillic script |
| `Lang::Transliterate::Arc::Geez` | Imperial Aramaic **↔** Ethiopic script |
| `Lang::Transliterate::Arc::Greek` | Imperial Aramaic **↔** Greek script |
| `Lang::Transliterate::Arc::Hebrew` | Imperial Aramaic **↔** Hebrew script |
| `Lang::Transliterate::Arc::Kharosthi` | Imperial Aramaic **↔** Kharosthi script |
| `Lang::Transliterate::Arc::Latin` | Imperial Aramaic **↔** Latin script |
| `Lang::Transliterate::Arc::Maalouli` | Imperial Aramaic **↔** Neo-Aramaic script |
| `Lang::Transliterate::Arc::Nabataean` | Imperial Aramaic **↔** Nabataean script |
| `Lang::Transliterate::Arc::Parthian` | Imperial Aramaic **↔** Parthian script |
| `Lang::Transliterate::Arc::Phoenician` | Imperial Aramaic **↔** Phoenician script |
| `Lang::Transliterate::Arc::ProtoSinaitic` | Imperial Aramaic **↔** Proto-Sinaitic |
| `Lang::Transliterate::Arc::SouthArabian` | Imperial Aramaic **↔** South Arabian |
| `Lang::Transliterate::Arc::Syriac` | Imperial Aramaic **↔** Syriac script |
| `Lang::Transliterate::Arc::Turkic` | Imperial Aramaic **↔** Old Turkic runes |

#### Hebrew (He)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::He::CommonIsraeli` | Common Israeli romanization |
| `Lang::Transliterate::He::HebrewAcademy1953` | Academy of Hebrew Language 1953 rules |
| `Lang::Transliterate::He::HebrewAcademy2006` | Academy of Hebrew Language 2006 rules |
| `Lang::Transliterate::He::ISO259` | ISO 259 international standard |
| `Lang::Transliterate::He::PaleoHebrew` | Paleo-Hebrew script |
| `Lang::Transliterate::He::SBLAcademic` | Society of Biblical Literature academic transliteration |
| `Lang::Transliterate::He::SBLGeneralPurpose` | Society of Biblical Literature general purpose transliteration |
| `Lang::Transliterate::He::Samaritan` | Samaritan Hebrew |

### Slavic Languages

#### Belarusian (Be)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Be::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Be::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Be::BritishStandard` | British Standard romanization |
| `Lang::Transliterate::Be::ISO9` | ISO 9 transliteration |
| `Lang::Transliterate::Be::National2000` | Belarusian national standard 2000 |
| `Lang::Transliterate::Be::National2007` | Belarusian national standard 2007 |
| `Lang::Transliterate::Be::National2023` | Belarusian national standard 2023 |
| `Lang::Transliterate::Be::Sci` | Scientific linguistic transliteration |

#### Bulgarian (Bg)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Bg::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Bg::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Bg::BritishStandard` | British Standard romanization |
| `Lang::Transliterate::Bg::Danchev` | Andrei Danchev’s system |
| `Lang::Transliterate::Bg::ISO9` | ISO 9 transliteration |
| `Lang::Transliterate::Bg::Official2006` | Bulgarian official system 2006 |
| `Lang::Transliterate::Bg::Sci` | Scientific linguistic transliteration |

#### Church Slavonic (Cu)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Cu::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Cu::Sci` | Scientific linguistic transliteration |

#### Macedonian (Mk)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Mk::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Mk::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Mk::ISO9` | ISO 9 transliteration |
| `Lang::Transliterate::Mk::ISO9_1968` | ISO 9:1968 standard |
| `Lang::Transliterate::Mk::Sci` | Scientific linguistic transliteration |

#### Russian (Ru)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Ru::ALALC` | American Library Association/Library of Congress romanization |
| `Lang::Transliterate::Ru::ALALCSimplified` | Simplified ALA-LC without diacritics |
| `Lang::Transliterate::Ru::BGNPCGN` | US Board on Geographic Names/Permanent Committee romanization |
| `Lang::Transliterate::Ru::BritishStandard` | British Standard 2979:1958 romanization |
| `Lang::Transliterate::Ru::GOST779_2000A` | GOST 7.79-2000 System A (with diacritics) |
| `Lang::Transliterate::Ru::GOST779_2000B` | GOST 7.79-2000 System B (without diacritics) |
| `Lang::Transliterate::Ru::GOSTR52290_2004` | Russian road sign standard |
| `Lang::Transliterate::Ru::GOSTR52535_2006` | Machine-readable travel documents standard |
| `Lang::Transliterate::Ru::HarvardKyoto` | ASCII-only academic transliteration |
| `Lang::Transliterate::Ru::ICAO` | International Civil Aviation Organization standard |
| `Lang::Transliterate::Ru::ISOR9_1968_T1` | ISO/R 9:1968 Table 1 |
| `Lang::Transliterate::Ru::ISOR9_1968_T1_ALT` | ISO/R 9:1968 Table 1 alternative mappings |
| `Lang::Transliterate::Ru::ISOR9_1968_T2` | ISO/R 9:1968 Table 2 |
| `Lang::Transliterate::Ru::MID2113` | MID 2113 passport standard (2020) |
| `Lang::Transliterate::Ru::MVD310_1997` | MVD 310  passport standard (1997-2010) |
| `Lang::Transliterate::Ru::MVD782_2000` | MVD 782 driver's license standard (2000) |
| `Lang::Transliterate::Ru::MVD995_2015` | MVD 995 passport standard (2015) |
| `Lang::Transliterate::Ru::MosMetro` | Moscow Metro signage |
| `Lang::Transliterate::Ru::Sci` | Scientific linguistic transliteration |
| `Lang::Transliterate::Ru::Telegrams` | Soviet telegraph standard |
| `Lang::Transliterate::Ru::UN` | United Nations system |
| `Lang::Transliterate::Ru::YandexMaps` | Yandex Maps |
| `Lang::Transliterate::Ru::YandexMoney` | Yandex Money/payment systems |

#### Rusyn (Rue)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Rue::Sci` | Scientific linguistic transliteration |

#### Serbian (Sr)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Sr::Sci` | Scientific linguistic transliteration |

#### Ukrainian (Uk)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Uk::ALALC` | ALA-LC romanization standard |
| `Lang::Transliterate::Uk::ALALCModified` | Modified ALA-LC with Ukrainian specifics |
| `Lang::Transliterate::Uk::ALALCSimple` | Simplified ALA-LC without diacritics |
| `Lang::Transliterate::Uk::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Uk::BritishStandard` | British Standard romanization |
| `Lang::Transliterate::Uk::Derzhstandart1995` | Ukrainian national standard 1995 |
| `Lang::Transliterate::Uk::GOST1971` | Soviet GOST 16876-71 |
| `Lang::Transliterate::Uk::GOST1986` | Soviet GOST standard 1986 |
| `Lang::Transliterate::Uk::ISO1954` | Early ISO standard 1954 |
| `Lang::Transliterate::Uk::ISO1968Basic` | ISO basic system 1968 |
| `Lang::Transliterate::Uk::ISO1968Ukrainian` | ISO Ukrainian-specific system 1968 |
| `Lang::Transliterate::Uk::ISO1995` | ISO 9:1995 standard |
| `Lang::Transliterate::Uk::National1996` | Ukrainian national standard 1996 |
| `Lang::Transliterate::Uk::National2010` | Ukrainian national standard 2010 |
| `Lang::Transliterate::Uk::Passport2004` | Ukrainian passport standard 2004 |
| `Lang::Transliterate::Uk::Passport2007` | Ukrainian passport standard 2007-2010 |
| `Lang::Transliterate::Uk::Sci` | Scientific linguistic transliteration |

## Usage

### Basic Transliteration

```raku
use Lang::Transliterate;
use Lang::Transliterate::Egy::Gardiner1927;
use Lang::Transliterate::Sa::IAST;
use Lang::Transliterate::Yi::YIVO;

# Ancient Egyptian hieroglyphics (Gardiner's system)
my $hieroglyphic = "𓊪𓏏𓇯𓃭𓅓𓏏";
my $gardiner = Lang::Transliterate::Egy::Gardiner1927.new;
say transliterate($hieroglyphic, $gardiner); # "pt-ḥ-m-t"

# Sanskrit IAST 
my $sanskrit = "भगवद्गीता";
my $iast = Lang::Transliterate::Sa::IAST.new;
say transliterate($sanskrit, $iast); # "bhagavadgītā"

# Yiddish YIVO standard
my $yiddish = "ייִדיש";
my $yivo = Lang::Transliterate::Yi::YIVO.new;
say transliterate($yiddish, $yivo); # "yidish"
```

### Reverse Transliteration (Detransliteration)

```raku
use Lang::Transliterate;
use Lang::Transliterate::Sa::IAST;
use Lang::Transliterate::He::CommonIsraeli;

# Convert romanized text back to original script
my $romanized = "śaṅkarācārya";
my $iast = Lang::Transliterate::Sa::IAST.new;
my $devanagari = detransliterate($romanized, $iast);
say $devanagari; # "शङ्कराचार्य"

# Reconstruct Hebrew from common transliteration
my $name = "Yerushalayim";
my $israeli = Lang::Transliterate::He::CommonIsraeli.new;
my $hebrew = detransliterate($name, $israeli);
say $hebrew; # "ירושלים"
```

### Working with Ancient Scripts

```raku
use Lang::Transliterate;
use Lang::Transliterate::Arc::Hebrew;
use Lang::Transliterate::Arc::Arabic;
use Lang::Transliterate::Arc::Syriac;
use Lang::Transliterate::Arc::Phoenician;
use Lang::Transliterate::Egy::Gardiner1927;
use Lang::Transliterate::Egy::Allen2000;

# Imperial Aramaic to multiple scripts
my $aramaic = "𐡀𐡁𐡂𐡃";

my $to-hebrew = Lang::Transliterate::Arc::Hebrew.new;
say transliterate($aramaic, $to-hebrew);     # "אבגד"

my $to-arabic = Lang::Transliterate::Arc::Arabic.new;
say transliterate($aramaic, $to-arabic);     # "ابجد"

my $to-syriac = Lang::Transliterate::Arc::Syriac.new;
say transliterate($aramaic, $to-syriac);     # "ܐܒܓܕ"

my $to-phoenician = Lang::Transliterate::Arc::Phoenician.new;
say transliterate($aramaic, $to-phoenician); # "𐤀𐤁𐤂𐤃"

# Different Egyptian transliteration standards
my $cartouche = "𓈖𓆑𓂋𓏏𓇳𓏏𓇋";
my $gardiner = Lang::Transliterate::Egy::Gardiner1927.new;
say transliterate($cartouche, $gardiner);    # "nfr.t-ỉ.t-ỉ"

my $allen = Lang::Transliterate::Egy::Allen2000.new;
say transliterate($cartouche, $allen);       # "nfrt-jty"
```

### Special Features

```raku
use Lang::Transliterate;
use Lang::Transliterate::En::TolkienRunic;
use Lang::Transliterate::El::ISO843;

# English to Tolkien's runic system
my $ring-text = "One transliterator to rule them all";
say transliterate($ring-text, $tolkien); # "ᚩᚾᛖ ᛏᚱᚪᚾᛋᛚᛁᛏᛖᚱᚪᛏᚩᚱ ᛏᚩ ᚱᚢᛚᛖ ᚦᛖᛗ ᚪᛚᛚ"

# Case preservation in Greek
my $greek = "ΑΘΗΝΑ Ελλάδα";
my $iso843 = Lang::Transliterate::El::ISO843.new;
say transliterate($greek, $iso843); # "ATHĪNA Elláda"
```

## License

The Artistic License 2.0

Copyright © 2025 Danslav Slavenskoj