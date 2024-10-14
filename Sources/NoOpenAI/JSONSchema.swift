//
//  JSONSchema.swift
//  NoOpenAI
//
//  Created by Guerson Perez on 13/10/24.
//

import Foundation
import Vapor


/// Represents the JSON Schema structure.
public struct JSONSchema: Content {
    let name: String
    let schema: JSONSchemaProperty
    let strict: Bool?
    
    public init(name: String, schema: JSONSchemaProperty, strict: Bool?) {
        self.name = name
        self.schema = schema
        self.strict = strict
    }
    
    // Custom encode the JSONSchema to handle "name" field conversion.
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CustomKey.self)
//        try container.encode(name, forKey: .customKey("name"))
//        try container.encode(schema, forKey: .customKey("schema"))
//        try container.encodeIfPresent(strict, forKey: .customKey("strict"))
//    }
}
