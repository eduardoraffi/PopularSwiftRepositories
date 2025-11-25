import Foundation

internal protocol APIClientProtocol {
    func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case decodingError(Error)
    case serverError(Int)

    var errorDescription: String? {
        switch self {
        case .invalidURL: 
            return "Invalid URL"
        case .invalidResponse: 
            return "Invalid response from server"
        case let .decodingError(err):
            return "Decoding error: \(err.localizedDescription)"
        case let .serverError(code):
            return "Server error \(code)"
        }
    }
}

final class APIClient: APIClientProtocol {

    internal func request<T: Decodable>(_ urlRequest: URLRequest) async throws -> T {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.serverError(httpResponse.statusCode)
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }

}
