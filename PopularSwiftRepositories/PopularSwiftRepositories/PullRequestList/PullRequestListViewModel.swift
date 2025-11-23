import SwiftUI

internal final class PullRequestListViewModel: PullRequestListViewModelProtocol {

    @Published var pullRequestList: [PullRequestModel]?
    @Published var isLoading = true
    @Published var errorMessage: String?
    private var repository: PullRequestListProtocol
    private var userItem: UserItem

    init(repository: PullRequestListProtocol = PullRequestListRepository(), userItem: UserItem) {
        self.repository = repository
        self.userItem = userItem
    }

    @MainActor
    internal func fetchPullRequestList(prStatus: PullRequestStatus = .open) async {
        isLoading = true
        do {
            self.pullRequestList = try await repository.fetchPullRequests(fullName: userItem.fullName, prStatus: prStatus)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

}
