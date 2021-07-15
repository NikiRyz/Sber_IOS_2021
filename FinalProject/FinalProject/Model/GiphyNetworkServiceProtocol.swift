//
//  GiphyNetworkServiceProtocol.swift
//  FinalProject
//
//  Created by 18267440 on 13.07.2021.
//

import Foundation

typealias GetRandomGifAPIResponse = Result<GetRandomGifResponse, NetworkServiceError>

protocol GiphyNetworkServiceProtocol {
    func getData(with completion: @escaping (GetRandomGifAPIResponse) -> Void)
    func loadImage(imageUrl: String, completion: @escaping (Data?) -> Void)
}
