//
//  Order.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 29.07.2024.
//

import Foundation

struct OrderNetworkModel: Codable {
    let nfts: [String]
    let id: String
}
