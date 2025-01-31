//
//  OpenAIChatRequest.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

// MARK: - JSON Schema

/// Custom coding key to support different casing strategies.
//public struct CustomKey: CodingKey {
//    public var stringValue: String
//
//    public init?(stringValue: String) {
//        self.stringValue = stringValue
//    }
//
//    public var intValue: Int?
//    public init?(intValue: Int) {
//        return nil
//    }
//
//    static func customKey(_ key: String) -> CustomKey {
//        return CustomKey(stringValue: key) ?? CustomKey(stringValue: "")!
//    }
//}

// MARK: - Structured Response

/// Represents the response format in the JSON.
public struct ResponseFormat: Content {
    let type: String
    var json_schema: JSONSchema
    
    public init(type: String, json_schema: JSONSchema) {
        self.type = type
        self.json_schema = json_schema
    }
    
//     Custom encode the ResponseFormat to handle "json_schema" field conversion.
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CustomKey.self)
//        try container.encode(type, forKey: .customKey("type"))
//        try container.encode(json_schema, forKey: .customKey("json_schema"))
//    }
}

// MARK: - Tools




// MARK: - Request

public struct OpenAIChatRequest: Content {
    
    var model: String?
    
    var n: Int?
    
    var temperature: Double?
    
    var top_p: Double?
    
    var messages: [OpenAIChatRequestMessage]?
    
    var user: String?
    
    var response_format: ResponseFormat?
    
    var tools: [OpenAITool]?
    
    public init(
        model: String? = nil,
        n: Int? = nil,
        temperature: Double? = nil,
        top_p: Double? = nil,
        messages: [OpenAIChatRequestMessage]? = nil,
        user: String? = nil,
        responseFormat: ResponseFormat? = nil,
        tools: [OpenAITool]? = nil
    ) {
        self.model = model
        self.n = n
        self.temperature = temperature
        self.top_p = top_p
        self.messages = messages
        self.user = user
        self.response_format = responseFormat
        self.tools = tools
    }
}
