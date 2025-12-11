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
}