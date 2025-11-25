import Foundation

extension Bundle {

    func jsonData(fileName: JsonFileNames) -> Data? {
        guard let url = url(forResource: fileName.rawValue, withExtension: "json") else { return nil }
        return try? Data(contentsOf: url)
    }

}
