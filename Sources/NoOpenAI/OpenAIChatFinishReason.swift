//
//  OpenAIChatFinishReason.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public enum OpenAIChatFinishReason: String, Codable {
    
    case stop
    
    case length
    
    case contentFilter
}
