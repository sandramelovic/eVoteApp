import Foundation

struct JMBG {
    let gender: Gender
    let dateOfBirth: String
    let region: Region
}

enum Gender: String {
    case male = "Male"
    case female = "Female"
}

struct Region {
    let code: Int
    let name: String
    let city: String
}

func validateJMBG(_ jmbg: String) -> (JMBG?, String)? {
    guard jmbg.count == 13, let numericJMBG = Int(jmbg) else {
        return (nil, "Валидација ЈМБГ-а неуспешна: ЈМБГ мора да садржи 13 нумеричких вредности!")
    }
    
    let day = Int(String(jmbg.prefix(2))) ?? 0
    let month = Int(String(jmbg.prefix(4).suffix(2))) ?? 0
    let yearSuffix = Int(String(jmbg.prefix(7).suffix(3))) ?? 0

    guard day >= 1 && day <= 31 else {
             return (nil, "Валидација ЈМБГ-а неуспешна: Невалидан дан у ЈМБГ-у.")
        }

        guard month >= 1 && month <= 12 else {
            return (nil, "Валидација ЈМБГ-а неуспешна: Невалидан месец у ЈМБГ-у.")
        }
    
    let a = Int(String(jmbg.prefix(1))) ?? 0
    let b = Int(String(jmbg.prefix(2).suffix(1))) ?? 0
    let v = Int(String(jmbg.prefix(3).suffix(1))) ?? 0
    let g = Int(String(jmbg.prefix(4).suffix(1))) ?? 0
    let d = Int(String(jmbg.prefix(5).suffix(1))) ?? 0
    let đ = Int(String(jmbg.prefix(6).suffix(1))) ?? 0
    let e = Int(String(jmbg.prefix(7).suffix(1))) ?? 0
    let ž = Int(String(jmbg.prefix(8).suffix(1))) ?? 0
    let z = Int(String(jmbg.prefix(9).suffix(1))) ?? 0
    let i = Int(String(jmbg.prefix(10).suffix(1))) ?? 0
    let j = Int(String(jmbg.prefix(11).suffix(1))) ?? 0
    let lj = Int(String(jmbg.prefix(12).suffix(1))) ?? 0
    let k = Int(String(jmbg.suffix(1))) ?? 0
    
    let sum = ((7 * (a + e) + 6 * (b + ž) + 5 * (v + z) + 4 * (g + i) + 3 * (d + j) + 2 * (đ + lj)) % 11)
    let checksum = 11 - sum
    
    print("SUMM")
    print(sum)
    
    var l = checksum
    if l > 9 {
        l = 0
    }
    
    guard l == k else {
        return (nil, "Валидација ЈМБГ-а неуспешна: Невалидан контролни број у ЈМБГ-у.")
    }
    let lastThreeDigits = Int(String(jmbg.suffix(4).prefix(3))) ?? 0

    let gender = (lastThreeDigits < 500) ? Gender.male : Gender.female
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    
    let century: Int
    if yearSuffix < 500 {
        century = 2000
    } else {
        century = 1000
    }

    let year = century + yearSuffix
    guard let dateOfBirth = dateFormatter.date(from: "\(day)/\(month)/\(year)") else {
        return (nil, "Валидација ЈМБГ-а неуспешна: Невалидан датум рођеља у ЈМБГ-у.")
    }
    
    let regionCode = Int(String(jmbg.prefix(9).suffix(2))) ?? 0
    let regionName = getRegionName(regionCode)
    let regionCity = getCityName(regionCode)

    
    let region = Region(code: regionCode, name: regionName, city: regionCity)
    
    return (JMBG(gender: gender, dateOfBirth: dateFormatter.string(from: dateOfBirth), region: region), "Невалидан JMBG.")
}

func getRegionName(_ code: Int) -> String {
    switch code {
    case 0...9:
        return "Stranci bez državljanstva"
    case 10...19:
        return "Bosna i Hercegovina"
    case 20...29:
        return "Crna Gora"
    case 30...39:
        return "Hrvatska"
    case 41...49:
        return "Makedonija"
    case 50:
        return "Slovenija"
    case 70...79:
        return "Centralna Srbija"
    case 80...89:
        return "Autonomna Pokrajina Vojvodina"
    case 90...99:
        return "Autonomna Pokrajina Kosovo i Metohija"
    default:
        return "Unknown Region"
    }
}

func getCityName(_ code: Int) -> String {
    switch code {
    case 10:
        return "Banja Luka"
    case 11:
        return "Bihać"
    case 12:
        return "Doboj"
    case 13:
        return "Goražde"
    case 14:
        return "Livno"
    case 15:
        return "Mostar"
    case 16:
        return "Prijedor"
    case 17:
        return "Sarajevo"
    case 18:
        return "Tuzla"
    case 21:
        return "Podgorica"
    case 26:
        return "Nikšić"
    case 29:
        return "Pljevlja"
    case 30:
        return "Osijek"
    case 31:
        return "Bjelovar"
    case 32:
        return "Varaždin"
    case 33:
        return "Zagreb"
    case 34:
        return "Karlovac"
    case 35:
        return "Gospić"
    case 36:
        return "Rijeka"
    case 37:
        return "Sisak"
    case 38:
        return "Split"
    case 39:
        return "Other City in Croatia"
    case 41:
        return "Bitola"
    case 42:
        return "Kumanovo"
    case 43:
        return "Ohrid"
    case 44:
        return "Prilep"
    case 45:
        return "Skopje"
    case 46:
        return "Strumica"
    case 47:
        return "Tetovo"
    case 48:
        return "Veles"
    case 49:
        return "Štip"
    case 50:
        return "Slovenija"
    case 71:
        return "Beograd"
    case 72:
        return "Šumadija"
    case 73:
        return "Niš"
    case 74:
        return "Južna Morava"
    case 75:
        return "Zaječar"
    case 76:
        return "Podunavlje"
    case 77:
        return "Podrinje i Kolubara"
    case 78:
        return "Kraljevo"
    case 79:
        return "Užice"
    case 80:
        return "Novi Sad"
    case 81:
        return "Sombor"
    case 82:
        return "Subotica"
    case 85:
        return "Zrenjanin"
    case 86:
        return "Pančevo"
    case 87:
        return "Kikinda"
    case 88:
        return "Ruma"
    case 89:
        return "Sremska Mitrovica"
    case 91:
        return "Priština"
    case 92:
        return "Kosovska Mitrovica"
    case 93:
        return "Peć"
    case 94:
        return "Đakovica"
    case 95:
        return "Prizren"
    case 96:
        return "Kosovsko Pomoravski okrug"
    default:
        return "Unknown City"
    }
    
}



