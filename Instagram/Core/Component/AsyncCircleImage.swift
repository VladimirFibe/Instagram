import SwiftUI

struct AsyncCircleImage: View {
    let url: String?
    let width: CGFloat
    var body: some View {
        VStack {
            if let url {
                AsyncImage(url: URL(string: url)) { image in
                    image.resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person").resizable()
            }
        }
        .frame(width: width, height: width)
        .clipShape(Circle())
    }
}

#Preview {
    AsyncCircleImage(url: "https://images.unsplash.com/photo-1430990480609-2bf7c02a6b1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80", width: 80)
}
