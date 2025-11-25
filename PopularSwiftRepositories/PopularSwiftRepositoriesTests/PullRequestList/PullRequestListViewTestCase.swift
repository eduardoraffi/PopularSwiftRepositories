import XCTest
import Foundation
import SwiftUI
import SnapshotTesting

final class PullRequestListViewTestCaseItem: XCTestCase {
    
    var sut: PullRequestListView<PullRequestListViewModelSpy>!
    var viewModelSpy: PullRequestListViewModelSpy!
    var router: Router!

    override func setUp() {
        viewModelSpy = PullRequestListViewModelSpy()
        sut = PullRequestListView(viewModel: viewModelSpy)
        router = Router()
    }

    override func tearDown() {
        viewModelSpy = nil
        sut = nil
        router = nil
    }
    
    func testDefaultOpenResponse() {
        viewModelSpy.isLoading = false
        viewModelSpy.pullRequestList = PullRequestModel.mockList()
        var container: some View {
                VStack {
                    PullRequestListView(viewModel: viewModelSpy).environment(router)
                }.frame(width: 375, height: 900)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

    func testErrorResponse() {
        viewModelSpy.isLoading = false
        viewModelSpy.errorMessage = "Test Error"
        var container: some View {
                VStack {
                    PullRequestListView(viewModel: viewModelSpy).environment(router)
                }.frame(width: 375, height: 900)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

}
