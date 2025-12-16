import Foundation 
import SwiftUI
import Combine
import FastSdk

@MainActor
final class FastSpeed: ObservableObject {
    @Published var speedTest: Speed = Speed(client: Client(ip: "", asn: "", location: Location(city: "", country: "")), target: [Target(name: "", url: "", locations: Location(city: "", country: ""))])
    
    @Published var isLoading: Bool = false
    @Published var alertMsg: Bool = false
    @Published var message: String = ""
    
    let speedApi = FastApi.shared
    
    // MARK: - Call to the Api
    
    func speedTestPrivate() {
        Task {
            DispatchQueue.main.async { [self] in isLoading = false }
            await speedTestRequestPrivate()
        }
    }
    
    func speedTestRequestPrivate() async {
        await speedApi.speedTest { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case let .success(model):
                    speedTest = model
                    isLoading = false
                    alertMsg = false
                case let .failure(error):
                    print("ErrorSpeedTestPrivate: \(error.localizaedDescription)")
                    isLoading = false
                    alertMsg = true
                }
            }
        }
    }
}
