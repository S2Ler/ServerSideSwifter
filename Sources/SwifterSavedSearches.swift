import Foundation

public extension Swifter {

    /**
    GET    saved_searches/list

    Returns the authenticated user's saved search queries.
    */
    public func getSavedSearchesList(success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "saved_searches/list.json"

        self.getJSON(path: path, baseURL: .api, parameters: [:], success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    GET    saved_searches/show/:id

    Retrieve the information for the saved search represented by the given id. The authenticating user must be the owner of saved search ID being requested.
    */
    public func showSavedSearch(for id: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "saved_searches/show/\(id).json"

        self.getJSON(path: path, baseURL: .api, parameters: [:], success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    POST   saved_searches/create

    Create a new saved search for the authenticated user. A user may only have 25 saved searches.
    */
    public func createSavedSearch(for query: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "saved_searches/create.json"

        var parameters = Dictionary<String, Any>()
        parameters["query"] = query

        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    POST   saved_searches/destroy/:id

    Destroys a saved search for the authenticating user. The authenticating user must be the owner of saved search id being destroyed.
    */
    public func deleteSavedSearch(for id: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "saved_searches/destroy/\(id).json"

        self.postJSON(path: path, baseURL: .api, parameters: [:], success: { json, _ in success?(json) }, failure: failure)
    }
    
}
