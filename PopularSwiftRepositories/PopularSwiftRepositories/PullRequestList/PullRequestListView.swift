import SwiftUI

struct PullRequestListView<ViewModel: PullRequestListViewModelProtocol>: View {

    @ObservedObject private var viewModel: ViewModel
    @Environment(Router.self) private var router
    @State private var selectorStatus: PullRequestStatus = .open
    @State private var reloadAfterError = false

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Group {
            if viewModel.isLoading {
                VStack {
                    PullRequestStatusSelector(status: $selectorStatus)
                    ScrollView {
                        ShimmerViewList().padding()
                    }
                }
            } else if let error = viewModel.errorMessage {
                VStack {
                    GenericErrorView(errorDescription: error, reloadAction: $reloadAfterError)
                        .onChange(of: reloadAfterError) {
                            Task {
                                await viewModel.fetchPullRequestList(prStatus: selectorStatus)
                            }
                        }
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            } else {
                if let items = viewModel.pullRequestList {
                    VStack {
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
                                        .foregroundColor(.primaryTextColor)
                                        .fontWeight(.bold)
                                }
                            }.padding()
                        }
                    }
                }
            }
        }
        .navigationTitle("Pull Requests")
        .background(Color.primaryBackgroundColor)
        .task {
            await viewModel.fetchPullRequestList(prStatus: selectorStatus)
        }
    }

}
