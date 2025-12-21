// 
// - Client used 
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
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ip = try container.decode(String.self, forKey: .ip)
        self.asn = try container.decode(String.self, forKey: .asn)
        self.location = try container.decode(Location.self, forKey: .location)
    }
    
    public init(ip: String, asn: String, location: Location) {
        self.ip = ip
        self.asn = asn
        self.location = location
    }
}
