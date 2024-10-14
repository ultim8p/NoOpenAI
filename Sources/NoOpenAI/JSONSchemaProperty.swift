//
//  JSONSchemaProperty.swift
//  NoOpenAI
//
//  Created by Guerson Perez on 13/10/24.
//

import Foundation
import Vapor


/// Represents properties in JSON schema.
public final class JSONSchemaProperty: Content {
    
    let type: String
    var description: String?
    let enumValues: [String]?
    var properties: [String: JSONSchemaProperty]?
    var items: JSONSchemaProperty?
    var required: [String]?
    var additionalProperties: Bool?
    
    public init(
        type: String,
        description: String? = nil,
        properties: [String: JSONSchemaProperty]? = nil,
        items: JSONSchemaProperty? = nil,
        required: [String]? = nil,
        additionalProperties: Bool? = nil,
        enumValues: [String]? = nil
    ) {
        self.type = type
        self.description = description
        self.properties = properties
        self.items = items
        self.required = required
        self.additionalProperties = additionalProperties
        self.enumValues = enumValues
    }
    
    /// Custom encoder to enforce camelCase on specific keys while adhering to snake_case for others.
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CustomKey.self)
//
//        // Convert properties based on the key
//        try container.encode(type, forKey: .customKey("type"))
//        try container.encodeIfPresent(enumValues, forKey: .customKey("description"))
//        try container.encodeIfPresent(properties, forKey: .customKey("properties"))
//        try container.encodeIfPresent(enumValues, forKey: .customKey("enum"))
//        try container.encodeIfPresent(items, forKey: .customKey("items"))
//        try container.encodeIfPresent(required, forKey: .customKey("required"))
//
//        // Use the original casing for `additionalProperties`
//        if let additionalProperties = additionalProperties {
//            try container.encode(additionalProperties, forKey: .customKey("additionalProperties"))
//        }
//    }
}
