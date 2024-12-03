
import Foundation
import Vapor

public class NoOpenAI {
    
    // MARK: API URL
    
    let apiScheme = "https"
    
    let apiHost = "api.openai.com"
    
    public var apiEncoder: JSONEncoder {
        let encoder = JSONEncoder()
        return encoder
    }
    
    public var apiDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    public func headers(apiKey: String) -> HTTPHeaders {
        HTTPHeaders([
            ("Authorization", "Bearer \(apiKey)"),
            ("Content-Type", "application/json")
        ])
    }
    
    public init() { }
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
    
    func url(route: APIRoute) -> URL {
        return URL(string: "\(apiScheme)://\(apiHost)/\(route.description)")!
    }
    
    func uri(route: APIRoute) -> URI {
        return URI(scheme: apiScheme, host: apiHost, path: route.description)
    }
}
