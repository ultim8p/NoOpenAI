//
//  OpenAIChatChoice.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public final class OpenAIChatChoice: Codable {
    
    public var message: OpenAIChatMessage?
    
    public var finishReason: OpenAIChatFinishReason?
    
    public var index: Int?
    
    init(message: OpenAIChatMessage? = nil, finishReason: OpenAIChatFinishReason? = nil, index: Int? = nil) {
        self.message = message
        self.finishReason = finishReason
        self.index = index
    }
}
