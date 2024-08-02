//
//  UserModel.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 23.07.2024.
//

import Foundation

struct UserNetworkModel: Decodable {
    let name: String
    let avatar: String?
    let description: String?
    let website: String?
    let nfts: [String]
    let rating: String
    let id: String
}
