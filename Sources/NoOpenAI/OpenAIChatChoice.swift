//
//  OpenAIChatChoice.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

public final class OpenAIChatChoice<T: Codable>: Codable {
    
    public var message: OpenAIChatMessage<T>?
    
    public var finishReason: OpenAIChatFinishReason?
    
    public var index: Int?
    
    init(message: OpenAIChatMessage<T>? = nil, finishReason: OpenAIChatFinishReason? = nil, index: Int? = nil) {
        self.message = message
        self.finishReason = finishReason
        self.index = index
    }
}
