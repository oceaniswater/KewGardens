//
//  Router.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 28/09/2023.
//

import UIKit

protocol RouterMain {
    var moduleBuilder: ModuleBuilderProtocol? {get set}
    var navigationController: UINavigationController? {get set}
}

protocol RouterProtocol: RouterMain {
//    func initialViewController() -> UITabBarController?
    func initialViewController()
//    func signInViewController()
//    func homeViewController()
//    func tabBarController()
//    func shopViewController(shop: Shop?)
//    func mapViewController(shop: Shop?)
//    func showCharacters()
//    func showCharacterDetails(character: Character?)
//
//    func showLocations()
//    func showLocationDetail(location: LocationResult?)
//    func showCharacterDetailsFromLocation(character: Character?)
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?

    
    init(assembleyBuilder: ModuleBuilderProtocol, navigationController: UINavigationController) {
        self.moduleBuilder = assembleyBuilder
        self.navigationController = navigationController
    }
    
    func initialViewController() {
        guard let navigationController = navigationController else { return }
        guard let welcomeVC = self.moduleBuilder?.createWelcomeModule(router: self) else { return }
        navigationController.viewControllers = [welcomeVC]
        
    }
    
//    func signInViewController() {
//        guard let navigationController = navigationController else { return }
//        guard let signInVC = self.moduleBuilder?.createSignInModule(router: self) else { return }
//        navigationController.pushViewController(signInVC, animated: true)
//        
//    }
//    
//    func homeViewController() {
//        guard let navigationController = navigationController else { return }
//        guard let homeVC = self.moduleBuilder?.createHomeModule(router: self) else { return }
//        navigationController.pushViewController(homeVC, animated: true)
//    }
    
//    func shopViewController(shop: Shop?) {
//        guard let navigationController = navigationController else { return }
//        guard let shopVC = self.moduleBuilder?.createShopModule(shop: shop, router: self) else { return }
//        navigationController.pushViewController(shopVC, animated: true)
//    }
//    
//    func mapViewController(shop: Shop?) {
//        guard let navigationController = navigationController else { return }
//        guard let mapVC = self.moduleBuilder?.createMapModule(shop: shop, router: self) else { return }
//        navigationController.pushViewController(mapVC, animated: true)
//    }
    
    
//    func initialViewController() -> UITabBarController? {
//            guard let mainViewController = self.assembleyBuilder?.createMainModule(router: self),
//                  let charactersViewController = self.assembleyBuilder?.createCharactersModule(router: self),
//                  let locationsViewController = self.assembleyBuilder?.createLocationsModule(router: self) else {return nil}
//
//            characterNC = UINavigationController(rootViewController: charactersViewController)
//            locationNC = UINavigationController(rootViewController: locationsViewController)
//            homeNC = UINavigationController(rootViewController: mainViewController)
//
//            guard let tabBarController = self.assembleyBuilder?.createTabBarModule(router: self, viewControllers: [characterNC!, homeNC!, locationNC!]) else {return nil}
//
//            return tabBarController
//    }
    
    // MARK: - Characters - Character Detail
//    func tabBarController() {
//        if let navigationController = navigationController {
//            guard let homeViewController = self.moduleBuilder?.createHomeModule(router: self),
//                  let shopsViewController = self.moduleBuilder?.createShopsModule(router: self),
//                  let cartViewController = self.moduleBuilder?.createCartModule(router: self),
//                  let profileViewController = self.moduleBuilder?.createProfileModule(router: self),
//                  let tabBarController = self.moduleBuilder?.createTabBarModule(router: self, viewControllers: [homeViewController, shopsViewController, cartViewController, profileViewController], images: ["house", "building.2", "cart", "person.crop.circle.dashed"]) else {return}
//            DispatchQueue.main.async {
//                navigationController.pushViewController(tabBarController, animated: true)
//            }
//
//        }
//    }
    
//    func showCharacterDetails(character: Character?) {
//        if let characterNC = characterNC {
//            guard let detailViewController = self.assembleyBuilder?.createCharacterDetailModule(character: character, router: self) else {return}
//            DispatchQueue.main.async {
//                characterNC.pushViewController(detailViewController, animated: true)
//            }
//
//        }
//    }
    
//    func showCharacterDetailsFromLocation(character: Character?) {
//        if let locationNC = locationNC {
//            guard let detailViewController = self.assembleyBuilder?.createCharacterDetailModule(character: character, router: self) else {return}
//            DispatchQueue.main.async {
//                locationNC.pushViewController(detailViewController, animated: true)
//            }
//
//        }
//    }
    
    // MARK: - Locations - Location Detail
//    func showLocations() {
//        if let locationNC = navigationController {
//            guard let locationsViewController = self.assembleyBuilder?.createLocationsModule(router: self) else {return}
//            DispatchQueue.main.async {
//                navigationController.pushViewController(locationsViewController, animated: true)
//            }
//
//        }
//    }
    
//    func showLocationDetail(location: LocationResult?) {
//        if let locationNC = locationNC {
//            guard let detailViewController = self.assembleyBuilder?.createLocationDetailModule(location: location, router: self) else {return}
//            locationNC.pushViewController(detailViewController, animated: true)
//        }
//    }
//

    
    
}
