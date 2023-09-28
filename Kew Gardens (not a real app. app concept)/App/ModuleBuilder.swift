//
//  ModuleBuilder.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 28/09/2023.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createWelcomeModule(router: RouterProtocol) -> UIViewController
//    func createSignInModule(router: RouterProtocol) -> UIViewController
//    func createHomeModule(router: RouterProtocol) -> UIViewController
//    func createShopsModule(router: RouterProtocol) -> UIViewController
//    func createCartModule(router: RouterProtocol) -> UIViewController
//    func createProfileModule(router: RouterProtocol) -> UIViewController
//    func createTabBarModule(router: RouterProtocol, viewControllers: [UIViewController], images: [String]) -> UITabBarController

//    func createCharactersModule(router: RouterProtocol) -> UIViewController
//    func createShopModule(shop: Shop?, router: RouterProtocol) -> UIViewController
//    func createMapModule(shop: Shop?, router: RouterProtocol) -> UIViewController
//
//    func createLocationsModule(router: RouterProtocol) -> UIViewController
//    func createLocationDetailModule(location: LocationResult?, router: RouterProtocol) -> UIViewController
//
//    func createTabBarModule(router: RouterProtocol, viewControllers: [UIViewController]) -> UITabBarController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createWelcomeModule(router: RouterProtocol) -> UIViewController {
        let view = MainVC()
//        let presenter = WelcomePresenter(view: view, router: router)
//        view.presenter = presenter
        return view
    }
    
//    func createSignInModule(router: RouterProtocol) -> UIViewController {
//        let view = SignInViewController()
//        let presenter = SignInPresenter(view: view, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createHomeModule(router: RouterProtocol) -> UIViewController {
//        let view = HomeViewController()
//        let presenter = HomePresenter(view: view, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createShopsModule(router: RouterProtocol) -> UIViewController {
//        let view = ShopsViewController()
//        let presenter = ShopsPresenter(view: view, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createCartModule(router: RouterProtocol) -> UIViewController {
//        let view = CartViewController()
//        let presenter = CartPresenter(view: view, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createProfileModule(router: RouterProtocol) -> UIViewController {
//        let view = ProfileViewController()
//        let presenter = ProfilePresenter(view: view, router: router)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createTabBarModule(router: RouterProtocol, viewControllers: [UIViewController], images: [String]) -> UITabBarController {
//        let tabBar = TabBarViewController()
//        let presenter = TabBarPresenter(tabBar: tabBar, router: router, viewControllers: viewControllers, images: images)
//        tabBar.presenter = presenter
//        return tabBar
//        
//    }
//    
//    func createShopModule(shop: Shop?, router: RouterProtocol) -> UIViewController {
//        let view = ShopViewController()
//        let presenter = ShopPresenter(view: view, router: router, shop: shop)
//        view.presenter = presenter
//        return view
//    }
//    
//    func createMapModule(shop: Shop?, router: RouterProtocol) -> UIViewController {
//        let view = MapViewController()
//        let presenter = MapPresenter(view: view, router: router, shop: shop)
//        view.presenter = presenter
//        return view
//    }
//
//    func createCharacterDetailModule(character: Character?, router: RouterProtocol) -> UIViewController {
//        let view = CharacterDetailViewController()
//        let networkService = NetworkService()
//        let presenter = CharacterDetailPresenter(view: view, networkService: networkService, router: router, character: character)
//        view.presenter = presenter
//        return view
//    }
//
//    func createLocationsModule(router: RouterProtocol) -> UIViewController {
//        let view = LocationsViewController()
//        let networkService = NetworkService()
//        let presenter = LocationsPresenter(view: view, networkService: networkService, router: router)
//        view.presenter = presenter
//        return view
//    }
//
//    func createLocationDetailModule(location: LocationResult?, router: RouterProtocol) -> UIViewController {
//        let view = LocationDetailViewController()
//        let networkService = NetworkService()
//        let presenter = LocationDetailPresenter(view: view, networkService: networkService, router: router, location: location)
//        view.presenter = presenter
//        return view
//    }
//
//
}
