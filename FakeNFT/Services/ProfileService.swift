//
//  ProfileService.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 29.07.2024.
//

import Foundation

typealias ProfileCompletion = (Result<ProfileResult, Error>) -> Void

protocol ProfileServiceProtocol {
    func getProfile(completion: @escaping ProfileCompletion)
    func updateProfile(with userProfile: ProfileUpdate, completion: @escaping ProfileCompletion)
}

final class ProfileService: ProfileServiceProtocol {
    static let shared = ProfileService(networkClient: DefaultNetworkClient())

    private let networkClient: NetworkClient

    private init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func getProfile(completion: @escaping ProfileCompletion) {
        let request = GetProfileRequest()
        networkClient.send(request: request, type: ProfileResult.self) { result in
            switch result {
            case .success(let profile):
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateProfile(with profileUpdate: ProfileUpdate, completion: @escaping ProfileCompletion) {
        let request = PutProfileRequest(profile: profileUpdate)
        networkClient.send(request: request, type: ProfileResult.self) { result in
            switch result {
            case .success(let profile):
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
