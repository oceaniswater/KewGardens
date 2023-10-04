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
        self.layout.scrollDirection = .horizontal
        self.layout.minimumLineSpacing = 10.0
        self.layout.minimumInteritemSpacing = 10.0
        self.layout.itemSize.width = self.itemW
        self.ticketsCollection.collectionViewLayout = layout
        self.ticketsCollection.backgroundColor = .clear
        self.ticketsCollection.decelerationRate = .fast
        
        
        self.ticketsCollection.delegate = self
        self.ticketsCollection.dataSource = self
        self.ticketsCollection.contentInsetAdjustmentBehavior = .never
        self.ticketsCollection.showsVerticalScrollIndicator = false
        self.ticketsCollection.showsHorizontalScrollIndicator = false
        self.ticketsCollection.contentInset = UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
        

        
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
        return CGSize(width: self.itemW, height: self.itemH)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
//    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//        let layout = ticketsCollection.collectionViewLayout as! UICollectionViewFlowLayout
//        
//        // Calculate the total width of a cell including minimumInteritemSpacing
//        let itemWidth = 300.0 + layout.minimumInteritemSpacing
//        print(layout.itemSize.width)
//        
//        // Calculate the index of the cell that should be visible after the scroll
//        let index = (targetContentOffset.pointee.x + scrollView.contentInset.left) / itemWidth
//        print(index)
//        
//        // Round the index to the nearest whole number to get the index of the cell
//        let roundedIndex = round(index)
//        
//        // Calculate the new content offset based on the rounded index
//        let newOffsetX = roundedIndex * itemWidth - scrollView.contentInset.left
//        print(scrollView.contentInset.left)
//        
//        // Update the target content offset to scroll to the new position
//        targetContentOffset.pointee = CGPoint(x: newOffsetX, y: -scrollView.contentInset.top)
//    }

}

//extension TicketVC {
//    
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if decelerate {
//            setupCell()
//        }
//        
//        private func setupCell() {
//            let indexPath = IndexPath(item: layout.currentPage, section: 0)
//            let cell = collectionView.cellForItem(at: indexPath)
//            transformCell(cell)
//            
//        }
//        
//        private func transformCell(_ cell: UICollectionViewCell, isEffect: Bool = true) {
//            if lisEffect {
//                cell.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                return
//                
//            }
//            
//            UIView.animate(withDuration: 0.2) {
//                cell. transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                
//            }
//            
//        }
//        
//    }
//}
