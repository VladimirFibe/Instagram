import SwiftUI
import Firebase

@MainActor
final class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchAllPosts()
    }
}
