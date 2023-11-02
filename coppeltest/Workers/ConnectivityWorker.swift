import Foundation
import Network
import Combine

class ConnectivityWorker {
    private var monitor: NWPathMonitor?
    
    func startMonitoringConnectivity(completion: @escaping (Bool) -> Void) {
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "ConnectivityMonitor")
        
        monitor?.pathUpdateHandler = { path in
            completion(path.status == .satisfied)
        }
        
        monitor?.start(queue: queue)
    }
    
    func stopMonitoringConnectivity() {
        monitor?.cancel()
    }
}
