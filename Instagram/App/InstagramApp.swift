import SwiftUI
import FirebaseCore
import FirebaseAuth
@main
struct InstagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            switch viewModel.authenticationState {
            case .authenticated:
                if let person = viewModel.person {
                    MainTabView(person: person)
                }
            case .unauthenticated:
                LoginView()
                    .environmentObject(viewModel)
            case .authenticating:
                ProgressView()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
