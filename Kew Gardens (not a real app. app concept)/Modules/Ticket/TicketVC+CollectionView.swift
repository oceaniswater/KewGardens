//
//  TicketVC+CollectionView.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 29/09/2023.
//

import Foundation
import UIKit

extension TicketVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func reloadColectionView() {
        DispatchQueue.main.async {
            self.ticketsCollection.reloadData()
        }

    }
    
    func setupCollectionView() {

        self.ticketsCollection.delegate = self
        self.ticketsCollection.dataSource = self
        
        registerCollectionCell()
    }
    
    func registerCollectionCell() {
        self.ticketsCollection.register(TicketCell.self, forCellWithReuseIdentifier: TicketCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.vm.numberOfItemsInSection(in: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.vm.numberOfSection()

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TicketCell.identifier, for: indexPath) as! TicketCell
        if let ticket = vm.tickets[indexPath.row] {
            cell.configure(with: ticket)
        }
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let shop = presenter.shops[indexPath.row] {
//            presenter.tapToShop(shop: shop)
//        }
//    }
    
    
}

extension TicketVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 230, height: 230)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

}
