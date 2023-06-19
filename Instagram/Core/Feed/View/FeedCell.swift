import SwiftUI

struct FeedCell: View {
    let post: Post
    var body: some View {
        VStack {
            HStack {
                CircularImageView(url: post.person?.avatar, width: .xSmall)
                Text(post.person?.username ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading, 8)
            AsyncImage(url: URL(string: post.imageUrl)) { image in
                image.resizable()
                    .scaledToFill()
                    .frame(height: 400)
                    .clipShape(Rectangle())
            } placeholder: {
                ProgressView()
            }
            
            HStack(spacing: 16.0) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                Button {
                    
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                    
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            
            Text("23 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
            
            Group {
                Text("\(post.person?.username ?? "") ").fontWeight(.semibold) + Text(post.caption)
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 8)
            
            Text("6h ago")
                .font(.footnote)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 8)
        }
    }
}
