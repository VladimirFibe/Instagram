import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    var body: some View {
        VStack {
            Text("\(value)").font(.subheadline)
                .fontWeight(.semibold)
            Text("\(title)").font(.footnote)
        }
        .frame(maxWidth: .infinity)
    }
}
