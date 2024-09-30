//
//  OpenAIChatRole.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public enum OpenAIChatRole: String, Codable {
    
    case user
    
    case assistant
    
    case system
    
    case tool
    
    case toolCall
}
