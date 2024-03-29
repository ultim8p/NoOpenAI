//
//  OpenAIChatRequest+Request.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor
import NoVaporAPI

public extension Encodable {

    func toDictionary(encoder: JSONEncoder? = nil) -> [String: Any] {
        do {
            let jsonEncoder = encoder ?? JSONEncoder()
            let data = try jsonEncoder.encode(self)

            if let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return dict
            }
        } catch {
            print("ERROR Converting model to dict")
        }
        return [:]
    }

}

public extension OpenAIChatRequest {
    
    func postChatCompletion(_ client: Client, ai: NoOpenAI) async throws -> OpenAIChatResponse {
        
        let value = try await post(
            client,
            uri: ai.uri(route: APIRouteChat.chatCompletion),
            headers: HTTPHeaders(ai.headers),
            contentEncoder: ai.apiEncoder,
            timeout: 60 * 10
        )
        let validated = try value.validate(type: OpenAIResponseError.self, using: ai.apiDecoder)
        
        return try validated.value(using: ai.apiDecoder)
    }
}
