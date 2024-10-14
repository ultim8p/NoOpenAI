//
//  OpenAIChatMessage.swift
//  
//
//  Created by Guerson Perez on 3/13/23.
//

import Vapor
import Foundation

public final class OpenAIChatMessageContent: Codable {
    
    public struct ImageUrl: Codable {
        
        var url: String?
        
        public init(url: String? = nil) {
            self.url = url
        }
    }
    
    public enum ContentType: String, Codable {
        
        case text
        
        case imageUrl = "image_url"
    }
    
    var type: ContentType?
    
    var text: String?
    
    var image_url: ImageUrl?
    
    public init(type: ContentType? = nil, text: String? = nil, image_url: ImageUrl? = nil) {
        self.type = type
        self.text = text
        self.image_url = image_url
    }
}

public final class OpenAIChatRequestMessage: Codable {
    
    public var role: OpenAIChatRole?
    
    public var content: [OpenAIChatMessageContent]?
    
    public var tool_calls: [OpenAITool]?
    
    public var tool_call_id: String?
    
    public init(
        role: OpenAIChatRole? = nil,
        content: [OpenAIChatMessageContent]? = nil,
        tool_calls: [OpenAITool]? = nil,
        tool_call_id: String? = nil
    ) {
        self.role = role
        self.content = content
        self.tool_calls = tool_calls
        self.tool_call_id = tool_call_id
    }
}





// MARK: - Chat Message
// For RESPONSE
public struct OpenAIChatMessage<T: Codable>: Codable {
    
    public var role: String?
    
    public var content: T?
    
    public var refusal: String?
    
    public var tool_calls: [OpenAITool]?
    
    public init(
        role: String? = nil,
        content: T? = nil,
        refusal: String? = nil,
        tool_calls: [OpenAITool]? = nil
    ) {
        self.role = role
        self.content = content
        self.refusal = refusal
        self.tool_calls = tool_calls
    }
    
    private enum CodingKeys: String, CodingKey {
        case role
        case content
        case refusal
        case toolCalls
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        role = try container.decodeIfPresent(String.self, forKey: .role)
        refusal = try container.decodeIfPresent(String.self, forKey: .refusal)
        tool_calls = try container.decodeIfPresent([OpenAITool].self, forKey: .toolCalls)
        
        if T.self == String.self {
            content = try container.decodeIfPresent(T.self, forKey: .content)
        } else if let contentString = try container.decodeIfPresent(String.self, forKey: .content),
                  let data = contentString.data(using: .utf8) {
            do {
                content = try JSONDecoder().decode(T.self, from: data)
            } catch {
                print("OpenAIChatMessage failed to decode generic type")
                throw(error)
            }
        } else {
            content = nil
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(role, forKey: .role)
        try container.encodeIfPresent(refusal, forKey: .refusal)
        try container.encodeIfPresent(tool_calls, forKey: .toolCalls)
        
        if T.self == String.self {
            try container.encodeIfPresent(content as? String, forKey: .content)
        } else if let content = content {
            do {
                let data = try JSONEncoder().encode(content)
                let contentString = String(data: data, encoding: .utf8)
                try container.encodeIfPresent(contentString, forKey: .content)
            } catch {
                print("OpenAIChatMessage failed to encode generic type")
                throw(error)
            }
        }
    }
}
