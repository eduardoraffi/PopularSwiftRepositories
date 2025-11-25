import SwiftUI

internal enum PullRequestStatus: String {
    case open
    case closed
}

internal struct PullRequestStatusSelector: View {

    @Binding internal var status: PullRequestStatus

    var body: some View {
        VStack {
            HStack {
                Group {
                    Text("Open")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(status == .open ? .white : .gray)
                        .fontWeight(status == .open ? .heavy : .light)
                        .onTapGesture {
                            if status != .open {
                                status = .open
                            }
                        }
                    Divider()
                        .background(Color.white)
                        .padding([.top, .bottom], 8)
                    Text("Closed")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(status == .closed ? .white : .gray)
                        .fontWeight(status == .closed ? .heavy : .light)
                        .onTapGesture {
                            if status != .closed {
                                status = .closed
                            }
                        }
                }.multilineTextAlignment(.center)
            }.frame(height: 40)
            Color.white
                .frame(height: 1)
                .opacity(0.2)
        }
    }

}
