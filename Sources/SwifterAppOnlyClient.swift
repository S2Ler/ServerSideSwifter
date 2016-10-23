import Foundation

internal class AppOnlyClient: SwifterClientProtocol  {

    var consumerKey: String
    var consumerSecret: String

    var credential: Credential?

    let dataEncoding: String.Encoding = .utf8

    init(consumerKey: String, consumerSecret: String) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
    }

    func get(_ path: String, baseURL: TwitterURL, parameters: Dictionary<String, Any>, uploadProgress: HTTPRequest.UploadProgressHandler?, downloadProgress: HTTPRequest.DownloadProgressHandler?, success: HTTPRequest.SuccessHandler?, failure: HTTPRequest.FailureHandler?) -> HTTPRequest {
        let url = URL(string: path, relativeTo: baseURL.url)

        let request = HTTPRequest(url: url!, method: .GET, parameters: parameters)
        request.downloadProgressHandler = downloadProgress
        request.successHandler = success
        request.failureHandler = failure
        request.dataEncoding = self.dataEncoding

        if let bearerToken = self.credential?.accessToken?.key {
            request.headers = ["Authorization": "Bearer \(bearerToken)"];
        }

        request.start()
        return request
    }

    func post(_ path: String, baseURL: TwitterURL, parameters: Dictionary<String, Any>, uploadProgress: HTTPRequest.UploadProgressHandler?, downloadProgress: HTTPRequest.DownloadProgressHandler?, success: HTTPRequest.SuccessHandler?, failure: HTTPRequest.FailureHandler?) -> HTTPRequest {
        let url = URL(string: path, relativeTo: baseURL.url)

        let request = HTTPRequest(url: url!, method: .POST, parameters: parameters)
        request.downloadProgressHandler = downloadProgress
        request.successHandler = success
        request.failureHandler = failure
        request.dataEncoding = self.dataEncoding

        if let bearerToken = self.credential?.accessToken?.key {
            request.headers = ["Authorization": "Bearer \(bearerToken)"];
        } else {
            let basicCredentials = AppOnlyClient.base64EncodedCredentials(withKey: self.consumerKey, secret: self.consumerSecret)
            request.headers = ["Authorization": "Basic \(basicCredentials)"];
            request.encodeParameters = true
        }

        request.start()
        return request
    }

    class func base64EncodedCredentials(withKey key: String, secret: String) -> String {
        let encodedKey = key.urlEncodedString()
        let encodedSecret = secret.urlEncodedString()
        let bearerTokenCredentials = "\(encodedKey):\(encodedSecret)"
        guard let data = bearerTokenCredentials.data(using: .utf8) else {
            return ""
        }
        return data.base64EncodedString(options: [])
    }

}
