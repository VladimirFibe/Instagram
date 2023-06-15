import Foundation
import Firebase
import FirebaseFirestore

enum AuthenticatonState {
    case unauthenticated
    case authenticating
    case authenticated
}

//@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var authenticationState = AuthenticatonState.unauthenticated
    @Published var user: User?
    @Published var person: Person?
    
    init() {
        Task {
            try await loadPersonData()
            let _ = try await UserService.fetchAllPersons()
        }
    }
}

extension AuthenticationViewModel {
    func signInWithEmailPassword() async throws {
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        print(authResult)
        
    }
    
    func createUserWithEmailPassword() async throws {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let uid = authResult.user.uid
        let data: [String: String] = [
            "email": email,
            "username": username,
            "avatar": "",
            "firstname": "",
            "lastname": "",
            "bio": ""
        ]
        reset()
        try await Firestore.firestore().collection("persons").document(uid).setData(data)
        
    }
    @MainActor
    func loadPersonData() async throws {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            let snapshot = try await Firestore
                .firestore()
                .collection("persons")
                .document(uid)
                .getDocument()
        person = try? snapshot.data(as: Person.self)
        
            
    }
    
    func signout() {
        
    }
    
    func reset() {
        email = ""
        password = ""
        username = ""
    }
}
