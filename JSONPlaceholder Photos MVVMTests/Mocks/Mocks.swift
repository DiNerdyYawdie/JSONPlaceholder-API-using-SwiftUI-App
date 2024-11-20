//

import Foundation
@testable import JSONPlaceholder_Photos_MVVM

class MockAPIServiceImpl: APIServices {
    
    var photosResult: Result<[PhotoModel], APIServiceError>?
    
    func fetchPhotos() async throws -> [PhotoModel] {
        switch photosResult {
        case .success(let photos):
            return photos
        case .failure(let error):
            throw error
        case nil:
            throw APIServiceError.custom("Unknown")
        }
    }
}
