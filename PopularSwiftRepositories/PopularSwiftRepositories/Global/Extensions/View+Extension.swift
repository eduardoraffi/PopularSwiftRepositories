import SwiftUI

extension View {
    public func withRouter() -> some View {
        modifier(RouterViewModifier())
    }
}
