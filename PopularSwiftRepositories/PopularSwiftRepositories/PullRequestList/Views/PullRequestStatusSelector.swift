import SwiftUI

internal enum PullRequestStatus: String {
    case open
    case closed
}

internal struct PullRequestStatusSelector: View {

    @Binding internal var status: PullRequestStatus

    var body: some View {
        HStack {
            Group {
                Text("Open")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(status == .open ? .blue : .gray)
                    .onTapGesture {
                        if status != .open {
                            status = .open
                        }
                    }
                Divider()
                Text("Closed")
                    .frame(maxWidth: .infinity)
                    .foregroundColor(status == .closed ? .blue : .gray)
                    .onTapGesture {
                        if status != .closed {
                            status = .closed
                        }
                    }
            }.multilineTextAlignment(.center)
        }.frame(height: 40)
        Color.black
            .frame(height: 1)
            .opacity(0.1)
    }

}
