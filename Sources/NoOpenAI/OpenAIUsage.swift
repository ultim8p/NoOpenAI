//
//  OpenAIUsage.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public final class OpenAIUsage: Codable {
    
    public var promptTokens: Int?
    
    public var completionTokens: Int?
    
    public var totalTokens: Int?
    
    public init(promptTokens: Int? = nil, completionTokens: Int? = nil, totalTokens: Int? = nil) {
        self.promptTokens = promptTokens
        self.completionTokens = completionTokens
        self.totalTokens = totalTokens
    }
}
