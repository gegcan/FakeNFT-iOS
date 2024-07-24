//
//  NftServiceProtocol.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 23.07.2024.
//

import Foundation

typealias NftCompletion = (Result<NftNetworkModel, Error>) -> Void

protocol NftServiceProtocol {
    func loadNft(id: String, completion: @escaping NftCompletion)
}

final class NftServiceImpl: NftServiceProtocol {

    private let networkClient: NetworkClient
    private let storage: NftStorage

    init(networkClient: NetworkClient, storage: NftStorage) {
        self.storage = storage
        self.networkClient = networkClient
    }

    func loadNft(id: String, completion: @escaping NftCompletion) {
        if let nft = storage.getNft(with: id) {
            completion(.success(nft))
            return
        }

        let request = NFTRequest(id: id)
        networkClient.send(request: request, type: NftNetworkModel.self) { [weak storage] result in
            switch result {
            case .success(let nft):
                storage?.saveNft(nft)
                completion(.success(nft))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
