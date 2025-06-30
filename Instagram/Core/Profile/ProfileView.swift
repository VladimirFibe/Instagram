import SwiftUI

struct ProfileView: View {
    var body: some View {
        HStack {
            Image("jsoundo")
                .resizable()
                .scaledToFit()
            HStack {
                Text("John Soundo")
                    .font(.headline)
                Text("@jsoundo")
                    .font(.caption)
            }
        }
    }
}

#Preview {
    ProfileView()
}
