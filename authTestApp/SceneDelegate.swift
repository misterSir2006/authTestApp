//
//  SceneDelegate.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(frame: UIScreen.main.bounds)

        let rootVc = CustomNavigationController(rootViewController: UIViewController())
        self.window?.rootViewController = rootVc

        window?.makeKeyAndVisible()
        window?.windowScene = windowScene
    }

}

