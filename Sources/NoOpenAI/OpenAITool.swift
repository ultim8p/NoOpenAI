//
//  OpenAITool.swift
//  NoOpenAI
//
//  Created by Guerson Perez on 13/10/24.
//

import Foundation
import Vapor

public struct OpenAITool: Codable {
    
    public var id: String?
    
    public var function: OpenAIToolFunction?
    
    // function
    public var type: String?
    
    public init(id: String? = nil, function: OpenAIToolFunction? = nil, type: String? = nil) {
        self.id = id
        self.function = function
        self.type = type
    }
}
