//
//  SceneDelegate.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 21.07.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
 var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        let navigationController = UINavigationController()
        applicationCoordinator = ApplicationCoordinator(navigationController: navigationController)
        applicationCoordinator?.start()
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }



}

