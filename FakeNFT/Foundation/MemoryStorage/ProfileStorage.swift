//
//  ProfileStorage.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 29.07.2024.
//

import Foundation

protocol ProfileStorage: AnyObject {
    func saveProfile(_ profile: ProfileModel)
    func getProfile(id: String) -> ProfileModel?
}

final class ProfileStorageImpl: ProfileStorage {
    static let shared = ProfileStorageImpl()

    private var storage: [String: ProfileModel] = [:]

    private let syncQueue = DispatchQueue(label: "sync-profile-queue")

    // MARK: - Initialization
    private init() { }

    func saveProfile(_ profile: ProfileModel) {
        syncQueue.async { [weak self] in
            self?.storage[profile.id] = profile
        }
    }

    func getProfile(id: String) -> ProfileModel? {
        syncQueue.sync {
            storage[id]
        }
    }
}
