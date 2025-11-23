//import SwiftUI
//
//public struct CachedAsyncImage: View {
//    private let url: URL?
//    @State private var image: Image? = nil
//    @State private var isLoading = true
//
//    public init(url: URL?) {
//        self.url = url
//    }
//
//    public var body: some View {
//        if let image = image {
//            image
//        } else {
//            ProgressView()
//                .onAppear {
//                    Task {
//                        await loadImage()
//                    }
//                }
//        }
//    }
//
//    private func loadImage() async {
//        guard let url = url else { return }
//        // Check if the image is already cached
//        let request = URLRequest(url: url)
//        if let cachedResponse = URLCache.shared.cachedResponse(for: request),
//           let cachedImage = UIImage(data: cachedResponse.data) {
//            await retrieveImage(cachedImage)
//        } else {
//            // Fetch the image from the network
//            do {
//                let (data, response) = try await URLSession.shared.data(for: request)
//
//                // Cache the image
//                let cachedData = CachedURLResponse(response: response, data: data)
//                URLCache.shared.storeCachedResponse(cachedData, for: request)
//
//                if let uiImage = UIImage(data: data) {
//                    await MainActor.run {
//                        retrieveImage(uiImage)
//                    }
//                }
//            } catch {
//                await retrieveImage(UIImage.imageDefaultAvatar)
//            }
//        }
//    }
//
//    private func retrieveImage(_ retrievedImage: UIImage) async {
//        let image = Image(uiImage: retrievedImage)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: 60, height: 60)
//            .background(.gray.opacity(0.6))
//            .clipShape(Circle())
//        self.image = image as? Image
//        self.isLoading = false
//    }
//
//}
