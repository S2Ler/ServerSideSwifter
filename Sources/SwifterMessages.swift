import Foundation

public extension Swifter {

    /**
    GET	direct_messages

    Returns the 20 most recent direct messages sent to the authenticating user. Includes detailed information about the sender and recipient user. You can request up to 200 direct messages per call, up to a maximum of 800 incoming DMs.
    */
    public func getDirectMessages(since sinceID: String? = nil, maxID: String? = nil, count: Int? = nil, includeEntities: Bool? = nil, skipStatus: Bool? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "direct_messages.json"

        var parameters = Dictionary<String, Any>()
        parameters["since_id"] ??= sinceID
        parameters["max_id"] ??= maxID
        parameters["count"] ??= count
        parameters["include_entities"] ??= includeEntities
        parameters["skip_status"] ??= skipStatus

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    GET    direct_messages/sent

    Returns the 20 most recent direct messages sent by the authenticating user. Includes detailed information about the sender and recipient user. You can request up to 200 direct messages per call, up to a maximum of 800 outgoing DMs.
    */
    public func getSentDirectMessages(since sinceID: String? = nil, maxID: String? = nil, count: Int? = nil, page: Int? = nil, includeEntities: Bool? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "direct_messages/sent.json"

        var parameters = Dictionary<String, Any>()
        parameters["since_id"] ??= sinceID
        parameters["max_id"] ??= maxID
        parameters["count"] ??= count
        parameters["page"] ??= page
        parameters["include_entities"] ??= includeEntities

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    GET    direct_messages/show

    Returns a single direct message, specified by an id parameter. Like the /1.1/direct_messages.format request, this method will include the user objects of the sender and recipient.
    */
    public func showDirectMessage(forID id: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "direct_messages/show.json"
        let parameters: [String: Any] = ["id" : id]

        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    POST	direct_messages/destroy

    Destroys the direct message specified in the required ID parameter. The authenticating user must be the recipient of the specified direct message.
    */
    public func destoryDirectMessage(forID id: String, includeEntities: Bool? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "direct_messages/destroy.json"

        var parameters = Dictionary<String, Any>()
        parameters["id"] = id
        parameters["include_entities"] ??= includeEntities
        
        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }

    /**
    POST	direct_messages/new

    Sends a new direct message to the specified user from the authenticating user. Requires both the user and text parameters and must be a POST. Returns the sent message in the requested format if successful.
    */
    public func sendDirectMessage(to userID: String, text: String, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "direct_messages/new.json"

        var parameters = Dictionary<String, Any>()
        parameters["user_id"] = userID
        parameters["text"] = text

        self.postJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }
    
}
