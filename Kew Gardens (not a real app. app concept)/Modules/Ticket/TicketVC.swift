//
//  TicketVC.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 29/09/2023.
//

import UIKit
import SnapKit

let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height

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
    
    var layout = CustomLayout()
    
    var ticketsCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var itemW: CGFloat {
        return screenWidth * 0.8
    }
    
    var itemH: CGFloat {
        return itemW * 1.7
    }
    
    
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
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(30)
            make.bottom.equalToSuperview().inset(100)
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
