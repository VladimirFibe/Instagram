import SwiftUI
import Kingfisher

enum CirclarImageSize {
    case xSmall
    case small
    case medium
    case large
    
    var dimension: CGFloat {
        switch self {
        case .xSmall: return 40
        case .small: return 48
        case .medium: return 64
        case .large: return 80
        }
    }
}
struct CircularImageView: View {
    let url: String?
    var width: CirclarImageSize = .large
    var body: some View {
            KFImage(URL(string: url ?? ""))
            .resizable()
            .scaledToFill()
            .frame(width: width.dimension, height: width.dimension)
            .clipShape(Circle())
    }
}

#Preview {
    CircularImageView(url: "https://images.unsplash.com/photo-1687120487185-7f267fa1ae31?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80")
}
