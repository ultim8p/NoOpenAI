//
//  OpenAIChatChoice.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import Vapor

public final class OpenAIChatChoice<T: Codable>: Codable {
    
    public var index: Int?
    
    public var message: OpenAIChatMessage<T>?
    
    public var finishReason: OpenAIChatFinishReason?
    
    init(message: OpenAIChatMessage<T>? = nil, finishReason: OpenAIChatFinishReason? = nil, index: Int? = nil) {
        self.message = message
        self.finishReason = finishReason
        self.index = index
    }
}

//public final class OpenAIChatChiceMessageText: Content {
//    
//    public var role: String?
//    
//    public var content: String?
//}
