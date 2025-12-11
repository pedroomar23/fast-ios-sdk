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
}