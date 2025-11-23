import SwiftUI

struct PopularRepositoriesListView: View {

    @StateObject internal var viewModel: PopularRepositoriesViewModel = PopularRepositoriesViewModel()
    @Environment(Router.self) var router

    var body: some View {
        Group {
            if viewModel.isLoading {
                ProgressView()
            } else if let error = viewModel.errorMessage {
                Text("❌ \(error)")
                    .foregroundStyle(.red)
            } else {
                if viewModel.popularRepositories.count != 0 {
                    ScrollView {
                        LazyVStack {
                            ForEach(viewModel.popularRepositories) { repository in
                                DefaultCardListView(userItem: repository)
                                    .onTapGesture {
                                        router.push(.pullRequestList(repository))
                                    }
                            }
                            refresherView()
                        }.padding()
                    }.scrollBounceBehavior(.basedOnSize)
                }
            }
        }.navigationTitle("Swift Top Repos")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.fetchPopularRepositories()
            }
    }

    private func refresherView() -> some View {
        return Color.clear
            .frame(height: 1)
            .onAppear {
                if viewModel.isLoading == false {
                    Task {
                        await viewModel.loadNextPage()
                    }
                }
            }
    }

}
