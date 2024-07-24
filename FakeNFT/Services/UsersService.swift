//
//  UsersService.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 23.07.2024.
//

import Foundation

typealias UsersCompletion = (Result<[UserModel], Error>) -> Void

protocol UsersServiceProtocol {
    func loadUsers(completion: @escaping UsersCompletion)
}

final class UserServiceImpl: UsersServiceProtocol {

    private let networkClient: NetworkClient

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func loadUsers(completion: @escaping UsersCompletion) {

        let request = UsersRequest()

        networkClient.send(request: request, type: [UserModel].self, completionQueue: .main) { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
