import Foundation
import Network
import Combine

class ConnectivityPresenter: ObservableObject {
    
    static let shared = ConnectivityPresenter() // Instancia única (singleton)

    @Published var isInternetAvailable: Bool = true
    @Published var shouldCheckConnectivity: Bool = true // Propiedad para controlar si se debe revisar la conectividad

    private var connectivityWorker = ConnectivityWorker()
    
    private var monitor: NWPathMonitor?
    private var timer: Timer?
    private var cancellables: Set<AnyCancellable> = []

    private init() {
        
        // Configura un temporizador para comprobar la conectividad cada segundo.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self, self.shouldCheckConnectivity else {
                self!.stopMonitoringConnectivity()
                return
            }
            self.startMonitoringConnectivity()
        }

        // Asegúrate de que el temporizador se ejecute incluso si la interfaz de usuario está inactiva.
        RunLoop.current.add(timer!, forMode: .common)
    }

    func startMonitoringConnectivity() {
        connectivityWorker.startMonitoringConnectivity { [weak self] isAvailable in
            DispatchQueue.main.async {
                self?.isInternetAvailable = isAvailable
            }
        }
    }
    
    func stopMonitoringConnectivity() {
        connectivityWorker.stopMonitoringConnectivity()
    }
}
