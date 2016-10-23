import Foundation

public extension Swifter {

    /**
    GET    users/suggestions/:slug

    Access the users in a given category of the Twitter suggested user list.

    It is recommended that applications cache this data for no more than one hour.
    */
    public func getUserSuggestions(slug: String, lang: String? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "users/suggestions/\(slug).json"

        var parameters = Dictionary<String, Any>()
        parameters["lang"] ??= lang

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    GET    users/suggestions

    Access to Twitter's suggested user list. This returns the list of suggested user categories. The category can be used in GET users/suggestions/:slug to get the users in that category.
    */
    public func getUsersSuggestions(lang: String? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "users/suggestions.json"

        var parameters = Dictionary<String, Any>()
        parameters["lang"] ??= lang

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    GET    users/suggestions/:slug/members

    Access the users in a given category of the Twitter suggested user list and return their most recent status if they are not a protected user.
    */
    public func getUsersSuggestions(for slug: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "users/suggestions/\(slug)/members.json"
        self.getJSON(path: path, baseURL: .api, parameters: [:], success: { json, _ in success?(json) }, failure: failure)
    }
    
}
