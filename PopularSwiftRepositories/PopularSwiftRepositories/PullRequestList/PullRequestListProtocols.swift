import SwiftUI

internal protocol PullRequestListProtocol: AnyObject {
    func fetchPullRequests(fullName: String, prStatus: PullRequestStatus) async throws -> [PullRequestModel]?
}

internal protocol PullRequestListViewModelProtocol: ObservableObject {
    var pullRequestList: [PullRequestModel]? { get set }
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
    func fetchPullRequestList(prStatus: PullRequestStatus) async
}
