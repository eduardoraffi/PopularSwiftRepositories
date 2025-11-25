import SwiftUI

internal final class PopularRepositoriesViewModel: PopularRepositoryViewModelProtocol {

    @Published var popularRepositories: [UserItem] = []
    @Published var isLoading = true
    @Published var errorMessage: String?
    @Published var actualPage: Int = 1
    private var repository: PopularRepositoryProtocol

    init(repository: PopularRepositoryProtocol = PopularRepositoriesRepository()) {
        self.repository = repository
    }

    @MainActor
    internal func fetchPopularRepositories(_ shouldAppendNewItems: Bool = false,
                                           data: Data? = nil) async {
        if let recoveredList = loadFromSceneStorage(data),
           !shouldAppendNewItems {
            popularRepositories = recoveredList
            isLoading = false
            return
        }
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

    internal func saveToSceneStorage(_ popularRepositories: [UserItem]) -> Data? {
        try? JSONEncoder().encode(popularRepositories)
    }

    private func loadFromSceneStorage(_ data: Data?) -> [UserItem]? {
        if let data = data,
           let repoList = try? JSONDecoder().decode([UserItem].self, from: data) {
            return repoList
        }
        return nil
    }

}
