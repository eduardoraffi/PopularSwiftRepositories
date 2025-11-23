import SwiftUI

internal protocol PullRequestListProtocol: AnyObject {
    func fetchPullRequests(fullName: String, prStatus: PullRequestStatus) async throws -> [PullRequestModel]?
}

internal protocol PullRequestListViewModelProtocol: ObservableObject {
    func fetchPullRequestList(prStatus: PullRequestStatus) async
}
