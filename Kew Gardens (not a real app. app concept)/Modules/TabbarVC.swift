//
//  TabbarVC.swift
//  Kew Gardens (not a real app. app concept)
//
//  Created by Mark Golubev on 28/09/2023.
//
import UIKit

class TabbarVC: UITabBarController {
    
    var vm: TabbarViewModelProtocol!
    var upperLineView: UIView!
    
    let spacing: CGFloat = 5

    override func viewDidLoad() {
        super.viewDidLoad()

        setTabBarApperance()
        roundTabBarCorners()
        
        self.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
        
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
    }
    

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewControllers = vm?.generateTabBarItems()
//        selectedIndex = 1
        
    }
    
    // for adopt tab bar color scheme for dark/light mode
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
//                let color = K.Design.cellBackgroundColor ?? .white
                let color = UIColor.buttonColour
                let roundLayer = self.tabBar.layer.sublayers?.first(where: { $0 is CAShapeLayer }) as? CAShapeLayer
                roundLayer?.fillColor = color.cgColor
                
//                roundLayer?.strokeColor = K.Design.cellBoundColor?.cgColor
                roundLayer?.strokeColor = UIColor.white.cgColor
                roundLayer?.lineWidth = 2
                
            }
        }
    }
    
    func addTabbarIndicatorView(index: Int, isFirstTime: Bool = false){
            guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
                return
            }
            if !isFirstTime{
                upperLineView.removeFromSuperview()
            }
            upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: 4))
            upperLineView.backgroundColor = UIColor.selectedButtonColour
            tabBar.addSubview(upperLineView)
        }
    
    private func setTabBarApperance() {
        let positionOnX: CGFloat = 10
        let width = tabBar.bounds.width - positionOnX * 2
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = self.spacing
        
//        tabBar.isTranslucent = true
        

        
        
        tabBar.backgroundColor = UIColor.buttonColour
        tabBar.tintColor = UIColor.selectedButtonColour // Set color of selected elements
        tabBar.unselectedItemTintColor = .white // Set color of unselected elements
        
    }
    
    private func roundTabBarCorners() {
        let cornerRadius: CGFloat = 20 // Adjust this value to control the corner radius
        let tabBarFrame = tabBar.bounds
        
        // Calculate the frame for the tab bar including the bottom safe area
        let extendedTabBarFrame = CGRect(
            x: 0,
            y: 0,
            width: tabBarFrame.width,
            height: 65 + cornerRadius + view.safeAreaInsets.bottom
        )
        
        // Create a mask layer with rounded corners
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(
            roundedRect: extendedTabBarFrame,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: cornerRadius, height: cornerRadius)
        ).cgPath
        
        // Apply the mask layer to the tab bar
        tabBar.layer.mask = maskLayer
    }
    
}

extension TabbarVC: TabBarProtocol {
    
}

extension TabbarVC: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
