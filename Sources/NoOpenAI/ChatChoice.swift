//
//  ChatChoice.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public struct ChatChoice: Codable {
    
    public var message: ChatMessage?
    
    public var finishReason: ChatFinishReason?
    
    public var index: Int?
    
    init(message: ChatMessage? = nil, finishReason: ChatFinishReason? = nil, index: Int? = nil) {
        self.message = message
        self.finishReason = finishReason
        self.index = index
    }
}
