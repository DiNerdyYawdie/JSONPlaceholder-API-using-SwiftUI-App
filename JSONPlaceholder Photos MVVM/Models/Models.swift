//

import Foundation

struct PhotoModel: Decodable, Identifiable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: URL
    let thumbnailUrl: URL
}

struct UserModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAddress
    let phone: String
    let website: String
    let company: Company
}

struct UserAddress: Decodable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
    let geo: UserGeo
}

struct UserGeo: Decodable {
    let lat: String
    let lng: String
}

struct Company: Decodable {
    let name: String
    let catchPhrase: String
    let bs: String
}

struct Post: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

struct Comment: Decodable, Identifiable {
    let id: Int
    let postId: Int
    let name: String
    let email: String
    let body: String
}

struct Todo: Decodable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    var completed: Bool
}
