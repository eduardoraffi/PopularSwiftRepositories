import SwiftUI

internal final class PullRequestListViewModel: PullRequestListViewModelProtocol {

    @Published internal var pullRequestList: [PullRequestModel]?
    @Published internal var isLoading = true
    @Published internal var errorMessage: String?
    private var repository: PullRequestListProtocol
    private var userItem: UserItem

    init(repository: PullRequestListProtocol = PullRequestListRepository(), userItem: UserItem) {
        self.repository = repository
        self.userItem = userItem
    }

    @MainActor
    internal func fetchPullRequestList(prStatus: PullRequestStatus) async {
        isLoading = true
        do {
            self.pullRequestList = try await repository.fetchPullRequests(fullName: userItem.fullName, prStatus: prStatus)
        } catch {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

}
