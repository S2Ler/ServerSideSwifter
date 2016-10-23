import Foundation

extension String {

    internal func indexOf(_ sub: String) -> Int? {
        guard let range = self.range(of: sub), !range.isEmpty else {
            return nil
        }
        return self.characters.distance(from: self.startIndex, to: range.lowerBound)
    }

    internal subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.characters.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.characters.index(startIndex, offsetBy: r.upperBound - r.lowerBound)
            return self[startIndex..<endIndex]
        }
    }
    

    func urlEncodedString(_ encodeAll: Bool = false) -> String {
        var allowedCharacterSet: CharacterSet = .urlQueryAllowed
        allowedCharacterSet.remove(charactersIn: "\n:#/?@!$&'()*+,;=")
        if !encodeAll {
            allowedCharacterSet.insert(charactersIn: "[]")
        }
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
    }

    var queryStringParameters: Dictionary<String, String> {
        guard let queryItems = URLComponents(string: self)?.queryItems else {
            return [:]
        }

        var parameters = Dictionary<String, String>()

        for queryItem in queryItems {
            parameters[queryItem.name] = queryItem.value
        }

        return parameters
    }

}

