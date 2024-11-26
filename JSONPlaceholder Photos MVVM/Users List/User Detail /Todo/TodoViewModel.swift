//

import Foundation

class TodoViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    let userID: String
    let service: APIServices
    
    init(userID: String, service: APIServices) {
        self.userID = userID
        self.service = service
    }
    
    @MainActor
    func fetchTodos() async {
        
        do {
            todos = try await service.fetchTodosByUserID(endpoint: .todos(userID))
            
        } catch {
            if let customError = error as? APIServiceError {
                errorMessage = customError.errorMessage
            } else {
                errorMessage = error.localizedDescription
            }
            
            showErrorAlert.toggle()
        }
    }
    
    func handleTodoUpdate(todoID: String) {
        if let index = todos.firstIndex(where: { String($0.id) == todoID }) {
            todos[index].completed.toggle()
        }
    }
    
}
