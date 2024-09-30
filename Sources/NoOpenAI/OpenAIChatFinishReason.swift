//
//  OpenAIChatFinishReason.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public enum OpenAIChatFinishReason: String, Codable {
    
    case stop
    
    // Check if the conversation was too long for the context window
    case length
    
    // Check if the model's output included copyright material (or similar)
    case content_filter
    
    // Check if the model has made a tool_call. This is the case either if the "finish_reason" is "tool_calls" or if the "finish_reason" is "stop" and our API request had forced a function call
    case tool_calls
}
