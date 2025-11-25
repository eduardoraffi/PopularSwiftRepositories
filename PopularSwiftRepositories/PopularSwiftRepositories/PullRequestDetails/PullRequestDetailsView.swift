import SwiftUI
import WebKit

internal struct PullRequestDetailsView: View {

    @Environment(\.dismiss) var dismiss
    private var urlString: String

    init(urlString: String) {
        self.urlString = urlString
    }

    var body: some View {
        if let url = URL(string: urlString) {
            WebView(url: url)
                .navigationTitle("Selected pull request")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("X") {
                            dismiss()
                        }
                    }
                }
        } else {
            EmptyView()
        }
    }
}

struct WebView: UIViewRepresentable {

    let url: URL

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

}
