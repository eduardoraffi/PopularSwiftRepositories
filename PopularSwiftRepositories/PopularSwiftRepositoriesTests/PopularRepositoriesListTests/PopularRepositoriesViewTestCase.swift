import XCTest
import SwiftUI
import SnapshotTesting

final class PopularRepositoriesViewTestCase: XCTestCase {

    var sut: PopularRepositoriesView<PopularRepositoryViewModelSpy>!
    var viewModelSpy: PopularRepositoryViewModelSpy!
    var router: Router!

    override func setUp() {
        viewModelSpy = PopularRepositoryViewModelSpy()
        sut = PopularRepositoriesView(viewModel: viewModelSpy)
        router = Router()
    }

    override func tearDown() {
        viewModelSpy = nil
        sut = nil
        router = nil
    }

    func testEmptyResponse() {
        viewModelSpy.isLoading = false
        var container: some View {
                VStack {
                    PopularRepositoriesView(viewModel: viewModelSpy).environment(router)
                }.frame(width: 375, height: 900)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }
    
    func testFullResponse() {
        let userList = PopularSwiftRepositoriesModel.userItemMockList()
        viewModelSpy.isLoading = false
        viewModelSpy.popularRepositories = userList
        var container: some View {
                VStack {
                    PopularRepositoriesView(viewModel: viewModelSpy).environment(router)
                }.frame(width: 375, height: 900)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

}
