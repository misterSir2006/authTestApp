//
//  CustomNavigationController.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override init(rootViewController: UIViewController) {
        var rootVC: UIViewController = UIViewController()

        if Constants.signedIn {
            rootVC = ProfileViewController()
        } else {
            rootVC = AuthViewController()
        }

        super.init(rootViewController: rootVC)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
