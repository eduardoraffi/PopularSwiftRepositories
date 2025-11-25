import UIKit

extension UIColor {

    convenience init(hex: String) {
        var cleanedHex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
            .replacingOccurrences(of: "#", with: "")

        // Validate length
        guard cleanedHex.count == 6 || cleanedHex.count == 8 else {
            self.init(.white)
            return
        }

        // Add alpha if missing (defaults to 1.0)
        if cleanedHex.count == 6 {
            cleanedHex = "FF" + cleanedHex
        }

        var rgba: UInt64 = 0
        Scanner(string: cleanedHex).scanHexInt64(&rgba)

        let a = CGFloat((rgba & 0xFF000000) >> 24) / 255.0
        let r = CGFloat((rgba & 0x00FF0000) >> 16) / 255.0
        let g = CGFloat((rgba & 0x0000FF00) >> 8) / 255.0
        let b = CGFloat(rgba & 0x000000FF) / 255.0

        self.init(red: r, green: g, blue: b, alpha: a)
    }

}
