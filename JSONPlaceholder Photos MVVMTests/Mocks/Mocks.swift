//

import Foundation
@testable import JSONPlaceholder_Photos_MVVM

class MockAPIServiceImpl: APIServices {
    
    var photosResult: Result<[PhotoModel], APIServiceError>?
    var usersResult: Result<[UserModel], APIServiceError>?
    
    func fetchPhotos(endpoint: Endpoints) async throws -> [PhotoModel] {
        switch photosResult {
        case .success(let photos):
            return photos
        case .failure(let error):
            throw error
        case nil:
            throw APIServiceError.custom("Unknown")
        }
    }
    
    func fetchUsers(endpoint: Endpoints) async throws -> [UserModel] {
        switch usersResult {
        case .success(let users):
            return users
        case .failure(let error):
            throw error
        case nil:
            throw APIServiceError.custom("Unknown")
        }
    }
}
