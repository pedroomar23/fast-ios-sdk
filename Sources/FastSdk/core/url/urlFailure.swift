import Foundation

public enum EndpointFailure: Error {
    case jsonFailure(message: String)
    case codeFailure(statusCode: Int)
}
