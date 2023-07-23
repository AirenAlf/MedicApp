
// MARK: - MedicModel
struct MedicModel: Codable {
    let categories: [Category]
    let doctors: [Doctor]

    enum CodingKeys: String, CodingKey {
        case categories
        case doctors = "Doctors"
    }
}

// MARK: - Category
struct Category: Codable {
    let name: String
    let imageURL: String
    let isActive: Bool

    enum CodingKeys: String, CodingKey {
        case name
        case imageURL = "imageUrl"
        case isActive
    }
}

// MARK: - Doctor
struct Doctor: Codable {
    let id, name, categoryName, experiency: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case id, name, categoryName, experiency
        case imageURL = "imageUrl"
    }
}

