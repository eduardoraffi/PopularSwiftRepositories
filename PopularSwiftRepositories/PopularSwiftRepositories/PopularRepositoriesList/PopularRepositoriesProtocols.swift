import SwiftUI

internal protocol PopularRepositoryProtocol: AnyObject {
    func fetchPopularRepositories(page: Int) async throws -> PopularSwiftRepositoriesModel
}

internal protocol PopularRepositoryViewModelProtocol: ObservableObject {
    var popularRepositories: [UserItem] { get set }
    var isLoading: Bool { get set }
    var errorMessage: String? { get set }
    var actualPage: Int { get set }

    func fetchPopularRepositories(_ shouldAppendNewItems: Bool, data: Data?) async
    func loadNextPage() async
    func saveToSceneStorage(_ popularRepositories: [UserItem]) -> Data?
}

