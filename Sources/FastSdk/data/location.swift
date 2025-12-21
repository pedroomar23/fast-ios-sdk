// 
// - Location used country location 
// 

import Foundation 

public struct Location: Decodable, Hashable, Encodable, Sendable {
    public let city: String 
    public let country: String 

    enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "country"
    } 
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.city = try container.decode(String.self, forKey: .city)
        self.country = try container.decode(String.self, forKey: .country)
    }
    
    public init(city: String, country: String) {
        self.city = city
        self.country = country
    }
}
