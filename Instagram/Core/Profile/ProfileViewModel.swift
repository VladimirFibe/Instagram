import Firebase
import FirebaseFirestore

final class ProfileViewModel: ObservableObject {
    func loadUserData() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore
            .firestore()
            .collection("persons")
            .document(uid)
            .getDocument()
        
    }
}
