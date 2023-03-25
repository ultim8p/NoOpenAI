//
//  OpenAIUsage.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public struct OpenAIUsage: Codable {
    
    var promptTokens: Int?
    
    var completionTokens: Int?
    
    var totalTokens: Int
}
