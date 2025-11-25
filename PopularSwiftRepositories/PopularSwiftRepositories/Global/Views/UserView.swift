import SwiftUI

internal struct UserView: View {

    private var userItem: UserProtocol
    private var cardViewType: CardViewType

    init(userItem: UserProtocol, cardViewType: CardViewType) {
        self.userItem = userItem
        self.cardViewType = cardViewType
    }

    var body: some View {
        VStack {
            if let avatarURL = URL(string: userItem.avatarUrl) {
                AsyncImage(url: avatarURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case let .success(image):
                        setupImage(image)
                    case .failure:
                        setupImage(Image(Image.defaultAvatar))
                    @unknown default:
                        setupImage(Image(Image.defaultAvatar))
                    }
                }
            } else {
                Image(Image.defaultAvatar)
            }
            Text(userItem.fullName)
                .multilineTextAlignment(.center)
                .font(.system(size: 12, weight: .bold))
                .foregroundColor(.primaryTextColor)
                .padding()
        }
    }

    private func setupImage(_ image: Image) -> some View {
        image
            .resizable()
            .background(.black)
            .aspectRatio(contentMode: .fit)
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay(Circle()
                .stroke(.black.opacity(0.8),lineWidth: 1))
            .shadow(color: .black, radius: 8)
    }

}
