import Foundation
import Firebase

struct UserService {
    static func fetchAllPersons() async throws -> [Person] {
        let snapshot = try await Firestore.firestore().collection("persons").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Person.self)}
    }
}
