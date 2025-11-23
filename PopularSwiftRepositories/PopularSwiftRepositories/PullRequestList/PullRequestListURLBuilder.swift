import Foundation

internal enum PullRequestListURLBuilder: URLBuilderProtocol {

    case openedPullRequestList(_ fullName: String)
    case closedPullRequestList(_ fullName: String)

    var scheme: String {
        "https"
    }

    var baseURL: String {
        APIConstants.baseURL
    }

    var path: String {
        switch self {
        case let .openedPullRequestList(fullName),
            let .closedPullRequestList(fullName):
            return String(format: APIConstants.listOfPullRequests, fullName)
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .openedPullRequestList(_):
            [URLQueryItem(name: "state", value: "open")]
        case .closedPullRequestList(_):
            [URLQueryItem(name: "state", value: "closed")]
        }
    }

    var method: String {
        "GET"
    }

    func urlRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems

        guard let url = components.url else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = method
        return request
    }

}
