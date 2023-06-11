import Foundation
import FirebaseFirestoreSwift

struct Person: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var avatar: String?
    var email: String
    var username: String
    var lastname: String
    var firstname: String
    var bio: String
}
