//
//  ChatResponse.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

public struct ChatResponse: Content {
    
    public var id: String?
    
    public var object: ChatObject?
    
    public var created: Date?
    
    public var model: ChatModel?
    
    public var usage: ChatAPIUsage?
    
    public var choices: [ChatChoice]?
}
