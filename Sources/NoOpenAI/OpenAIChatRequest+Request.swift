//
//  OpenAIChatRequest+Request.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor
import NoVaporAPI
import NoLogger

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
    
    func postChatCompletion<T: Content>(_ client: Client, ai: NoOpenAI, logger: NoLogger? = nil) async throws -> OpenAIChatResponse<T> {
        let value = try await post(
            client,
            uri: ai.uri(route: APIRouteChat.chatCompletion),
            headers: HTTPHeaders(ai.headers),
            contentEncoder: nil,
            timeout: 60 * 10,
            logger: logger
        )

        let validated = try value.validate(type: OpenAIResponseError.self, using: ai.apiDecoder)

        return try validated.value(using: ai.apiDecoder)
    }
    
    func postChatCompletionJSONResponse<T: Content>(_ client: Client, ai: NoOpenAI) async throws -> T {
        
        let value = try await post(
            client,
            uri: ai.uri(route: APIRouteChat.chatCompletion),
            headers: HTTPHeaders(ai.headers),
            contentEncoder: nil,
            timeout: 60 * 10
        )
        print("API JSON RESPONSE: \(value)")
        
        let validated = try value.validate(type: OpenAIResponseError.self, using: ai.apiDecoder)
        
        return try validated.value(using: ai.apiDecoder)
    }
}
