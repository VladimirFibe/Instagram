import SwiftUI
import PhotosUI
import Firebase

@MainActor
final class EditProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var bio = ""
    @Published var profileImage: Image?
    @Published var person: Person?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    
    private var uiImage: UIImage?
    init() {
        Task {
            try await loadPersonData()
            name = person?.firstname ?? ""
            bio = person?.bio ?? ""
        }
    }
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        uiImage = UIImage(data: data)
        guard let uiImage else { return }
        profileImage = Image(uiImage: uiImage)
    }
    
    func loadPersonData() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore
            .firestore()
            .collection("persons")
            .document(uid)
            .getDocument()
        person = try? snapshot.data(as: Person.self)
    }
    
    func updatePersonData() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        var data = [
            "firstname": name,
            "bio": bio
        ]
        if let uiImage, let url = try await ImageUploader.uploadImage(uiImage) {
            data["avatar"] = url
        }
        try await Firestore.firestore().collection("persons").document(uid).updateData(data)
    }
}
