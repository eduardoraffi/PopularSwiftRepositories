import Foundation

internal class PopularRepositoryViewModelProtocolSpy: PopularRepositoryViewModelProtocol {

    var popularRepositories: [UserItem]
    var isLoading: Bool
    var errorMessage: String?
    var actualPage: Int

    init(popularRepositories: [UserItem], isLoading: Bool, errorMessage: String? = nil, actualPage: Int) {
        self.popularRepositories = popularRepositories
        self.isLoading = isLoading
        self.errorMessage = errorMessage
        self.actualPage = actualPage
    }
    
    func fetchPopularRepositories(_ shouldAppendNewItems: Bool, data: Data?) async {
        
    }
    
    func loadNextPage() async {
        
    }
    
    func saveToSceneStorage(_ popularRepositories: [UserItem]) -> Data? {
        Data()
    }

}
