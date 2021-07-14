//
//  GiphyNetworkServiceProtocol.swift
//  FinalProject
//
//  Created by 18267440 on 13.07.2021.
//

import Foundation

typealias GetRandomGifAPIResponse = Result<GetRandomGifResponse, NetworkServiceError>

protocol GiphyNetworkServiceProtocol {
    func getGiphy(after cursor: String?, completion: @escaping (GetRandomGifAPIResponse) -> Void)
}
