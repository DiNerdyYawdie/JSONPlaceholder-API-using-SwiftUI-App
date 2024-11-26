//

import Foundation

class CommentsListViewModel: ObservableObject {
    
    @Published var comments: [Comment] = []
    
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isLoading: Bool = false
    
    let service: APIServices
    let postID: String
    
    init(postID: String, service: APIServices) {
        self.postID = postID
        self.service = service
    }
    
    @MainActor
    func fetchComments() async {
        
        defer {
            isLoading = false
        }
        
        do {
            isLoading = true
            comments = try await service.fetchCommentsByPostID(endpoint: .commentsByPostID(postID))
            
        } catch {
            if let customError = error as? APIServiceError {
                errorMessage = customError.errorMessage
            }
            
            showErrorAlert.toggle()
        }
    }
}
