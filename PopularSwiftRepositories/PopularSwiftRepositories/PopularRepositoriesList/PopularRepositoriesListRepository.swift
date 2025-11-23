import Foundation

internal class PopularRepositoriesListRepository: PopularRepositoryProtocol {

    private var apiClient: APIClientProtocol

    internal init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchPopularRepositories(page: Int) async throws -> PopularSwiftRepositoriesModel {
        if let urlRequest = PopularSwiftRepositoriesURLBuilder.searchRepositories(pageNumber: page).urlRequest() {
            let response: PopularSwiftRepositoriesModel = try await apiClient.request(urlRequest)
            return response
        }
        throw APIError.invalidURL
    }

}
