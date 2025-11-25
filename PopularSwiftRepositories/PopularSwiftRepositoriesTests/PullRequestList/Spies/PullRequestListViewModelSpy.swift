import Foundation

internal class PullRequestListViewModelSpy: PullRequestListViewModelProtocol {

    var pullRequestList: [PullRequestModel]?
    var isLoading: Bool = false
    var errorMessage: String?

    func fetchPullRequestList(prStatus: PullRequestStatus) async { }

}
