//
//  ProfileModel.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 20.07.2024.
//

import Foundation

public struct ProfileModel {
    let name: String
    let avatar: String?
    let description: String?
    let website: String?
    let nfts: [NftModel]
    let likes: [NftModel]
    let id: String
}
