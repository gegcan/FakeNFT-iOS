//
//  UsersRequest.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 23.07.2024.
//

import Foundation

struct UsersRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/users")
    }
}
