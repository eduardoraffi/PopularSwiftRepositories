import Foundation

internal class PopularRepositoryViewModelSpy: PopularRepositoryViewModelProtocol {

    @Published var popularRepositories: [UserItem] = []
    @Published var isLoading: Bool = true
    @Published var errorMessage: String?
    @Published var actualPage: Int = 1

    func fetchPopularRepositories(_ shouldAppendNewItems: Bool, data: Data?) {
        popularRepositories = PopularSwiftRepositoriesModel.userItemMockList()
    }
    
    func loadNextPage() {
        fetchPopularRepositories(true, data: nil)
    }
    
    func saveToSceneStorage(_ popularRepositories: [UserItem]) -> Data? {
        Data()
    }

}
