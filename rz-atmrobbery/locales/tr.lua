local Translations = {
    label = {
        ["targetlabel"] = "Atm'yi Soy",
        ["progressbar"] = "Bağlantı Kuruluyor",
    },
    notify = {
        ["success"] = "Başarılı",
        ["cancel"] = "İptal Edildi",
        ["needıtem"] = "Üstünde Gerekli Eşyalar Yok",
        ["cooldown"] = "Bu Atm Daha Önce Soyulmuş!",
        ["money"] = "Atm'den",
        ["luckyıtem"] = "ATM'den 1 tane eşya buldun!",
        ["laptopexplosion"] = "Laptop Patladı!",
        ["needpolice"] = "Şehirde Yeterli Polis Yok",
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})