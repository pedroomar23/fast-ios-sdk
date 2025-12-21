// 
// - Target is used for api calls
// 

import Foundation

public struct Target: Decodable, Hashable, Encodable, Sendable {
    public let name: String 
    public let url: String // Velocity Test 
    public let location: Location

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case location = "location"
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
        self.location = try container.decode(Location.self, forKey: .location)
    }
    
    public init(name: String, url: String, location: Location) {
        self.name = name
        self.url = url
        self.location = location
    }
}
