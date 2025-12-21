// - Client 
// - Speed call to the Fast.com api 
// - Target

import Foundation 

public struct Speed: Decodable, Hashable, Encodable, Sendable {
    public let client: Client
    public let target: [Target]

    enum CodingKeys: String, CodingKey {
        case client = "client"
        case target = "target"
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.client = try container.decode(Client.self, forKey: .client)
        self.target = try container.decode([Target].self, forKey: .target)
    }

    public init(client: Client, target: [Target]) {
        self.client = client
        self.target = target
    }
}
