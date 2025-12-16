// - url used at the api 
// - url.swift
//

import Foundation 

public enum EndpointUrl {
    private static let urlString = "https://api.fast.com/netflix/speedtest"
    
    case fastApi
    
    var path: String {
        switch self {
        case .fastApi: return "/v2?https=true&token=YXNkZmFzZGxmbnNkYWZoYXNkZmhrYWxm&urlCount=5"
        }
    }
    
    var url: URL {
        return URL(string: EndpointUrl.urlString + path)!
    }
}
