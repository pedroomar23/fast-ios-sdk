//
// - Calls to the Api
// - Api called of fast.com web

import Foundation
import os.log

@available(iOS 15, macOS 12, *)
public class FastApi: @unchecked Sendable {
    public static let shared: FastApi = FastApi()
    let logger = Logger()
    let session: URLSession = {
        let configuration = URLSessionConfiguration.default
        let delegate = SessionDelegate.shared
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        configuration.timeoutIntervalForRequest = 10
        return URLSession(configuration: configuration, delegate: delegate, delegateQueue: nil)
    }()
    
    public func speedTest(completion: @escaping (Result<Speed, EndpointFailure>) -> Void) async {
        let decoder = JSONDecoder()
        var request = URLRequest(url: EndpointUrl.fastApi.url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        logger.info("Initializing solicite to GET: \(EndpointUrl.fastApi.url.absoluteString)")
        
        do {
            let (data, response) = try await session.data(for: request)
            
            if let httpResponse = response as? HTTPURLResponse {
                print("Server Response: \(httpResponse.statusCode)")
                
                if let jsonData = String(data: data, encoding: .utf8) {
                    print("JSON Response: \(jsonData)")
                } else {
                    print("JSON Failure Response")
                }
                
                switch httpResponse.statusCode {
                case 200:
                    let speedJSON = try decoder.decode(Speed.self, from: data)
                    print("JSON Response: \(speedJSON)")
                    completion(.success(speedJSON))
                case 400:
                    let errorDetails = String(data: data, encoding: .utf8)
                    print("JSON Failure Response: \(String(describing: errorDetails))")
                case 402:
                    print("Server Failure Response: \(httpResponse.statusCode)")
                    completion(.failure(EndpointFailure.codeFailure(statusCode: httpResponse.statusCode)))
                default:
                    completion(.failure(EndpointFailure.jsonFailure(message: "JSON Failure Response: \(httpResponse.statusCode)")))
                }
            }
        } catch  {
            completion(.failure(EndpointFailure.jsonFailure(message: "JSON Failure Response: \(error.localizedDescription)")))
        }
    }
}
