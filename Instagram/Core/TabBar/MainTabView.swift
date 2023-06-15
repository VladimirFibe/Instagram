import SwiftUI

enum MainTabs {
    case feed
    case search
    case upload
    case notification
    case profile
}

struct MainTabView: View {
    let person: Person
    @State private var selection = MainTabs.feed
    var body: some View {
        TabView(selection: $selection) {
            FeedView()
                .tabItem { Image(systemName: "house") }
                .tag(MainTabs.feed)
            SearchView()
                .tabItem { Image(systemName: "magnifyingglass") }
                .tag(MainTabs.search)

            UploadPostView(selection: $selection)
                .tabItem { Image(systemName: "plus.square") }
                .tag(MainTabs.upload)

            Text("Notification")
                .tabItem { Image(systemName: "heart") }
                .tag(MainTabs.notification)

            NavigationStack {
                    ProfileView(person: person)
            }
            .tabItem { Image(systemName: "person") }
            .tag(MainTabs.profile)
        }
    }
}

#Preview {
    MainTabView(person: Person(id: "", avatar: "", email: "", username: "", lastname: "", firstname: "", bio: ""))
}
