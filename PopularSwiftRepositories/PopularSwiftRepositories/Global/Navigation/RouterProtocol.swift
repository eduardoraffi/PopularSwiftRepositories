import SwiftUI

internal protocol RouterProtocol: ObservableObject {
    var navigationPath: NavigationPath { get }
    func push(_ destination: Routes)
    func pop()
    func popToRoot()
}
