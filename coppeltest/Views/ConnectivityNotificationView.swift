import SwiftUI

struct ConnectivityNotificationView: View {
    var body: some View {
        Text("noInternetConnection")
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
    }
}
