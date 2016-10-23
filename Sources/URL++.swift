import Foundation

extension URL {
    
    func append(queryString: String) -> URL {
        guard !queryString.utf16.isEmpty else {
            return self
        }
        
        var absoluteURLString = self.absoluteString
        
        if absoluteURLString.hasSuffix("?") {
            absoluteURLString = absoluteURLString[0..<absoluteURLString.utf16.count]
        }
        
        let urlString = absoluteURLString + (absoluteURLString.range(of: "?") != nil ? "&" : "?") + queryString
        return URL(string: urlString)!
    }

}
