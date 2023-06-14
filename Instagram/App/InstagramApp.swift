import SwiftUI
import FirebaseCore
import FirebaseAuth
@main
struct InstagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            if Auth.auth().currentUser == nil {
                LoginView()
                    .environmentObject(viewModel)
            } else {
                MainTabView()
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
