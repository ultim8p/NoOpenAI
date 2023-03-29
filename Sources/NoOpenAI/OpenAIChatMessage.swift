//
//  OpenAIChatMessage.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public final class OpenAIChatMessage: Codable {
    
    public var role: OpenAIChatRole?
    
    public var content: String?
    
    public init(role: OpenAIChatRole? = nil, content: String? = nil) {
        self.role = role
        self.content = content
    }
}
