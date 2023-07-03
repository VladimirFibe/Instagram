import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestoreSwift
import AVKit

struct Video: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    let owner: String
    let video: String
}
struct VideoFeedView: View {
    @StateObject var viewModel = VideoFeedViewModel()
//    @FirestoreQuery(collectionPath: "videos") var videos: [Video]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                ForEach(viewModel.videos) { video in
                    if let url = URL(string: video.video) {
                        VideoPlayer(player: AVPlayer(url: url))
                            .frame(height: 250)
                    }
                }
                PhotosPicker(
                    selection: $viewModel.selectedItem,
                    matching: .any(of: [.videos, .not(.images)])) {
                    Text("Add")
                }
            }
            .refreshable {
                Task { try await viewModel.fetchVideos() } 
            }
            .navigationTitle("Video")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    PhotosPicker(
                        selection: $viewModel.selectedItem,
                        matching: .any(of: [.videos, .not(.images)])) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    VideoFeedView()
}
