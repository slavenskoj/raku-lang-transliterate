# Lang::Transliterate

A comprehensive Raku library for transliterating text between different writing systems.

## Available Transliteration Systems

### General Systems

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::BasicASCII` | Basic ASCII fallback for any Unicode text |
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
| `Lang::Transliterate::En::TolkienRunic` | J.R.R. Tolkien's runic writing system |

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
| `Lang::Transliterate::Arc::Arabic` | Imperial Aramaic to Arabic script |
| `Lang::Transliterate::Arc::Brahmi` | Imperial Aramaic to Brahmi script |
| `Lang::Transliterate::Arc::Cyrillic` | Imperial Aramaic to Cyrillic script |
| `Lang::Transliterate::Arc::Geez` | Imperial Aramaic to Ethiopic script |
| `Lang::Transliterate::Arc::Greek` | Imperial Aramaic to Greek script |
| `Lang::Transliterate::Arc::Hebrew` | Imperial Aramaic to Hebrew script |
| `Lang::Transliterate::Arc::Kharosthi` | Imperial Aramaic to Kharosthi script |
| `Lang::Transliterate::Arc::Latin` | Imperial Aramaic to Latin script |
| `Lang::Transliterate::Arc::Maalouli` | Imperial Aramaic to Neo-Aramaic script |
| `Lang::Transliterate::Arc::Nabataean` | Imperial Aramaic to Nabataean script |
| `Lang::Transliterate::Arc::Parthian` | Imperial Aramaic to Parthian script |
| `Lang::Transliterate::Arc::Phoenician` | Imperial Aramaic to Phoenician script |
| `Lang::Transliterate::Arc::ProtoSinaitic` | Imperial Aramaic to Proto-Sinaitic |
| `Lang::Transliterate::Arc::SouthArabian` | Imperial Aramaic to South Arabian |
| `Lang::Transliterate::Arc::Syriac` | Imperial Aramaic to Syriac script |
| `Lang::Transliterate::Arc::Turkic` | Imperial Aramaic to Old Turkic runes |

#### Hebrew (He)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::He::CommonIsraeli` | Common Israeli romanization |
| `Lang::Transliterate::He::HebrewAcademy1953` | Academy of Hebrew Language 1953 rules |
| `Lang::Transliterate::He::HebrewAcademy2006` | Academy of Hebrew Language 2006 rules |
| `Lang::Transliterate::He::ISO259` | ISO 259 international standard |
| `Lang::Transliterate::He::PaleoHebrew` | Ancient Hebrew script transliteration |
| `Lang::Transliterate::He::SBLAcademic` | Society of Biblical Literature academic style |
| `Lang::Transliterate::He::SBLGeneralPurpose` | SBL general purpose transliteration |
| `Lang::Transliterate::He::Samaritan` | Samaritan Hebrew transliteration |

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
| `Lang::Transliterate::Be::National2023` | Current Belarusian official standard |
| `Lang::Transliterate::Be::Sci` | Scientific (linguistic) transliteration |

#### Bulgarian (Bg)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Bg::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Bg::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Bg::BritishStandard` | British Standard romanization |
| `Lang::Transliterate::Bg::Danchev` | Andrei Danchev's system |
| `Lang::Transliterate::Bg::ISO9` | ISO 9 transliteration |
| `Lang::Transliterate::Bg::Official2006` | Bulgarian official system 2006 |
| `Lang::Transliterate::Bg::Sci` | Scientific (linguistic) transliteration |

#### Church Slavonic (Cu)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Cu::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Cu::Sci` | Scientific (linguistic) transliteration |

