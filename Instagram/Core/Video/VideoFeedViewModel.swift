import SwiftUI
import PhotosUI
import Firebase
import FirebaseFirestoreSwift

class VideoFeedViewModel: ObservableObject {
    @Published var videos = [Video]()
    @Published var selectedItem: PhotosPickerItem? {
        didSet {
            Task { try await uploadVideo()}
        }
    }
    
    init() {
        Task { try await fetchVideos()}
    }
    
    func uploadVideo() async throws {
        guard let item = selectedItem,
              let videoData = try await item.loadTransferable(type: Data.self),
              let uid = Auth.auth().currentUser?.uid
        else { return }
        guard let url = try await ImageUploader.uploadVideo(videoData) else { return }
        try await Firestore.firestore().collection("videos").document().setData(["video": url,
                                                                                 "owner": uid])
        print("DEBUG: Video daata is \(videoData)", url)
    }
    
    @MainActor
    func fetchVideos() async throws {
        let snapshot = try await Firestore.firestore().collection("videos").getDocuments()
        self.videos = snapshot.documents.compactMap({ try? $0.data(as: Video.self)})
    }
}
