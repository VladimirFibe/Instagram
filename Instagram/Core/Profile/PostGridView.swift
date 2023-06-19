import SwiftUI
import Kingfisher

struct PostGridView: View {
    @StateObject var viewModel: PostGridViewModel
    init(person: Person) {
        self._viewModel = StateObject(wrappedValue: PostGridViewModel(person: person))
    }
    
    private let gridItmes: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    var body: some View {
        LazyVGrid(columns: gridItmes, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
            }
        }
    }
}
