import Foundation

internal struct PullRequestModel: Codable, Identifiable {

    var id: Int
    var htmlUrl: String
    var title: String
    var user: User
    var body: String?
    var createdAt: String

    internal enum CodingKeys: String, CodingKey {
        case id, title, user, body
        case htmlUrl = "html_url"
        case createdAt = "created_at"
        
    }

}

internal struct User: Codable {

    var id: Int
    var login: String
    var avatarUrl: String

    internal enum CodingKeys: String, CodingKey {
        case id, login
        case avatarUrl = "avatar_url"
    }

}

extension PullRequestModel: UserProtocol {

    var name: String {
        title
    }
    
    var fullName: String {
        user.login
    }

    var avatarUrl: String {
        user.avatarUrl
    }

    var description: String {
        body ?? "Empty commit message."
    }

    var creationDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

        if let date = formatter.date(from: createdAt) {
            return date.description(with: .current)
        } else {
            return ""
        }
    }

}
