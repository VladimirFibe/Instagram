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
    func signInWithEmailPassword() async {
        do {
            let authResult = try await Auth.auth().signIn(withEmail: email, password: password)
            print(authResult)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func createUserWithEmailPassword() async {
        do {
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = authResult.user.uid
            let data: [String: String] = [
                "email": email,
                "username": username,
                "avatar": ""
            ]
            try await Firestore.firestore().collection("persons").document(uid).setData(data)
        } catch {
            print(error.localizedDescription)
        }
    }
}
