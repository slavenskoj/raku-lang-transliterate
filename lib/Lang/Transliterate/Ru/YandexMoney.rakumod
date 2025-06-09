use Lang::Transliterate;

unit class Lang::Transliterate::Ru::YandexMoney does Lang::Transliterate::Transliterator;

# Yandex Money transliteration system
# Based on https://iuliia.ru/yandex-money/
# Used by the former Yandex.Money service (documented in 2013)
# Features radical simplification: Е=Ё, И=Й
my %base-mappings = (
    # Russian Cyrillic to Latin Yandex Money
    'а' => 'a',
    'б' => 'b',
    'в' => 'v',
    'г' => 'g',
    'д' => 'd',
    'е' => 'e',
    'ё' => 'e',      # simplification: ё = е
    'ж' => 'zh',
    'з' => 'z',
    'и' => 'i',
    'й' => 'i',      # simplification: й = и
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
    'щ' => 'sch',    # щ → sch
    'ъ' => '',       # No apostrophes - omitted
    'ы' => 'y',
    'ь' => '',       # No apostrophes - omitted
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

method get-reverse-mappings(--> List) {
    # Yandex Money reverse mapping
    # Note: Due to simplifications, reverse mapping has ambiguities
    return (
        'a' => 'а',
        'b' => 'б',
        'v' => 'в',
        'g' => 'г',
        'd' => 'д',
        'e' => 'е',      # Could also be ё, э
        'zh' => 'ж',
        'z' => 'з',
        'i' => 'и',      # Could also be й, і, ѵ
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
        'sch' => 'щ',
        'y' => 'ы',
        'yu' => 'ю',
        'ya' => 'я',
    );
}