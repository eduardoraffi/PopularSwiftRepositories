import XCTest
import SwiftUI
import SnapshotTesting

internal class PullRequestStatusSelectorTestCase: XCTestCase {

    var sut: PullRequestStatusSelector!

    override func setUp() {
        var bindingValue: PullRequestStatus = .open
        let binding = Binding(get: { bindingValue }, set: { bindingValue = $0 })
        sut = PullRequestStatusSelector(status: binding)
    }

    internal func testOpenSelected() {
        var container: some View {
            VStack {
                sut
            }.frame(width: 375, height: 60)
                .background(Color.secondaryBackgroundColor)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

    internal func testClosedSelected() throws {
        var bindingValue: PullRequestStatus = .closed
        let binding = Binding(get: { bindingValue }, set: { bindingValue = $0 })
        var container: some View {
            VStack {
                PullRequestStatusSelector(status: binding)
            }.frame(width: 375, height: 60)
                .background(Color.secondaryBackgroundColor)
        }
        let controller = UIHostingController(rootView: container)
        assertSnapshot(of: controller, as: .image)
    }

}
