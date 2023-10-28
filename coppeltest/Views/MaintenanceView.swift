import SwiftUI

struct MaintenanceView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.7).ignoresSafeArea()
            VStack {
                Text("maintenanceInProgress")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}

struct MaintenanceView_Previews: PreviewProvider {
    static var previews: some View {
        MaintenanceView()
    }
}

