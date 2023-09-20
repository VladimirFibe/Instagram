import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            VStack {
                Text("Hello, World!")
            }

            Button(action: {}, label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(height: 32)
                    .frame(maxWidth: .infinity)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
                    .padding(.horizontal)
            })
            Divider()
        }
    }
}

#Preview {
    ProfileView()
}
