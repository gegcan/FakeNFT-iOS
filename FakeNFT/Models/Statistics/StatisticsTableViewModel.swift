//
//  StatisticsTableViewModel.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 20.07.2024.
//

import UIKit

struct UserDetails: Hashable {
    let avatarId: Int
    let name: String
    let rating: Int
    let description: String
    let urlSite: String
}

struct CollectionNFT {
    let image: UIImage
    let isLiked: Bool
    let rating: Int
    let name: String
    let price: Double
    let currencyCode: String
}
