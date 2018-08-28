//
//  UIViewController.swift
//  NeverNote
//
//  Created by Aditya on 8/24/18.
//  Copyright © 2018 Chandana. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    private static let HOME_VIEW_CONTROLLER = "HomeViewController"
    static var home : HomeTabBarController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.home, identifier: HOME_VIEW_CONTROLLER, to: HomeTabBarController.self)
        }
    }
    
    static let ADD_SCREEN_VIEW_CONTROLLER = "AddScreenViewController"
    static var addScreen : AddScreenViewController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.addScreen, identifier: ADD_SCREEN_VIEW_CONTROLLER, to: AddScreenViewController.self)
        }
    }
    
    static let NOTES_VIEW_CONTROLLER = "NotesViewController"
    static var notes : NotesViewController {
        get {
            let notesStoryboard = UIStoryboard.notes
            guard let notesViewController = notesStoryboard.instantiateViewController(withIdentifier: NotesViewController.NOTES_VIEW_CONTROLLER) as? NotesViewController else {
                fatalError("There is no identifier set as \(NotesViewController.NOTES_VIEW_CONTROLLER)")
            }
            return notesViewController
        }
    }
    
    static let COMPLETED_TASKS_VIEW_CONTROLLER = "CompletedTasksViewController"
    static var completed : CompletedTasksViewController {
        get {
            let completedTasksStoryboard = UIStoryboard.completed
            guard let completedTasksViewController = completedTasksStoryboard.instantiateViewController(withIdentifier: CompletedTasksViewController.COMPLETED_TASKS_VIEW_CONTROLLER) as? CompletedTasksViewController else {
                fatalError("There is no identifier set as \(CompletedTasksViewController.COMPLETED_TASKS_VIEW_CONTROLLER)")
            }
            return completedTasksViewController
        }
    }
    
    static let TRASH_VIEW_CONTROLLER = "TrashViewController"
    static var trash: TrashViewController {
        get {
            let trashStoryboard = UIStoryboard.trash
            guard let trashViewController = trashStoryboard.instantiateViewController(withIdentifier: TrashViewController.TRASH_VIEW_CONTROLLER) as? TrashViewController else {
                fatalError("There is no identifier set as \(TrashViewController.TRASH_VIEW_CONTROLLER)")
            }
            return trashViewController
        }
    }
    
    
    
    static let SETTINGS_VIEW_CONTROLLER = "SettingsViewController"
    static var settings: SettingsViewController {
        get {
            let settingsStoryboard = UIStoryboard.settings
            guard let settingsViewController = settingsStoryboard.instantiateViewController(withIdentifier: SettingsViewController.SETTINGS_VIEW_CONTROLLER) as? SettingsViewController else {
                fatalError("There is no identifier set as \(SettingsViewController.SETTINGS_VIEW_CONTROLLER)")
            }
            return settingsViewController
        }
    }
    
    static let NOTES_NAVIGATION_CONTROLLER = "NotesNavigationController"
    static var notesNavigationController: NotesNavigationController {
        get {
            return UIViewController.instantiateFromStoryboard(storyboard: UIStoryboard.notesNavigationController, identifier: NOTES_NAVIGATION_CONTROLLER, to: NotesNavigationController.self)
        }
    }
    
    private static func instantiateFromStoryboard<T:UIViewController>(storyboard : UIStoryboard, identifier : String, to type : T.Type) -> T {
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("There is no identifier set as \(identifier)")
        }
        return viewController
    }
}
