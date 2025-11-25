import Foundation
import SwiftUI

internal enum CardViewType {
    case prList
    case repositoryList
}

internal struct DefaultCardListView: View {

    private(set) var userItem: UserProtocol
    private var cardViewMaxHeightMultiplier: CGFloat
    private var cardViewType: CardViewType

    var body: some View {
        let mainBounds = UIScreen.main.bounds.size
        let userViewMaxWidth = mainBounds.width * 0.33
        let userViewHeight = mainBounds.height * cardViewMaxHeightMultiplier
        HStack {
            DefaultCardDetailsView(userItem: userItem, cardViewType: cardViewType)
            UserView(userItem: userItem, cardViewType: cardViewType)
                .frame(maxWidth: userViewMaxWidth, alignment: .center)
        }.frame(height: userViewHeight)
            .background(Color.secondaryBackgroundColor)
            .overlay(RoundedRectangle(cornerRadius: 8)
                .stroke(Color.primaryTextColor.opacity(0.8),lineWidth: 1))
    }

    init(userItem: UserProtocol,
         cardViewMaxHeightMultiplier: CGFloat = 0.18,
         cardViewType: CardViewType = .repositoryList) {
        self.userItem = userItem
        self.cardViewMaxHeightMultiplier = cardViewMaxHeightMultiplier
        self.cardViewType = cardViewType
    }

    @ViewBuilder
    private func getCardContent() -> some View {
        
    }

}

#Preview {
    DefaultCardListView(userItem: UserItem(id: 0,
                                                   name: "Teste",
                                                   fullName: "Teste",
                                                   owner: Owner(avatarURL: ""),
                                                   description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 19",
                                                   stargazersCount: 50000,
                                                   forks: 10000),
                        cardViewType: .prList)
}
