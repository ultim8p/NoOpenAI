//
//  OpenAIError.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation

public struct OpenAIError: Codable {
    
    public var message: String?
    
    public var code: String?
    
    public var param: String?
    
    public var type: String?
}
