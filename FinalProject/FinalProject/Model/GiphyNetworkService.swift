//
//  GiphyNetworkService.swift
//  FinalProject
//
//  Created by 18267440 on 15.07.2021.
//

import Foundation

final class GiphyNetworkService {

    private let session: URLSession = .shared
    private let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    deinit {
        print("GiphyNetworkService deinit")
    }
}


extension GiphyNetworkService: GiphyNetworkServiceProtocol {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void) {

    }
    
    func getData(with completion: @escaping (GetRandomGifAPIResponse) -> Void) {
        
        let components = URLComponents(string: Const.GiphyAPIMethods.getRandomGif)
        guard let url = components?.url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(Const.GiphyKey.APIKey, forHTTPHeaderField: "api_key")
        
        // hadler
        let handler: Handler = { rawData, response, taskError in
            do {
                let data = try self.httpResponse(data: rawData, response: response)
    
                let response = try self.decoder.decode(GetRandomGifResponse.self, from: data)
               
                completion(.success(response))
            } catch let error as NetworkServiceError {
                completion(.failure(error))
            } catch {
                completion(.failure(.unknown))
            }
        }
        // call
        session.dataTask(with: request, completionHandler: handler).resume()
        
    }

    private func httpResponse(data: Data?, response: URLResponse?) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode),
              let data = data else {
            throw NetworkServiceError.network
        }
        return data
    }
}
