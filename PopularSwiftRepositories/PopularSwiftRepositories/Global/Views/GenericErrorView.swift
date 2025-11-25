import SwiftUI

internal struct GenericErrorView: View {

    internal var errorDescription: String
    @Binding internal var reloadAction: Bool

    var body: some View {
        VStack {
            Text(errorDescription)
                .foregroundColor(.errorTextColor)
            Button("Retry") {
                reloadAction.toggle()
            }
            
        }.background(Color.primaryBackgroundColor)
    }

}
