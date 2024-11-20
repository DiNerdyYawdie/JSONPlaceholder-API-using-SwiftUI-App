//

import Foundation

protocol APIServices {
    func fetchPhotos() async throws -> [PhotoModel]
}

enum APIServiceError: Error {
    case invalidURL
    case invalidResponse
    case custom(String)
    
    var errorMessage: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid Response"
        case .custom(let errorMessage):
            return "Something went wrong \(errorMessage)"
        }
    }
}

class APIServicesImpl: APIServices {
    
    private let endpoint: String = "https://jsonplaceholder.typicode.com/photos"
    
    func fetchPhotos() async throws -> [PhotoModel] {
        
        guard let url = URL(string: endpoint) else {
            throw APIServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIServiceError.invalidResponse
            }
            
            let photos = try JSONDecoder().decode([PhotoModel].self, from: data)
            return photos
        } catch {
            throw APIServiceError.custom(error.localizedDescription)
        }
        
    }
}
