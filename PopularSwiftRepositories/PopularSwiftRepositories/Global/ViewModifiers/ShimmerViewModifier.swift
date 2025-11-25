import SwiftUI

struct Shimmer: ViewModifier {

    @State private var phase: CGFloat = 0

    internal func body(content: Content) -> some View {
        content
            .overlay {
                Rectangle()
                    .fill(getGradient())
                    .blendMode(.overlay)
                    .offset(x: phase)
            }
            .onAppear {
                withAnimation(.linear(duration: 2)
                    .repeatForever(autoreverses: false)) {
                        phase = 200
                    }
            }
    }

    private func getGradient() -> some ShapeStyle {
        LinearGradient(
            colors: [
                .white.opacity(0.0),
                .white.opacity(0.6),
                .white.opacity(0.0)
            ],
            startPoint: .topLeading,
            endPoint: .topTrailing
        )
    }

}

extension View {
    
    internal func shimmer() -> some View {
        modifier(Shimmer())
    }

}
