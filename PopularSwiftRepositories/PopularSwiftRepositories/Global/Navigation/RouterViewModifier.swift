import SwiftUI

struct RouterViewModifier: ViewModifier {
    @State private var router = Router()

    func body(content: Content) -> some View {
        NavigationStack(path: $router.navigationPath) {
            content
                .environment(router)
                .navigationDestination(for: Routes.self) { route in
                    routeView(for: route)
                }
                .sheet(isPresented: $router.isPresentingSheet.0) {
                    NavigationStack {
                        PullRequestDetailsView(urlString: router.isPresentingSheet.1)
                            .navigationTitle("Selected pull request")
                            .environment(router)
                    }
                }
        }
    }

    private func routeView(for route: Routes) -> some View {
        Group {
            switch route {
            case let .pullRequestList(userItem):
                PullRequestListView(viewModel: PullRequestListViewModel(userItem: userItem))
            case let .pullRequestDetails(url):
                PullRequestDetailsView(urlString: url)
            }
        }.environment(router)
    }

}
