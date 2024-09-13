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
import NoAPI

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
        
        /*
        let request = try self.request(
            method: .post,
            path: APIRouteChat.chatCompletion.description,
            scheme: ai.apiScheme,
            host: ai.apiHost,
            port: nil,
            headers: ai.normalHeaders,
            encoder: ai.apiEncoder
        )
        
        let response = try await request.response()
        let validated = try response.validate(type: OpenAIResponseError.self, decoder: ai.apiDecoder)
        
        
        return try validated.value(decoder: ai.apiDecoder)
        */
        
        let value = try await post(
            client,
            uri: ai.uri(route: APIRouteChat.chatCompletion),
            headers: HTTPHeaders(ai.headers),
            contentEncoder: ai.apiEncoder,
            timeout: 60 * 10,
            logger: logger
        )
        
        let validated = try value.validate(type: OpenAIResponseError.self, using: ai.apiDecoder)
        
        return try validated.value(using: ai.apiDecoder)
         
    }
}
