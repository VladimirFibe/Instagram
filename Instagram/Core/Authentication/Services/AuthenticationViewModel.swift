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
        try await Firestore.firestore().collection("persons").document(uid).setData(data)
    }
    
    func loadPersonData() async throws {
        
    }
    
    func signout() {
        
    }
}
