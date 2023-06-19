import SwiftUI
import PhotosUI
import Firebase
@MainActor
final class UploadPostViewModel: ObservableObject {
    @Published var profileImage: Image?
    private var uiImage: UIImage?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        uiImage = UIImage(data: data)
        guard let uiImage else { return }
        profileImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid,
                let uiImage
        else { return }
        guard let url = try await ImageUploader.uploadImage(uiImage) else { return }
        let post = Post(ownerUid: uid, caption: caption, likes: 0, imageUrl: url)
        let _ = try Firestore.firestore().collection("posts").addDocument(from: post)
    }
}
