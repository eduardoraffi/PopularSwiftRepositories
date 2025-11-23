import Foundation

enum Routes: Hashable {

    case pullRequestList(_ userItem: UserItem)
    case pullRequestDetails(prUrl: String)

}
