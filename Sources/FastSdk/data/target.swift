// 
// - Target is used for api calls
// 

import Foundation

public struct Target: Decodable, Hashable, Encodable, Sendable {
    public let name: String 
    public let url: String // Velocity Test 
    public let locations: Location 

    enum CodingKeys: String, CodingKey {
        case name 
        case url 
        case locations
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.url = try container.decode(String.self, forKey: .url)
        self.locations = try container.decode(Location.self, forKey: .locations)
    }
    
    public init(name: String, url: String, locations: Location) {
        self.name = name
        self.url = url
        self.locations = locations
    }
}
