//
//  OpenAIToolFunction.swift
//  NoOpenAI
//
//  Created by Guerson Perez on 13/10/24.
//

import Foundation
import Vapor

public struct OpenAIToolFunction: Codable {
    
    // Name Identifier for the function call
    public var name: String?
    
    public var description: String?
    
    // For REQUESTs. JSON object which describes the model how to call this tool.
    // MUST be a valid JSON schema supported by OpenAI.
    public var parameters: JSONSchemaProperty?
    
    // For model RESPONSE. JSON object arguments which will be used to perform the tool task.
    public var arguments: String?
    
    public var strict: Bool?
    
    public init(
        name: String? = nil,
        description: String? = nil,
        parameters: JSONSchemaProperty? = nil,
        arguments: String? = nil,
        strict: Bool? = nil
    ) {
        self.name = name
        self.description = description
        self.parameters = parameters
        self.arguments = arguments
        self.strict = strict
    }
}
