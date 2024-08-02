//
//  ProfileResult.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 29.07.2024.
//

import Foundation

struct ProfileResult: Decodable {
    let name: String
    let avatar: String
    let description: String
    let website: String
    let nfts: [String]
    let likes: [String]
    let id: String
}
