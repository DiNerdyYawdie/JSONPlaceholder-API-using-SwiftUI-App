//

import Foundation

class UsersListViewModel: ObservableObject {
    
    @Published var users: [UserModel] = []
    
    @Published var errorMessage: String = ""
    @Published var showErrorAlert: Bool = false
    
    @Published var isLoading: Bool = false
    
    let services: APIServices
    
    init(services: APIServices = APIServicesImpl()) {
        self.services = services
    }
    
    @MainActor
    func fetchUsers() async {
        
        defer {
            isLoading = false
        }
        
        do {
           isLoading = true
            users = try await services.fetchUsers(endpoint: .users)
            
        } catch {
            if let customError = error as? APIServiceError {
                errorMessage = customError.errorMessage
            }
            
            showErrorAlert.toggle()
        }
    }
}
