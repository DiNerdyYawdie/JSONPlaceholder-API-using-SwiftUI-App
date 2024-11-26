//

import Foundation

protocol APIServices {
    func fetchPhotos(endpoint: Endpoints) async throws -> [PhotoModel]
    func fetchUsers(endpoint: Endpoints) async throws -> [UserModel]
    func fetchPostsByUserID(endpoint: Endpoints) async throws -> [Post]
    func fetchCommentsByPostID(endpoint: Endpoints) async throws -> [Comment]
    func fetchTodosByUserID(endpoint: Endpoints) async throws -> [Todo]
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
    
    func fetchPhotos(endpoint: Endpoints = .photos) async throws -> [PhotoModel] {
        
        guard let url = URL(string: endpoint.resource) else {
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
    
    func fetchUsers(endpoint: Endpoints = .users) async throws -> [UserModel] {
        
        guard let url = URL(string: endpoint.resource) else {
            throw APIServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIServiceError.invalidResponse
            }
            
            let users = try JSONDecoder().decode([UserModel].self, from: data)
            
            return users
        } catch {
            throw APIServiceError.custom(error.localizedDescription)
        }
    }
    
    func fetchPostsByUserID(endpoint: Endpoints) async throws -> [Post] {
        
        guard let url = URL(string: endpoint.resource) else {
            throw APIServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIServiceError.invalidResponse
            }
            
            let posts = try JSONDecoder().decode([Post].self, from: data)
            
            return posts
        } catch {
            throw APIServiceError.custom(error.localizedDescription)
        }
    }
    
    func fetchCommentsByPostID(endpoint: Endpoints) async throws -> [Comment] {
        
        guard let url = URL(string: endpoint.resource) else {
            throw APIServiceError.invalidURL
        }
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIServiceError.invalidResponse
            }
            
            let comments = try JSONDecoder().decode([Comment].self, from: data)
            return comments
        } catch {
            throw APIServiceError.custom(error.localizedDescription)
        }
    }
    
    func fetchTodosByUserID(endpoint: Endpoints) async throws -> [Todo] {
        guard let url = URL(string: endpoint.resource) else {
            throw APIServiceError.invalidResponse
        }
        
        do {
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw APIServiceError.invalidResponse
            }
            
            let todos = try JSONDecoder().decode([Todo].self, from: data)
            return todos
        } catch {
            throw APIServiceError.custom(error.localizedDescription)
        }
    }
}
