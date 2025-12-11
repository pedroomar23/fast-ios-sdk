// 
// - Clinet used 
//

import Foundation 

public struct Client: Decodable, Hashable, Encodable, Sendable {
    public let ip: String 
    public let asn: String 
    public let location: Location

    enum CodingKeys: String, CodingKey {
        case ip = "ip"
        case asn = "asn"
        case location = "location"
    }
}