import Foundation
import Network
import Combine

class ConnectivityViewModel: ObservableObject {
    @Published var isInternetAvailable: Bool = true

    private var monitor: NWPathMonitor?
    private var cancellables: Set<AnyCancellable> = []

    init() {
        
        // Configura un temporizador para comprobar la conectividad cada segundo.
        let timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.checkInternetConnectivity()
        }
        
        // Asegúrate de que el temporizador se ejecute incluso si la interfaz de usuario está inactiva.
        RunLoop.current.add(timer, forMode: .common)
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
