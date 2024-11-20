//

import Foundation

struct PhotoModel: Decodable, Identifiable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: URL
    let thumbnailUrl: URL
}
