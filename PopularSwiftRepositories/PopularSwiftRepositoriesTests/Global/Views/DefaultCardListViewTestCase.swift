import XCTest
import SwiftUI
import SnapshotTesting

internal class DefaultCardListViewTestCase: XCTestCase {

    var sut: DefaultCardListView!

    override func setUp() {
        sut = DefaultCardListView(userItem: PopularSwiftRepositoriesModel.userItemMockList().first!)
    }

    internal func testDefaultCardView() {
        var container: some View {
            VStack {
                sut
            }.frame(width: 375, height: 130)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

    internal func testCardViewForPullRequests() throws {
        sut = DefaultCardListView(userItem: PullRequestModel.mock(),
                                  cardViewType: .prList)
        var container: some View {
            VStack {
                sut
            }.frame(width: 375, height: 130)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

}
