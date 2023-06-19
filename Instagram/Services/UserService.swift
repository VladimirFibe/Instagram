import Foundation
import Firebase

struct UserService {
    
    static func fetchPerson(with uid: String) async throws -> Person {
        let snapshot = try await Firestore.firestore().collection("persons").document(uid).getDocument()
        return try snapshot.data(as: Person.self)
    }
    static func fetchAllPersons() async throws -> [Person] {
        let snapshot = try await Firestore.firestore().collection("persons").getDocuments()
        return snapshot.documents.compactMap { try? $0.data(as: Person.self)}
    }
}
