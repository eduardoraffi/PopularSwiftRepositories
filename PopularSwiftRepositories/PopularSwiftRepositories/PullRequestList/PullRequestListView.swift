import SwiftUI

struct PullRequestListView: View {

    @StateObject internal var viewModel: PullRequestListViewModel
    @Environment(Router.self) var router
    @State private var selectorStatus: PullRequestStatus = .open

    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text("❌ \(error)")
                    .foregroundStyle(.red)
            } else {
                if let items = viewModel.pullRequestList {
                    PullRequestStatusSelector(status: $selectorStatus)
                        .onChange(of: selectorStatus) {
                            Task {
                                await viewModel.fetchPullRequestList(prStatus: selectorStatus)
                            }
                        }
                    ScrollView {
                        LazyVStack {
                            if !items.isEmpty {
                                ForEach(items) { pullRequest in
                                    DefaultCardListView(userItem: pullRequest,
                                                        cardViewType: .prList)
                                    .onTapGesture {
                                        router.present(.pullRequestDetails(prUrl: pullRequest.htmlUrl))
                                    }
                                }
                            } else {
                                Text("No Opened pull requests yet")
                            }
                        }.padding()
                    }
                }
            }
        }
        .navigationTitle("Pull Requests")
        .task {
            await viewModel.fetchPullRequestList()
        }
    }

}

#Preview {

}
