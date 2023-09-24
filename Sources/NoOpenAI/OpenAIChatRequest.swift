//
//  OpenAIChatRequest.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

public struct OpenAIChatRequest: Content {
    
    var model: String?
    
    var n: Int?
    
    var messages: [OpenAIChatMessage]?
    
    var user: String?
    
    public init(
        model: String? = nil,
        n: Int? = nil,
        messages: [OpenAIChatMessage]? = nil,
        user: String? = nil
    ) {
        self.model = model
        self.n = n
        self.messages = messages
        self.user = user
    }
}
