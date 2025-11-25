import Foundation

internal enum MockedError: Error {
    case genericError
}

final class APIClientStub: APIClientProtocol {

    var data: Data?
    var responseCode: Int = 200

    func request<T>(_ urlRequest: URLRequest) async throws -> T where T : Decodable {
        guard let data = data else {
            throw NSError(domain: "APIClientStub",
                          code: responseCode,
                          userInfo: [
                            NSLocalizedDescriptionKey: APIError.invalidResponse
                          ])
        }
        if !(200...299).contains(responseCode) {
            throw NSError(domain: "APIClientStub",
                          code: responseCode,
                          userInfo: [
                            NSLocalizedDescriptionKey: APIError.serverError(responseCode)
                          ])
        }
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }

}
