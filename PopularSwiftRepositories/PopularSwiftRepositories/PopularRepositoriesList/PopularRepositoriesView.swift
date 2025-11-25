import SwiftUI

struct PopularRepositoriesView<ViewModel: PopularRepositoryViewModelProtocol>: View {

    @ObservedObject private var viewModel: ViewModel
    @Environment(Router.self) private var router
    @SceneStorage("LastClickedElement") private var lastClickedElement: Int?
    @SceneStorage("ActualRepoList") private var actualRepoList: Data?
    @SceneStorage("ActualPage") private var actualPage: Int = 1
    @State private var reloadAfterError = false

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        Group {
            if viewModel.isLoading {
                ScrollView {
                    ShimmerViewList().padding()
                }
            } else if let error = viewModel.errorMessage {
                if actualPage > 1 {
                    buildCells()
                }
                VStack {
                    GenericErrorView(errorDescription: error, reloadAction: $reloadAfterError)
                        .onChange(of: reloadAfterError) {
                            Task {
                                await viewModel.fetchPopularRepositories(false, data: actualRepoList)
                            }
                        }
                }.frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
            } else if viewModel.popularRepositories.count != 0 {
                buildCells()
            } else {
                VStack {
                    Text("Can't find repositories. Please try again later.")
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color.primaryTextColor)
                }.background(Color.primaryBackgroundColor)
            }
        }.navigationTitle("Swift Top Repos")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                viewModel.actualPage = actualPage
                await viewModel.fetchPopularRepositories(false, data: actualRepoList)
            }
            .onChange(of: viewModel.popularRepositories) {
                actualRepoList = viewModel.saveToSceneStorage(viewModel.popularRepositories)
            }
            .onChange(of: viewModel.actualPage) {
                actualPage = viewModel.actualPage
            }
            .background(Color.primaryBackgroundColor)
    }

    private func buildCells() -> some View {
        Group {
            ScrollViewReader { reader in
                ScrollView {
                    LazyVStack {
                        ForEach(viewModel.popularRepositories) { repository in
                            DefaultCardListView(userItem: repository)
                                .onTapGesture {
                                    lastClickedElement = repository.id
                                    router.push(.pullRequestList(repository))
                                }
                        }
                        refresherView()
                    }.padding()
                }.scrollBounceBehavior(.basedOnSize)
                    .onAppear {
                        if let lastClickedElement = lastClickedElement {
                            Task { @MainActor in
                                reader.scrollTo(lastClickedElement, anchor: .top)
                            }
                        }
                    }
            }
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
