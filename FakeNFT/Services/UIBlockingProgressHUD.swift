//
//  UIBlockingProgressHUD.swift
//  FakeNFT
//
//  Created by Александр Гегешидзе on 23.07.2024.
//

import UIKit
import ProgressHUD

final class UIBlockingProgressHUD {
    private static var window: UIWindow? {
        return UIApplication.shared.windows.first
    }

    static func show() {
        window?.isUserInteractionEnabled = false
        ProgressHUD.animate()
    }

    static func showWithoutBloсking() {
        window?.isUserInteractionEnabled = true
        ProgressHUD.animate()
    }

    static func dismiss() {
        window?.isUserInteractionEnabled = true
        ProgressHUD.dismiss()
    }
}
