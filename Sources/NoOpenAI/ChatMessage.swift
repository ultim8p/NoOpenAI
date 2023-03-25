//
//  ChatMessage.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public struct ChatMessage: Codable {
    
    public var role: ChatRole?
    
    public var content: String?
    
    public init(role: ChatRole? = nil, content: String? = nil) {
        self.role = role
        self.content = content
    }
}
