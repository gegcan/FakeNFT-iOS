//
//  NftsRequest.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 29.07.2024.
//

import Foundation

struct NftsRequest: NetworkRequest {
    var endpoint: URL? {
        URL(string: "\(RequestConstants.baseURL)/api/v1/nft")
    }
}
