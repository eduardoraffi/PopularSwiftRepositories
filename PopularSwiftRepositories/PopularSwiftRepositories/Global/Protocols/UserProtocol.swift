import Foundation

internal protocol UserProtocol: Codable {

    var id: Int { get }
    var name: String { get }
    var fullName: String { get }
    var avatarUrl: String { get }
    var description: String { get }
    var stargazersCount: Int { get }
    var forks: Int { get }
    var creationDate: String { get }

}

extension UserProtocol {
    
    var fullName: String {
        ""
    }
    
    var stargazersCount: Int {
        0
    }
    
    var forks: Int {
        0
    }
    
    var creationDate: String {
        ""
    }

}
