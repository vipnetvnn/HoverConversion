//
//  HCViewContentable.swift
//  HoverConversion
//
//  Created by Taiki Suzuki on 2016/07/18.
//  Copyright © 2016年 marty-suzuki. All rights reserved.
//

import UIKit
import MisterFusion

public protocol HCViewControllable: HCNavigationViewDelegate {
    var navigationView: HCNavigationView! { get set }
    var navigatoinContainerView: UIView! { get set }
    var tableView: UITableView! { get set }
    func addViews()
}

extension HCViewControllable where Self: UIViewController {
    public func addViews() {
        navigationView.delegate = self
        view.addLayoutSubview(navigatoinContainerView, andConstraints:
            navigatoinContainerView.Top,
            navigatoinContainerView.Right,
            navigatoinContainerView.Left,
            navigatoinContainerView.Height |==| HCNavigationView.Height
        )
        
        navigatoinContainerView.addLayoutSubview(navigationView, andConstraints:
            navigationView.Top,
            navigationView.Right,
            navigationView.Left,
            navigationView.Bottom
        )
        
        view.addLayoutSubview(tableView, andConstraints:
            tableView.Top |==| navigatoinContainerView.Bottom,
            tableView.Right,
            tableView.Left,
            tableView.Bottom
        )
        view.bringSubviewToFront(navigatoinContainerView)
    }
    
    public func navigationView(navigationView: HCNavigationView, didTapLeftButton button: UIButton) {}
    public func navigationView(navigationView: HCNavigationView, didTapRightButton button: UIButton) {}
}

public protocol HCViewContentable: HCViewControllable {
    weak var scrollDelegate: HCContentViewControllerScrollDelegate? { get set }
}
