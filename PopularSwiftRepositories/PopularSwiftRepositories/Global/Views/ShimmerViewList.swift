import SwiftUI

internal struct ShimmerViewList: View {

    var body: some View {
        LazyVStack {
            ForEach(1...10, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.5))
                    .frame(height: UIScreen.main.bounds.height * 0.18)
                    .shimmer()
            }
        }
    }

}
