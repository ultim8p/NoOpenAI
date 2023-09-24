//
//  OpenAIChatResponse.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

public struct OpenAIChatResponse: Content {
    
    public var id: String?
    
    public var object: OpenAIChatObject?
    
    public var created: Date?
    
    public var model: String?
    
    public var usage: OpenAIUsage?
    
    public var choices: [OpenAIChatChoice]?
}
