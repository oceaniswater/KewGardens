//
//  TicketVC.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 29/09/2023.
//

import UIKit
import SnapKit

class TicketVC: UIViewController {
    
    var vm: TicketViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupCollectionView()
    }
    
    // MARK: - Private properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Your tickets"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    let ticketsCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .clear
        return collection
    }()
    
    
}

// MARK: - Setup View
private extension TicketVC {
    func setupView() {
        view.backgroundColor = UIColor.appBackground
        
        addSubview()
        setupLayout()
        
    }
}

// MARK: - Setting
private extension TicketVC {
    func addSubview() {
        view.addSubview(titleLabel)
        view.addSubview(ticketsCollection)
    }
}

// MARK: - Setup Layout
private extension TicketVC {
    func setupLayout() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        ticketsCollection.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.height.equalTo(230)
//            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

// MARK: - ShopsViewProtocol
extension TicketVC: TicketViewProtocol {
    func success() {
        DispatchQueue.main.async {
            self.reloadColectionView()
        }
    }
}
