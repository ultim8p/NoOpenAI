
import Foundation
import Vapor

public class NoOpenAI {
    
    var apiKey: String
    
    // MARK: API URL
    
    let apiScheme = "https"
    
    let apiHost = "api.openai.com"
    
    var apiEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }
    
    var apiDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    var headers: [(String, String)] {
        return [
            ("Authorization", "Bearer \(self.apiKey)"),
            ("Content-Type", "application/json")
        ]
    }
    
    public init(apiKey: String) {
        self.apiKey = apiKey
    }
}

protocol APIRoute: CustomStringConvertible { }

enum APIRouteChat: APIRoute {
    
    case chatCompletion
    
    var description: String {
        switch self {
        case .chatCompletion:
            return "/v1/chat/completions"
        }
    }
}

extension NoOpenAI {
    
    func uri(route: APIRoute) -> URI {
        return URI(scheme: apiScheme, host: apiHost, path: route.description)
    }
}
