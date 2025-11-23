import SwiftUI

internal protocol PopularRepositoryProtocol: AnyObject {
    func fetchPopularRepositories(page: Int) async throws -> PopularSwiftRepositoriesModel
}

internal protocol PopularRepositoryViewModelProtocol: ObservableObject {
    func fetchPopularRepositories() async
    func loadNextPage() async
}

