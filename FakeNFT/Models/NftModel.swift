//
//  NftModel.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 20.07.2024.
//

import Foundation

public struct NftModel {
    let createdAt: Date
    let name: String
    let images: [String]
    let rating: Int
    let description: String?
    let price: Float
    let author: String
    let id: String
}
