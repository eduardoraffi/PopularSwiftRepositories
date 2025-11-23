import SwiftUI

internal final class PopularRepositoriesViewModel: ObservableObject {

    @Published var popularRepositories: [UserItem] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    private var repository: PopularRepositoryProtocol
    private var actualPage: Int = 1

    init(repository: PopularRepositoryProtocol = PopularRepositoriesListRepository()) {
        self.repository = repository
    }

    @MainActor
    internal func fetchPopularRepositories(_ shouldAppendNewItems: Bool = false) async {
        do {
            let response = try await repository.fetchPopularRepositories(page: actualPage)
            if shouldAppendNewItems {
                self.popularRepositories.append(contentsOf: response.items)
            } else {
                self.popularRepositories = response.items
            }
        } catch {
            if shouldAppendNewItems && actualPage > 1 { actualPage -= 1 }
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

    @MainActor
    internal func loadNextPage() async {
        actualPage += 1
        await fetchPopularRepositories(true)
    }

}
