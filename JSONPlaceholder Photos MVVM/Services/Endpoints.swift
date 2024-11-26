//

import Foundation

enum Endpoints {
    case photos
    case users
    case postsByUser(String)
    case commentsByPostID(String)
    case todos(String)
  
    var resource: String {
        switch self {
        case .photos:
            return "https://jsonplaceholder.typicode.com/photos"
        case .users:
            return "https://jsonplaceholder.typicode.com/users"
        case .postsByUser(let userID):
            return "https://jsonplaceholder.typicode.com/users/\(userID)/posts"
        case .commentsByPostID(let postID):
            return "https://jsonplaceholder.typicode.com/posts/\(postID)/comments"
        case .todos(let userID):
            return "https://jsonplaceholder.typicode.com/users/\(userID)/todos"
        }
    }
}
