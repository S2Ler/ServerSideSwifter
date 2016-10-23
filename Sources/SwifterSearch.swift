import Foundation

public extension Swifter {

    /**
     GET    search/tweets
     
     Returns a collection of relevant Tweets matching a specified query.
     
     Please note that Twitter’s search service and, by extension, the Search API is not meant to be an exhaustive source of Tweets. Not all Tweets will be indexed or made available via the search interface.
     
     In API v1.1, the response format of the Search API has been improved to return Tweet objects more similar to the objects you’ll find across the REST API and platform. However, perspectival attributes (fields that pertain to the perspective of the authenticating user) are not currently supported on this endpoint.

     */
    public func searchTweet(using query: String, geocode: String? = nil, lang: String? = nil, locale: String? = nil, resultType: String? = nil, count: Int? = nil, until: String? = nil, sinceID: String? = nil, maxID: String? = nil, includeEntities: Bool? = nil, callback: String? = nil, success: ((JSON, _ searchMetadata: JSON) -> Void)? = nil, failure: @escaping FailureHandler) {
        let path = "search/tweets.json"

        var parameters = Dictionary<String, Any>()
        parameters["q"] = query
        parameters["geocode"] ??= geocode
        parameters["lang"] ??= lang
        parameters["locale"] ??= locale
        parameters["result_type"] ??= resultType
        parameters["count"] ??= count
        parameters["until"] ??= until
        parameters["since_id"] ??= sinceID
        parameters["max_id"] ??= maxID
        parameters["include_entities"] ??= includeEntities
        parameters["callback"] ??= callback

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in
            success?(json["statuses"], json["search_metadata"])
            }, failure: failure)
    }
    
}
