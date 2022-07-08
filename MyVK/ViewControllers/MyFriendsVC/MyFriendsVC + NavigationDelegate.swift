//
//  MyFriendsVC + NavigationDelegate.swift
//  MyVK
//
//  Created by Максим Марков on 27.06.2022.
//
import UIKit

extension MyFriendsVC:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        if operation == .push {
       return AnimatorNavigation()
        } else {
           return AnimatorNavigationBack()
        }
        
    }
    
}
