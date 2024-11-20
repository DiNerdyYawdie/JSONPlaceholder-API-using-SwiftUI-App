//

import Foundation

class PhotosListViewModel: ObservableObject {
    
    @Published var photos: [PhotoModel] = []
    
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    @Published var isLoading: Bool = false
    
    let services: APIServices
    
    init(services: APIServices = APIServicesImpl()) {
        self.services = services
    }
    
    @MainActor
    func fetchPhotos() async {
        
        defer {
            isLoading = false
        }
        
        do {
            isLoading = true
            photos = try await services.fetchPhotos()
    
        } catch {
            if let customError = error as? APIServiceError {
                errorMessage = customError.errorMessage
            } else {
                errorMessage = error.localizedDescription
            }
            
            showErrorAlert.toggle()
        }
    }
}
