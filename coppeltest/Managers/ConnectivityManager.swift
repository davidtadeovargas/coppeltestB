import Foundation
import Network

class ConnectivityManager {

    static let shared = ConnectivityManager()

    private let monitor = NWPathMonitor()
    private var isConnected: Bool = true

    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
            NotificationCenter.default.post(name: Notification.Name("InternetConnectivityChanged"), object: nil)
        }
        let queue = DispatchQueue(label: "ConnectivityMonitor")
        monitor.start(queue: queue)
    }

    func isInternetAvailable() -> Bool {
        return isConnected
    }
}
