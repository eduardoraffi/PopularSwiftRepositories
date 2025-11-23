import Foundation

internal enum PopularSwiftRepositoriesURLBuilder: URLBuilderProtocol {

    case searchRepositories(pageNumber: Int)

    var scheme: String {
        "https"
    }

    var baseURL: String {
        APIConstants.baseURL
    }

    var path: String {
        switch self {
        case .searchRepositories:
            return APIConstants.searchRepositories
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case let .searchRepositories(pageNumber):
            [
                URLQueryItem(name: "q", value: "language:Swift"),
                URLQueryItem(name: "sort", value: "stars"),
                URLQueryItem(name: "page", value: "\(pageNumber)"),
                URLQueryItem(name: "per_page", value: "\(10)")
            ]
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
