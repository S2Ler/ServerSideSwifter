import Foundation

public class Credential {

    public struct OAuthAccessToken {

        public internal(set) var key: String
        public internal(set) var secret: String
        public internal(set) var verifier: String?

        public internal(set) var screenName: String?
        public internal(set) var userID: String?

        public init(key: String, secret: String) {
            self.key = key
            self.secret = secret
        }

        public init(queryString: String) {
            var attributes = queryString.queryStringParameters

            self.key = attributes["oauth_token"]!
            self.secret = attributes["oauth_token_secret"]!

            self.screenName = attributes["screen_name"]
            self.userID = attributes["user_id"]
        }
        
    }

    public internal(set) var accessToken: OAuthAccessToken?

    public init(accessToken: OAuthAccessToken) {
        self.accessToken = accessToken
    }
}
