import Foundation

public extension Swifter {

    /**
    POST   users/report_spam

    Report the specified user as a spam account to Twitter. Additionally performs the equivalent of POST blocks/create on behalf of the authenticated user.
    */
    public func reportSpam(for userTag: UserTag, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "users/report_spam.json"
        let parameters: [String: Any] = [userTag.key: userTag.value]

        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in
            success?(json)
            }, failure: failure)
    }
    
}
