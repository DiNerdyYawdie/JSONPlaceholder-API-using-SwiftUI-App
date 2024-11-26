//

import Foundation

enum UserDetailSections: CaseIterable, Identifiable {
    case posts
    case about
    case todos
    
    var id: UUID {
        return UUID()
    }
    
    var title: String {
        switch self {
        case .posts:
            return "Posts"
        case .about:
            return "About"
        case .todos:
            return "To-Do's"
        }
    }
}
