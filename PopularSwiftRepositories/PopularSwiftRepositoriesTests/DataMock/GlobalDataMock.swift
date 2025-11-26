import Foundation

internal enum JsonFileNames: String {
    
    case popularRepositoriesResponse = "PopularRepositoriesResponse"
    case pullRequestListResponse = "PullRequestListResponse"
    case userItemListResponse = "UserItemListResponse"
    case popularRepositoriesResponseDecodingError = "PopularRepositoriesResponseDecodingError"
    case pullRequestListResponseDecodingError = "PullRequestListResponseDecodingError"
    
}

final class GlobalDataMock {

    static let shared = GlobalDataMock()

    internal func getPopularRepositoriesResponseData() -> Data? {
        Bundle.main.jsonData(fileName: .popularRepositoriesResponse)
    }

    internal func getUserItemListResponseData() -> Data? {
        Bundle.main.jsonData(fileName: .userItemListResponse)
    }

    internal func getPopularRepositoriesResponseDataDecodingError() -> Data? {
        Bundle.main.jsonData(fileName: .popularRepositoriesResponseDecodingError)
    }

    internal func getPullRequestListResponseData() -> Data? {
        Bundle.main.jsonData(fileName: .pullRequestListResponse)
    }

    internal func getPullRequestListResponseDataDecodingError() -> Data? {
        Bundle.main.jsonData(fileName: .pullRequestListResponseDecodingError)
    }

}
