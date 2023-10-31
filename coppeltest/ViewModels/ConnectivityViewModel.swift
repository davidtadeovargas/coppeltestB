import Foundation
import Network

class ConnectivityViewModel: ObservableObject {
    @Published var isInternetAvailable: Bool = true

    init() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            self.isInternetAvailable = path.status == .satisfied
        }
        let queue = DispatchQueue(label: "ConnectivityMonitor")
        monitor.start(queue: queue)
    }
}
