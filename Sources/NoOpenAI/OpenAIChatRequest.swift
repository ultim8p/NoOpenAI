//
//  OpenAIChatRequest.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

/// Represents properties in JSON schema.
public final class JSONSchemaProperties: Content {
    let type: String
    let enumValues: [String]?
    var properties: [String: JSONSchemaProperties]?
    var items: JSONSchemaProperties?
    var required: [String]?
    var additional_properties: Bool?
    
    public init(type: String, properties: [String: JSONSchemaProperties]? = nil, items: JSONSchemaProperties? = nil, required: [String]? = nil, additionalProperties: Bool? = nil, enumValues: [String]? = nil) {
            self.type = type
            self.properties = properties
            self.items = items
            self.required = required
            self.additional_properties = additionalProperties
            self.enumValues = enumValues
        }
        
        /// Custom encoder to enforce camelCase on specific keys while adhering to snake_case for others.
    public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CustomKey.self)
            
            // Convert properties based on the key
            try container.encode(type, forKey: .customKey("type"))
            try container.encodeIfPresent(enumValues, forKey: .customKey("enumValues"))
            try container.encodeIfPresent(properties, forKey: .customKey("properties"))
            try container.encodeIfPresent(items, forKey: .customKey("items"))
            try container.encodeIfPresent(required, forKey: .customKey("required"))
            
            // Use the original casing for `additionalProperties`
            if let additionalProperties = additional_properties {
                try container.encode(additionalProperties, forKey: .customKey("additionalProperties"))
            }
        }
}

/// Custom coding key to support different casing strategies.
public struct CustomKey: CodingKey {
    public var stringValue: String

    public init?(stringValue: String) {
        self.stringValue = stringValue
    }

    public var intValue: Int?
    public init?(intValue: Int) {
        return nil
    }

    static func customKey(_ key: String) -> CustomKey {
        return CustomKey(stringValue: key) ?? CustomKey(stringValue: "")!
    }
}

/// Represents the JSON Schema structure.
public struct JSONSchema: Content {
    let name: String
    let schema: JSONSchemaProperties
    let strict: Bool?
    
    public init(name: String, schema: JSONSchemaProperties, strict: Bool?) {
        self.name = name
        self.schema = schema
        self.strict = strict
    }
    
    // Custom encode the JSONSchema to handle "name" field conversion.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CustomKey.self)
        try container.encode(name, forKey: .customKey("name"))
        try container.encode(schema, forKey: .customKey("schema"))
        try container.encodeIfPresent(strict, forKey: .customKey("strict"))
    }
}

/// Represents the response format in the JSON.
/// Represents the response format in the JSON.
public struct ResponseFormat: Content {
    let type: String
    var json_schema: JSONSchema
    
    public init(type: String, json_schema: JSONSchema) {
        self.type = type
        self.json_schema = json_schema
    }
    
    // Custom encode the ResponseFormat to handle "json_schema" field conversion.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CustomKey.self)
        try container.encode(type, forKey: .customKey("type"))
        try container.encode(json_schema, forKey: .customKey("json_schema"))
    }
}


public struct OpenAIChatRequest: Content {
    
    var model: String?
    
    var n: Int?
    
    var messages: [OpenAIChatRequestMessage]?
    
    var user: String?
    
    var response_format: ResponseFormat?
    
    public init(
        model: String? = nil,
        n: Int? = nil,
        messages: [OpenAIChatRequestMessage]? = nil,
        user: String? = nil,
        responseFormat: ResponseFormat? = nil
    ) {
        self.model = model
        self.n = n
        self.messages = messages
        self.user = user
        self.response_format = responseFormat
    }
}
