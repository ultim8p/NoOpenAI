//
//  File.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

public struct ChatRequest: Content {
    
    var model: ChatModel?
    
    var n: Int?
    
    var messages: [ChatMessage]?
    
    var user: String?
    
    public init(model: ChatModel? = nil, n: Int? = nil, messages: [ChatMessage]? = nil, user: String? = nil) {
        self.model = model
        self.n = n
        self.messages = messages
        self.user = user
    }
}
