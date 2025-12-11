// 
// - url.swift
//

import Foundation 

public enum FastUrl {
    private static let urlString = ""
    
    case fastApi
    
    var path: String {
        switch self {
        case .fastApi: return ""
        }
    }
    
    var url: URL {
        return URL(string: FastUrl.urlString + path)!
    }
}
