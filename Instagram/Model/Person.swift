import Foundation
import FirebaseFirestoreSwift
import Firebase
struct Person: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var avatar: String?
    var email: String
    var username: String
    var lastname: String
    var firstname: String
    var bio: String
    
    var isCurrentPerson: Bool {
        if let currentUid = Auth.auth().currentUser?.uid, let id {
            return currentUid == id
        } else {
            return false
        }
    }
}
