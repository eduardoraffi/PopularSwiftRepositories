import SwiftUI

@Observable
internal final class Router: RouterProtocol {

    var navigationPath = NavigationPath()
    var isPresentingSheet: (Bool,String) = (false, "")

    internal func push(_ destination: Routes) {
        navigationPath.append(destination)
    }

    internal func pop() {
        navigationPath.removeLast()
        isPresentingSheet = (false, "")
    }

    internal func popToRoot() {
        navigationPath = NavigationPath()
        isPresentingSheet = (false, "")
    }

    internal func present(_ destination: Routes) {
        switch destination {
        case .pullRequestList(_):
            navigationPath.append(destination)
        case .pullRequestDetails(prUrl: let prUrl):
            isPresentingSheet = (true, prUrl)
        }
    }

}
