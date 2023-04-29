//
//  OpenAIChatModel.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public enum OpenAIChatModel: String, Codable {
    
    case gpt35turbo = "gpt-3.5-turbo"
    
    case gpt35turbo0301 = "gpt-3.5-turbo-0301"
    
    case gpt4 = "gpt-4"
    
    case gpt40314 = "gpt-4-0314"
    
    case gpt432k = "gpt-4-32k"
    
    case gpt432k0314 = "gpt-4-32k-0314"
}
