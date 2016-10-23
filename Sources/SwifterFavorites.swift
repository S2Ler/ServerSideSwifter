import Foundation

public extension Swifter {

    /**
    GET    favorites/list

    Returns the 20 most recent Tweets favorited by the authenticating or specified user.

    If you do not provide either a user_id or screen_name to this method, it will assume you are requesting on behalf of the authenticating user. Specify one or the other for best results.
    */
    public func getRecentlyFavouritedTweets(count: Int? = nil, sinceID: String? = nil, maxID: String? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "favorites/list.json"

        var parameters = Dictionary<String, Any>()
        parameters["count"] ??= count
        parameters["since_id"] ??= sinceID
        parameters["max_id"] ??= maxID

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }
    
    public func getRecentlyFavouritedTweets(for userTag: UserTag, count: Int? = nil, sinceID: String? = nil, maxID: String? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "favorites/list.json"
        
        var parameters = Dictionary<String, Any>()
        parameters[userTag.key] = userTag.value
        parameters["count"] ??= count
        parameters["since_id"] ??= sinceID
        parameters["max_id"] ??= maxID
        
        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    POST	favorites/destroy

    Un-favorites the status specified in the ID parameter as the authenticating user. Returns the un-favorited status in the requested format when successful.

    This process invoked by this method is asynchronous. The immediately returned status may not indicate the resultant favorited status of the tweet. A 200 OK response from this method will indicate whether the intended action was successful or not.
    */
    public func unfavouriteTweet(forID id: String, includeEntities: Bool? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "favorites/destroy.json"

        var parameters = Dictionary<String, Any>()
        parameters["id"] = id
        parameters["include_entities"] ??= includeEntities

        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    POST	favorites/create

    Favorites the status specified in the ID parameter as the authenticating user. Returns the favorite status when successful.

    This process invoked by this method is asynchronous. The immediately returned status may not indicate the resultant favorited status of the tweet. A 200 OK response from this method will indicate whether the intended action was successful or not.
    */
    public func favouriteTweet(forID id: String, includeEntities: Bool? = nil, success: SuccessHandler? = nil, failure: HTTPRequest.FailureHandler? = nil) {
        let path = "favorites/create.json"

        var parameters = Dictionary<String, Any>()
        parameters["id"] = id
        parameters["include_entities"] ??= includeEntities

        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }
    
}
