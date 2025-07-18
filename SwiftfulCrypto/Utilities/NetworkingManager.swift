//
//  NetworkingManager.swift
//  SwiftfulCrypto
//
//  Created by Paul Norris on 7/16/25.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse (url: URL)
        case unknown
        
        var errorDescription: String? {
            switch self {
            case .badURLResponse(url: let url ):
                return "[🔥]Bad URL Response. for URL: \(url)"
            case .unknown:
                return "[⁉️]Unknown Error"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
//        Data, Publishers.ReceiveOn<Publishers.TryMap<Publishers.SubscribeOn<URLSession.DataTaskPublisher, DispatchQueue>, Data>, DispatchQueue> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap( { try handleURLResponse(output: $0, url: url) } )
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
  // debugging
        // throw NetworkingError.badURLResponse(url: url)
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300
        else {
            throw NetworkingError.badURLResponse(url: url)
        }
        print("[👍🏼]This is output.data.description: ",output.data.description)
        print("[🙄]this is output.data.base64EncodedString:", output.data.base64EncodedString())
        return output.data
    }
    
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print("error is ", error.localizedDescription)
        }
    }
}

