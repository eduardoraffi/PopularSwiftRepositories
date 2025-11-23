import Foundation

protocol URLBuilderProtocol {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var method: String { get }

    func urlRequest() -> URLRequest?
}
