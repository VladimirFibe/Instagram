import Foundation
import Firebase
import FirebaseFirestore

enum AuthenticatonState {
    case unauthenticated
    case authenticating
    case authenticated
}

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var email = "motiw@icloud.com"
    @Published var password = "123456"
    @Published var username = ""
    @Published var authenticationState = AuthenticatonState.unauthenticated
    @Published var user: User?
    @Published var person: Person?
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    init() {
        registerAuthStateHandler()
        Task {
            try await loadPersonData()
            let _ = try await UserService.fetchAllPersons()
        }
    }
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener({ auth, user in
                self.user = user
                self.authenticationState = user == nil ? .unauthenticated : .authenticated
            })
        }
    }
}

extension AuthenticationViewModel {
    func signInWithEmailPassword() async throws {
        authenticationState = .authenticating
        let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    func createUserWithEmailPassword() async throws {
        authenticationState = .authenticating
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
        do {
          try Auth.auth().signOut()
        } catch {}
    }
    
    func reset() {
        email = ""
        password = ""
        username = ""
    }
}