#### Macedonian (Mk)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Mk::ALALC` | ALA-LC romanization |
| `Lang::Transliterate::Mk::BGNPCGN` | US/UK geographic names standard |
| `Lang::Transliterate::Mk::ISO9` | ISO 9 transliteration |
| `Lang::Transliterate::Mk::ISO9_1968` | ISO 9:1968 standard |
| `Lang::Transliterate::Mk::Sci` | Scientific (linguistic) transliteration |

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
| `Lang::Transliterate::Ru::MID2113` | Ministry of Internal Affairs Order 2113 |
| `Lang::Transliterate::Ru::MVD310_1997` | Russian passport standard (1997-2010) |
| `Lang::Transliterate::Ru::MVD782_2000` | Driver's license standard (2000) |
| `Lang::Transliterate::Ru::MVD995_2015` | Current passport standard (2015+) |
| `Lang::Transliterate::Ru::MosMetro` | Moscow Metro signage romanization |
| `Lang::Transliterate::Ru::Sci` | Scientific (linguistic) transliteration |
| `Lang::Transliterate::Ru::Telegrams` | Soviet telegraph standard |
| `Lang::Transliterate::Ru::UN` | United Nations romanization system |
| `Lang::Transliterate::Ru::YandexMaps` | Yandex Maps transliteration |
| `Lang::Transliterate::Ru::YandexMoney` | Yandex Money/payment systems |

#### Rusyn (Rue)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Rue::Sci` | Scientific (linguistic) transliteration |

#### Serbian (Sr)

| Module | Description |
|--------|-------------|
| `Lang::Transliterate::Sr::Sci` | Scientific (linguistic) transliteration |

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
| `Lang::Transliterate::Uk::GOST1986` | Late Soviet standard |
| `Lang::Transliterate::Uk::ISO1954` | Early ISO standard |
| `Lang::Transliterate::Uk::ISO1968Basic` | ISO basic system |
| `Lang::Transliterate::Uk::ISO1968Ukrainian` | ISO Ukrainian-specific system |
| `Lang::Transliterate::Uk::ISO1995` | ISO 9:1995 standard |
| `Lang::Transliterate::Uk::National1996` | Ukrainian national standard 1996 |
| `Lang::Transliterate::Uk::National2010` | Current official Ukrainian standard |
| `Lang::Transliterate::Uk::Passport2004` | Ukrainian passport standard 2004 |
| `Lang::Transliterate::Uk::Passport2007` | Ukrainian passport standard 2007-2010 |
| `Lang::Transliterate::Uk::Sci` | Scientific (linguistic) transliteration |

## Usage

### Basic Transliteration

```raku
use Lang::Transliterate;

# Transliterate from native script to Latin
my $russian = "Привет мир";
my $latin = transliterate($russian, 'Ru::Sci');
say $latin; # "Privet mir"

# Different systems produce different results
say transliterate($russian, 'Ru::BGNPCGN');   # "Privet mir"
say transliterate($russian, 'Ru::ISO9_1995'); # "Privet mir"
```

### Reverse Transliteration (Detransliteration)

```raku
use Lang::Transliterate;

# Convert from Latin back to native script
my $latin = "Privet mir";
my $russian = detransliterate($latin, 'Ru::Sci');
say $russian; # "Привет мир"

# Works with other languages too
my $hebrew_latin = "shalom olam";
my $hebrew = detransliterate($hebrew_latin, 'He::CommonIsraeli');
say $hebrew; # "שלום עולם"
```

### Working with Different Scripts

```raku
use Lang::Transliterate;

# Arabic transliteration
my $arabic = "السلام عليكم";
say transliterate($arabic, 'Ar::BGNPCGN'); # "as-salām ʿalaykum"

# Sanskrit IAST
my $sanskrit = "संस्कृतम्";
say transliterate($sanskrit, 'Sa::IAST'); # "saṃskṛtam"

# Greek
my $greek = "Ελληνικά";
say transliterate($greek, 'El::ISO843'); # "Ellīniká"
```

### Case Preservation

The library automatically preserves the case of the original text:

```raku
my $text = "МОСКВА Россия";
say transliterate($text, 'Ru::Sci'); # "MOSKVA Rossija"
```

## License

The Artistic License 2.0

Copyright © 2025 Danslav Slavenskoj