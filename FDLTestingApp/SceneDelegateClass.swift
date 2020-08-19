//
//  SceneDelegateClass.swift
//  Tooba3
//
//  Created by Abdullah Tawfik on 18.08.2020.
//  Copyright © 2020 Tooba. All rights reserved.
//

import Foundation
import FirebaseCore
import FirebaseDynamicLinks

@available(iOS 13.0, *)
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
//    private let appCoordinator =  AppCoordinator()
//    private let rootTabBarCoordinator = RootTabBarCooridnator()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let userActivity = connectionOptions.userActivities.first(where: { $0.webpageURL != nil }) else { return }
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // appCoordinator.loadRootCoordinator(rootTabBarCoordinator)
        
        if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: userActivity.webpageURL!) {
            self.handleIncomingDynamicLink(dynamicLink)
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        guard let incomingURL = userActivity.webpageURL else { return }
        if let dynamicLink = DynamicLinks.dynamicLinks().dynamicLink(fromCustomSchemeURL: incomingURL) {
            self.handleIncomingDynamicLink(dynamicLink)
        }
    }
    
    func handleIncomingDynamicLink(_ dynamicLink: DynamicLink) {
        guard let url = dynamicLink.url else {
            print("That's weird. My dynamic link object has no url")
            return
        }
        
//        self.openProjectFromDeepLink(url.absoluteString)
    }
}
