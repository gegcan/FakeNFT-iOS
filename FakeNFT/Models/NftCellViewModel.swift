//
//  NftCellViewModel.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 30.07.2024.
//

import Foundation

struct NftCellViewModel {
    let name: String
    let images: [String]
    let rating: Int
    let price: Float
    let id: String
    let profile: ProfileUpdate
    let order: OrderResultModel
}
