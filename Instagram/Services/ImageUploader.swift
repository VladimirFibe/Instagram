import UIKit
import Firebase
import FirebaseStorage

struct ImageUploader {
    static func uploadImage(_ image: UIImage) async throws -> String? {
        guard let data = image.jpegData(compressionQuality: 0.7) else { return nil }
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile/\(filename).jpg")
        
        do {
            let _ = try await ref.putDataAsync(data)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            return nil
        }
    }
    
    static func uploadVideo(_ data: Data) async throws -> String? {
        let filename = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/video/\(filename)")
        let metatdata = StorageMetadata()
        metatdata.contentType = "video/quicktime"
        do {
            let _ = try await ref.putDataAsync(data, metadata: metatdata)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
