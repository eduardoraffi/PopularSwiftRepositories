import Foundation

internal class PullRequestListRepository: PullRequestListProtocol {

    private var apiClient: APIClientProtocol

    internal init(apiClient: APIClientProtocol = APIClient()) {
        self.apiClient = apiClient
    }

    func fetchPullRequests(fullName: String, prStatus: PullRequestStatus) async throws -> [PullRequestModel]? {
        var urlBuilder: PullRequestListURLBuilder
        switch prStatus {
        case .open:
            urlBuilder = PullRequestListURLBuilder.openedPullRequestList(fullName)
        case .closed:
            urlBuilder = PullRequestListURLBuilder.closedPullRequestList(fullName)
        }
        if let urlRequest = urlBuilder.urlRequest() {
            let response: [PullRequestModel] = try await apiClient.request(urlRequest)
            return response
        }
        throw APIError.invalidURL
    }

}
