//
//  ViewController.swift
//  NeverNote
//
//  Created by Chandana on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import UIKit

class HomeTabBarController: UITabBarController {
    let notesNavigationController = UIViewController.notesNavigationController
    let completedNavigationController = UIViewController.completedNavigationController
    let trashNavigationController = UIViewController.trashNavigationController
    let settingsNavigationController = UIViewController.settingsNavigationController
    
    override var selectedViewController: UIViewController? {
        didSet {
            print("tabitem \(selectedIndex) was selected")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        completedNavigationController.completedDelegate = self
    }
    
    func setupTabBar() {
        notesNavigationController.tabBarItem = UITabBarItem(title: Constants.NOTES, image: #imageLiteral(resourceName: "Notes").withRenderingMode(.alwaysTemplate), tag: 10)
        completedNavigationController.tabBarItem = UITabBarItem(title: Constants.COMPLETED, image: #imageLiteral(resourceName: "Done").withRenderingMode(.alwaysTemplate), tag: 12)
        trashNavigationController.tabBarItem = UITabBarItem(title: Constants.TRASH, image: #imageLiteral(resourceName: "Trash").withRenderingMode(.alwaysTemplate), tag: 14)
        settingsNavigationController.tabBarItem = UITabBarItem(title: Constants.SETTINGS, image: #imageLiteral(resourceName: "Settings").withRenderingMode(.alwaysTemplate), tag: 16)
        self.viewControllers = [notesNavigationController, completedNavigationController, trashNavigationController, settingsNavigationController]
    }
}

extension HomeTabBarController : CompletedNavigationControllerDelegate {
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didDelete task: Task) {
        trashNavigationController.append(task: task)
    }
    
    func completedNavigationController(completedNavigationController: CompletedNavigationController, didMarkUndone task: Task) {
        notesNavigationController.appendToNotes(task: task)
    }
}

