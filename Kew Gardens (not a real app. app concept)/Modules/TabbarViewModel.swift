//
//  TabbarViewModel.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 28/09/2023.
//

import Foundation
import UIKit

protocol TabBarProtocol: AnyObject {
}

protocol TabbarViewModelProtocol: AnyObject {
    init(tabBar: TabBarProtocol, router: RouterProtocol, viewControllers: [UIViewController], images: [String])
    func generateTabBarItems() -> [UIViewController]?
    func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController
}

class TabBarViewModel: TabbarViewModelProtocol {

    weak var tabBar: TabBarProtocol?
    var router: RouterProtocol?
    var vc: [UIViewController]?
    var images: [String]?
    
    required init(tabBar: TabBarProtocol, router: RouterProtocol, viewControllers: [UIViewController], images: [String]) {
        self.tabBar = tabBar
        self.router = router
        self.vc = viewControllers
        self.images = images
    }
    
    
    func generateTabBarItems() -> [UIViewController]? {
        guard let vc = vc else {return nil}
        var viewControllers: [UIViewController] = []
        for i in 0..<vc.count {
            viewControllers.append(generateVC(viewController: vc[i], image: UIImage(systemName: images?[i] ?? "folder")))
        }
        return viewControllers
    }
    
    func generateVC(viewController: UIViewController, image: UIImage?) -> UIViewController {
            viewController.tabBarItem.image = image
            return viewController
    }
    
}
