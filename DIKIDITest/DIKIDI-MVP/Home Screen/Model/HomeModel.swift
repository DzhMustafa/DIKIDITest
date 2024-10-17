import Foundation

struct HomeModelResponce: Codable {
    let error: ResponceError
    let data: HomeModel
}

struct HomeModel: Codable {
    let title: String
    let image: String
    let catalogCount: String
    let blocks: Blocks
}

struct Blocks: Codable {
    let vip: [Vip]
    let shares: Shares
}

struct ImageType: Codable {
    let thumb: String
    let origin: String
}

struct ReviewCount: Codable {
    let value: String

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let intValue = try? container.decode(Int.self) {
            self.value = String(intValue)
        } else if let stringValue = try? container.decode(String.self) {
            self.value = stringValue
        } else {
            throw DecodingError.typeMismatch(String.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Expected String or Int"))
        }
    }
}



// MARK: - Shares
struct Shares: Codable {
    let list: [SharesList]
    let count: String
}

extension Shares {
    static let mock = Shares(list: [SharesList(id: "1641",
                                               name: "Акция для коротыша",
                                               timeStart: "2024-10-15 00:00:00",
                                               timeStop: "2024-10-23 23:59:59",
                                               publicTimeStart: "2024-10-15 00:00:00",
                                               publicTimeStop: "2024-10-23 23:59:59",
                                               discountValue: "20",
                                               view: "4",
                                               icon: "https://f2.test.dikidi.ru/c1/v14/51n1i2r68o.jpg",
                                               companyId: "3224",
                                               companyName: "Данил",
                                               companyImage: "https://f2.test.dikidi.ru/c1/v14/79ta6fqjh0.jpg?size=q")],
                             count: "20")
}
// MARK: - List
struct SharesList: Codable {
    let id: String
    let name: String
    let timeStart: String
    let timeStop: String
    let publicTimeStart: String
    let publicTimeStop: String
    let discountValue: String
    let view: String
    let icon: String
    let companyId: String
    let companyName: String
    let companyImage: String
}

// MARK: - Vip
struct Vip: Codable {
    let id: String
    let image: ImageType
    let name: String
    let categories: [String]
    let award: String?
    let vipTariff: Bool
}

extension Vip {
    static let mock = Vip(id: "3177",
                          image: ImageType(thumb: "https://f1.test.dikidi.ru/c1/v12/60agcc0t1f.jpg?size=m",
                                           origin: "https://f1.test.dikidi.ru/c1/v12/60agcc0t1f.jpg?size=f"),
                          name: "Tets salon",
                          categories: ["Hairdressing services",
                                       "Nail Artist",
                                       "Lash Tech",
                                       "Laser Technician"],
                          award: nil,
                          vipTariff: false)
}

struct ResponceError: Codable {
    let code: Int
    let message: String?
}
