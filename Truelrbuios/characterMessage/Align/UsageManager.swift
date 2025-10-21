//
//  UsageManager.swift
//  Truelrbuios
//
//  Created by  on 2025/9/25.
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
        return Somiccon.CurrentCoinggUserOwne >= matchCost
    }
    
    func deductMatchCost() {
        if remainingFreeMatches > 0 {
            // Use free match first
            let used = UserDefaults.standard.integer(forKey: usedMatchesKey) + 1
            UserDefaults.standard.set(used, forKey: usedMatchesKey)
        } else {
            // Deduct coins
            let newBalance = Somiccon.CurrentCoinggUserOwne - matchCost
            Somiccon.CurrentCoinggUserOwne = newBalance
          
        }
    }
    
    func showMatchConfirmation(in viewController: UIViewController) {
        if remainingFreeMatches > 0 {
            showFreeMatchAlert(in: viewController)
        } else if Somiccon.CurrentCoinggUserOwne >= matchCost {
            showPaidMatchAlert(in: viewController)
        } else {
            showInsufficientBalanceAlert(in: viewController)
        }
    }
    
    private func showFreeMatchAlert(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: UIImageView.ambienceVaultDeu("RnJlZSBNYXRjaCBBdmFpbGFibGVjb20udHJtbGluLnRydWVscg=="),
            message: "You have \(remainingFreeMatches) free matches remaining. Each match costs 20 coins after free matches are used.",
            preferredStyle: .alert
        )
        
        let matchAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("U3RhcnQgTWF0Y2hpbmdjb20udHJtbGluLnRydWVscg=="), style: .default) { _ in
            self.deductMatchCost()
            self.startMatching()
        }
        
        let cancelAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("Q2FuY2VsY29tLnRybWxpbi50cnVlbHI="), style: .cancel, handler: nil)
        
        alert.addAction(matchAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func showPaidMatchAlert(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: UIImageView.ambienceVaultDeu("Q29uZmlybSBNYXRjaGNvbS50cm1saW4udHJ1ZWxy"),
            message: "This match will cost 20 coins. Your current balance: \(Somiccon.CurrentCoinggUserOwne) coins.",
            preferredStyle: .alert
        )
        
        let matchAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("Q29uZmlybSAoMjAgY29pbnMpY29tLnRybWxpbi50cnVlbHI="), style: .default) { _ in
            self.deductMatchCost()
            self.startMatching()
        }
        
        let cancelAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("Q2FuY2VsY29tLnRybWxpbi50cnVlbHI="), style: .cancel, handler: nil)
        
        alert.addAction(matchAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func showInsufficientBalanceAlert(in viewController: UIViewController) {
        let alert = UIAlertController(
            title: UIImageView.ambienceVaultDeu("SW5zdWZmaWNpZW50IEJhbGFuY2Vjb20udHJtbGluLnRydWVscg=="),
            message: "You need 20 coins to start a match. Your current balance: \(Somiccon.CurrentCoinggUserOwne) coins.",
            preferredStyle: .alert
        )
        
        let purchaseAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("UHVyY2hhc2UgQ29pbnNjb20udHJtbGluLnRydWVscg=="), style: .default) { _ in
            self.navigateToCoinStore()
        }
        
        let cancelAction = UIAlertAction(title: UIImageView.ambienceVaultDeu("Q2FuY2VsY29tLnRybWxpbi50cnVlbHI="), style: .cancel, handler: nil)
        
        alert.addAction(purchaseAction)
        alert.addAction(cancelAction)
        
        viewController.present(alert, animated: true, completion: nil)
    }
    
    private func startMatching() {
    
        onStartMatching?()
    }
    
    private func navigateToCoinStore() {
   
        onNavigateToCoinStore?()
    }
    

}
