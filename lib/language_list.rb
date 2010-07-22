class LanguageList
=begin
  http://www.karakas-online.de/forum/viewtopic.php?t=858

  text = "copy paste list..."
  text1 = text.split ?\n.chr
  text2 = text1.map{ |x| x.split(' = ') }
=end
  @@list = [
 ["Afrikaans", "af"],
 ["Albanian", "sq"],
 ["Arabic (Algeria)", "ar-dz"],
 ["Arabic (Bahrain)", "ar-bh"],
 ["Arabic (Egypt)", "ar-eg"],
 ["Arabic (Iraq)", "ar-iq"],
 ["Arabic (Jordan)", "ar-jo"],
 ["Arabic (Kuwait)", "ar-kw"],
 ["Arabic (Lebanon)", "ar-lb"],
 ["Arabic (libya)", "ar-ly"],
 ["Arabic (Morocco)", "ar-ma"],
 ["Arabic (Oman)", "ar-om"],
 ["Arabic (Qatar)", "ar-qa"],
 ["Arabic (Saudi Arabia)", "ar-sa"],
 ["Arabic (Syria)", "ar-sy"],
 ["Arabic (Tunisia)", "ar-tn"],
 ["Arabic (U.A.E.)", "ar-ae"],
 ["Arabic (Yemen)", "ar-ye"],
 ["Arabic", "ar"],
 ["Armenian", "hy"],
 ["Assamese", "as"],
 ["Azeri (Cyrillic)", "az"],
 ["Azeri (Latin)", "az"],
 ["Basque", "eu"],
 ["Belarusian", "be"],
 ["Bengali", "bn"],
 ["Bulgarian", "bg"],
 ["Catalan", "ca"],
 ["Chinese (China)", "zh-cn"],
 ["Chinese (Hong Kong SAR)", "zh-hk"],
 ["Chinese (Macau SAR)", "zh-mo"],
 ["Chinese (Singapore)", "zh-sg"],
 ["Chinese (Taiwan)", "zh-tw"],
 ["Chinese", "zh"],
 ["Croatian", "hr"],
 ["Chech", "cs"],
 ["Danish", "da"],
 ["Divehi", "div"],
 ["Dutch (Belgium)", "nl-be"],
 ["Dutch (Netherlands)", "nl"],
 ["English (Australia)", "en-au"],
 ["English (Belize)", "en-bz"],
 ["English (Canada)", "en-ca"],
 ["English (Caribbean)", "en"],
 ["English (Ireland)", "en-ie"],
 ["English (Jamaica)", "en-jm"],
 ["English (New Zealand)", "en-nz"],
 ["English (Philippines)", "en-ph"],
 ["English (South Africa)", "en-za"],
 ["English (Trinidad)", "en-tt"],
 ["English (United Kingdom)", "en-gb"],
 ["English (United States)", "en-us"],
 ["English (Zimbabwe)", "en-zw"],
 ["English", "en"],
 ["Estonian", "et"],
 ["Faeroese", "fo"],
 ["Farsi", "fa"],
 ["Finnish", "fi"],
 ["French (Belgium)", "fr-be"],
 ["French (Canada)", "fr-ca"],
 ["French (France)", "fr"],
 ["French (Luxembourg)", "fr-lu"],
 ["French (Monaco)", "fr-mc"],
 ["French (Switzerland)", "fr-ch"],
 ["FYRO Macedonian", "mk"],
 ["Gaelic", "gd"],
 ["Georgian", "ka"],
 ["German (Austria)", "de-at"],
 ["German (Germany)", "de"],
 ["German (Liechtenstein)", "de-li"],
 ["German (lexumbourg)", "de-lu"],
 ["German (Switzerland)", "de-ch"],
 ["Greek", "el"],
 ["Gujarati", "gu"],
 ["Hebrew", "he"],
 ["Hindi", "hi"],
 ["Hungarian", "hu"],
 ["Icelandic", "is"],
 ["Indonesian", "id"],
 ["Italian (Italy)", "it"],
 ["Italian (Switzerland)", "it-ch"],
 ["Japanese", "ja"],
 ["Kannada", "kn"],
 ["Kazakh", "kk"],
 ["Konkani", "kok"],
 ["Korean", "ko"],
 ["Kyrgyz", "kz"],
 ["Latvian", "lv"],
 ["Lithuanian", "lt"],
 ["Malay (Brunei)", "ms"],
 ["Malay (Malaysia)", "ms"],
 ["Malayalam", "ml"],
 ["Maltese", "mt"],
 ["Marathi", "mr"],
 ["Mongolian (Cyrillic)", "mn"],
 ["Nepali (India)", "ne"],
 ["Norwegian (Bokmal)", "nb-no"],
 ["Norwegian (Bokmal)", "no"],
 ["Norwegian (Nynorsk)", "nn-no"],
 ["Oriya", "or"],
 ["Polish", "pl"],
 ["Portuguese (Brazil)", "pt-br"],
 ["Portuguese (Portugal)", "pt"],
 ["Punjabi", "pa"],
 ["Rhaeto-Romanic", "rm"],
 ["Romanian (Moldova)", "ro-md"],
 ["Romanian", "ro"],
 ["Russian (Moldova)", "ru-md"],
 ["Russian", "ru"],
 ["Sanskrit", "sa"],
 ["Serbian (Cyrillic)", "sr"],
 ["Serbian (Latin)", "sr"],
 ["Slovak", "sk"],
 ["Slovenian", "ls"],
 ["Sorbian", "sb"],
 ["Spanish (Argentina)", "es-ar"],
 ["Spanish (Bolivia)", "es-bo"],
 ["Spanish (Chile)", "es-cl"],
 ["Spanish (Colombia)", "es-co"],
 ["Spanish (Costa Rica)", "es-cr"],
 ["Spanish (Dominican Republic)", "es-do"],
 ["Spanish (Ecuador)", "es-ec"],
 ["Spanish (El Salvador)", "es-sv"],
 ["Spanish (Guatemala)", "es-gt"],
 ["Spanish (Honduras)", "es-hn"],
 ["Spanish (International Sort)", "es"],
 ["Spanish (Mexico)", "es-mx"],
 ["Spanish (Nicaragua)", "es-ni"],
 ["Spanish (Panama)", "es-pa"],
 ["Spanish (Paraguay)", "es-py"],
 ["Spanish (Peru)", "es-pe"],
 ["Spanish (Puerto Rico)", "es-pr"],
 ["Spanish (Traditional Sort)", "es"],
 ["Spanish (United States)", "es-us"],
 ["Spanish (Uruguay)", "es-uy"],
 ["Spanish (Venezuela)", "es-ve"],
 ["Sutu", "sx"],
 ["Swahili", "sw"],
 ["Swedish (Finland)", "sv-fi"],
 ["Swedish", "sv"],
 ["Syriac", "syr"],
 ["Tamil", "ta"],
 ["Tatar", "tt"],
 ["Telugu", "te"],
 ["Thai", "th"],
 ["Tsonga", "ts"],
 ["Tswana", "tn"],
 ["Turkish", "tr"],
 ["Ukrainian", "uk"],
 ["Urdu", "ur"],
 ["Uzbek (Cyrillic)", "uz"],
 ["Uzbek (Latin)", "uz"],
 ["Vietnamese", "vi"],
 ["Xhosa", "xh"],
 ["Yiddish", "yi"],
 ["Zulu", "zu "]
]

  def self.read
    @@list
  end
end