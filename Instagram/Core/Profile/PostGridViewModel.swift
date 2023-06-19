import Foundation

@MainActor
final class PostGridViewModel: ObservableObject {
    private let person: Person
    @Published var posts = [Post]()
    
    init(person: Person) {
        self.person = person
        Task { try await fetchPosts()}
    }
    
    func fetchPosts() async throws {
        self.posts = try await PostService.fetchUserPosts(uid: person.id)
    }
}
