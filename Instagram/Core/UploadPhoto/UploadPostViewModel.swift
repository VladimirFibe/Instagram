import SwiftUI
import PhotosUI

@MainActor
final class UploadPostViewModel: ObservableObject {
    @Published var profileImage: Image?
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) }}
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        profileImage = Image(uiImage: uiImage)
    }
}
