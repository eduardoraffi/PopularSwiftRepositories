import XCTest

final class PopularRepositoriesViewModelTestCase: XCTestCase {

    var sut: PopularRepositoriesViewModel!
    var repositorySpy: PopularRepositoryProtocol!

    override func setUp() async throws {
        repositorySpy = PopularRepositoryProtocolSpy()
        sut = PopularRepositoriesViewModel(repository: repositorySpy)
    }

    override func tearDown() {
        repositorySpy = nil
        sut = nil
    }

    func testFetchPopularRepositories() async {
        await sut.fetchPopularRepositories()
        XCTAssertTrue(!sut.popularRepositories.isEmpty)
    }

    func testFetchPopularRepositoriesWithErrorOnPage100() async {
        sut.actualPage = 100
        await sut.fetchPopularRepositories(true)
        XCTAssertNotNil(sut.errorMessage)
    }

    func testLoadNextPage() async {
        await sut.loadNextPage()
        XCTAssertTrue(!sut.popularRepositories.isEmpty)
    }

    func testSaveToSceneStorage() {
        let data = sut.saveToSceneStorage(PopularSwiftRepositoriesModel.userItemMockList())
        XCTAssertNotNil(data)
    }

    func testLoadFromScneStorage() async {
        if let userItemList = GlobalDataMock.shared.getUserItemListResponseData() {
            await sut.fetchPopularRepositories(false , data: userItemList)
            XCTAssertTrue(!sut.popularRepositories.isEmpty)
            return
        }
        XCTFail()
    }

}
