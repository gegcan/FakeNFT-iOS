//
//  NftResultModel.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 30.07.2024.
//

import Foundation

struct NftResultModel {
    let createdAt: Date
    let name: String
    let images: [URL]
    let rating: Int
    let description: String
    let price: Float
    let author: URL?
    let id: String
}
