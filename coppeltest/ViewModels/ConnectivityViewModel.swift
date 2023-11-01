import Foundation
import Network
import Combine

class ConnectivityViewModel: ObservableObject {
    
    static let shared = ConnectivityViewModel() // Instancia única (singleton)

    @Published var isInternetAvailable: Bool = true
    @Published var shouldCheckConnectivity: Bool = true // Propiedad para controlar si se debe revisar la conectividad

    private var monitor: NWPathMonitor?
    private var timer: Timer?
    private var cancellables: Set<AnyCancellable> = []

    private init() {
        // Configura un temporizador para comprobar la conectividad cada segundo.
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self, self.shouldCheckConnectivity else {
                return
            }
            self.checkInternetConnectivity()
        }

        // Asegúrate de que el temporizador se ejecute incluso si la interfaz de usuario está inactiva.
        RunLoop.current.add(timer!, forMode: .common)
    }

    private func checkInternetConnectivity() {
        monitor = NWPathMonitor()
        let queue = DispatchQueue(label: "ConnectivityMonitor")
        monitor?.start(queue: queue)

        let subject = PassthroughSubject<NWPath, Never>()

        monitor?.pathUpdateHandler = { path in
            subject.send(path)
        }

        subject
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { path in
                self.isInternetAvailable = path.status == .satisfied
            })
            .store(in: &cancellables)
    }
}
