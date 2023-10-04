//
//  QuotesVC.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 01/10/2023.
//

import UIKit

class QuotesVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - Setup View
private extension QuotesVC {
    func setupView() {
        view.backgroundColor = UIColor.appBackground
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension QuotesVC {
    func addSubview() {
        
    }
}

// MARK: - Setup Layout
private extension QuotesVC {
    func setupLayout() {
            
    }
}

//// MARK: - QuotesViewProtocol
//extension QuotesVC: QuotesViewProtocol {
//    func success() {
//        DispatchQueue.main.async {
//            self.reloadColectionView()
//        }
//    }
//}
