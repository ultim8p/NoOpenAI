//
//  File.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Foundation
import NoVaporAPI

public struct ChatAPIError: NoVaporAPIError {
    
    var message: String?
    
    var code: String?
    
    var param: String?
    
    var type: String?
}
