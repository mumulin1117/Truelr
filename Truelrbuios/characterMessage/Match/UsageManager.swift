//
//  UsageManager.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/25.
//

import UIKit

class CoinUsageManager {
    private let matchCost = 20
    private let maxFreeMatches = 3
    private let usedMatchesKey = "usedMatchesCount"
    var onStartMatching: (() -> Void)?
       
    var onNavigateToCoinStore: (() -> Void)?
    var remainingFreeMatches: Int {
        let used = UserDefaults.standard.integer(forKey: usedMatchesKey)
        return max(0, maxFreeMatches - used)
    }
    

    func canAffordMatch() -> Bool {
        if remainingFreeMatches > 0 {
            return true // Free matches available
        }
        return ViewController.CurrentCoinggUserOwne >= matchCost
    }
    
    func deductMatchCost() {
        if remainingFreeMatches > 0 {
            // Use free match first
            let used = UserDefaults.standard.integer(forKey: usedMatchesKey) + 1
            UserDefaults.standard.set(used, forKey: usedMatchesKey)
        } else {
            // Deduct coins
            let newBalance = ViewController.CurrentCoinggUserOwne - matchCost
            ViewController.CurrentCoinggUserOwne = newBalance
          
        }
    }
    
    func showMatchConfirmation(in viewController: UIViewController) {
        if remainingFreeMatches > 0 {
            showFreeMatchAlert(in: viewController)
        } else if ViewController.CurrentCoinggUserOwne >= matchCost {
            showPaidMatchAlert(in: viewController)
        } else {
            showInsufficientBalanceAlert(in: viewController)
        }
    }
    
    private func showFreeMatchAlert(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: "Free Match Available",
            message: "You have \(remainingFreeMatches) free matches remaining. Each match costs 20 coins after free matches are used.",
            preferredStyle: .alert
        )
        
        let matchAction = UIAlertAction(title: "Start Matching", style: .default) { _ in
            self.deductMatchCost()
            self.startMatching()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(matchAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func showPaidMatchAlert(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: "Confirm Match",
            message: "This match will cost 20 coins. Your current balance: \(ViewController.CurrentCoinggUserOwne) coins.",
            preferredStyle: .alert
        )
        
        let matchAction = UIAlertAction(title: "Confirm (20 coins)", style: .default) { _ in
            self.deductMatchCost()
            self.startMatching()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(matchAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func showInsufficientBalanceAlert(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: "Insufficient Balance",
            message: "You need 20 coins to start a match. Your current balance: \(ViewController.CurrentCoinggUserOwne) coins.",
            preferredStyle: .alert
        )
        
        let purchaseAction = UIAlertAction(title: "Purchase Coins", style: .default) { _ in
            self.navigateToCoinStore()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(purchaseAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func startMatching() {
        // Start your matching logic here
        print("Starting match process...")
        onStartMatching?()
    }
    
    private func navigateToCoinStore() {
        // Navigate to coin purchase screen
        print("Navigating to coin store...")
        onNavigateToCoinStore?()
    }
    
//    // Method to add coins (for testing or purchases)
//    func addCoins(_ amount: Int) {
//        let newBalance = ViewController.CurrentCoinggUserOwne + amount
//        UserDefaults.standard.set(newBalance, forKey: coinBalanceKey)
//    }
}
