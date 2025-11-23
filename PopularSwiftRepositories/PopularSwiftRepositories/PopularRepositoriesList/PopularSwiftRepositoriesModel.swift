import Foundation

internal struct PopularSwiftRepositoriesModel: Codable {

    var total_count: Int
    var incomplete_results: Bool
    var items: [UserItem]

}

internal struct UserItem: Codable, Identifiable, Hashable {

    var id: Int
    var name: String
    var fullName: String
    var owner: Owner
    var description: String
    var stargazersCount: Int
    var forks: Int

    internal enum CodingKeys: String, CodingKey {
        case id, name,owner, description, forks
        case fullName = "full_name"
        case stargazersCount = "stargazers_count"
    }

}

internal struct Owner: Codable, Hashable {

    var avatarURL: String

    internal enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
    }

}

extension UserItem: UserProtocol {

    var avatarUrl: String {
        owner.avatarURL
    }

}
