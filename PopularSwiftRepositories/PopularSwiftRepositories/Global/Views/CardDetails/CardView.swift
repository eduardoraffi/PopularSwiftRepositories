import SwiftUI

internal struct CardView<Content: View>: View {

    internal let content: Content

    var body: some View {
        VStack(alignment: .leading) {
            content
                .background(.white)
                .cornerRadius(8)
                .shadow(radius: 2)
        }
    }

}
