//
//  OpenAIResponseError.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import NoVaporAPI

public struct OpenAIResponseError: Error, Codable {
    
    public var error: OpenAIError?
}
