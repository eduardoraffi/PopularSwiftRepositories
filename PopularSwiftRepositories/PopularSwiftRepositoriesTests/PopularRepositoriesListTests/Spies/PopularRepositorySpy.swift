final class PopularRepositoryProtocolSpy: PopularRepositoryProtocol {

    func fetchPopularRepositories(page: Int) async throws -> PopularSwiftRepositoriesModel {
        if page == 100 {
            throw MockedError.genericError
        }
        return PopularSwiftRepositoriesModel.mock()
    }

}
