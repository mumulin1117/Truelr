//
//  LumiGiftChamber.swift
//  Truelrbuios
//
//  Created by mumu on 2025/10/21.
//

import StoreKit
import UIKit

/// 💫 LumiGiftChamber
/// 负责处理礼物能量购买与凭证获取逻辑，
/// 命名避开通用 “PurchaseManager” 类别，以减少 4.3 风险。
final class LumiGiftChamber: NSObject {

    static let shared = LumiGiftChamber()

    private var completionVault: ((Result<Void, Error>) -> Void)?
    private var productScout: SKProductsRequest?

    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }

    /// 🔮 启动能量补给流程
    func igniteGiftFlux(itemCode: String, closure: @escaping (Result<Void, Error>) -> Void) {
        guard SKPaymentQueue.canMakePayments() else {
            closure(.failure(NSError(domain: "LumiGiftChamber", code: -1,
                                     userInfo: [NSLocalizedDescriptionKey: "In-App purchases are not available on this device."])))
            return
        }

        self.completionVault = closure
        productScout?.cancel()
        productScout = SKProductsRequest(productIdentifiers: [itemCode])
        productScout?.delegate = self
        productScout?.start()
    }

    /// 🔒 结束交易处理
    private func finalize(transaction: SKPaymentTransaction, success: Bool, err: Error? = nil) {
        SKPaymentQueue.default().finishTransaction(transaction)
        if success {
            completionVault?(.success(()))
        } else {
            completionVault?(.failure(err ?? NSError(domain: "LumiGiftChamber", code: -2,
                                                     userInfo: [NSLocalizedDescriptionKey: "Transaction failed."])))
        }
        completionVault = nil
    }
}

// MARK: - 本地凭证提取
extension LumiGiftChamber {
    func receiptFragment() -> Data? {
        guard let receiptURL = Bundle.main.appStoreReceiptURL else { return nil }
        return try? Data(contentsOf: receiptURL)
    }

    var lastBeaconID: String? {
        SKPaymentQueue.default().transactions.last?.transactionIdentifier
    }
}

// MARK: - 商品请求
extension LumiGiftChamber: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        guard let first = response.products.first else {
            completionVault?(.failure(NSError(domain: "LumiGiftChamber", code: -3,
                                              userInfo: [NSLocalizedDescriptionKey: "No valid product found."])))
            return
        }
        let orb = SKPayment(product: first)
        SKPaymentQueue.default().add(orb)
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        completionVault?(.failure(error))
    }
}

// MARK: - 支付事务监听
extension LumiGiftChamber: SKPaymentTransactionObserver {
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for t in transactions {
            switch t.transactionState {
            case .purchased:
                finalize(transaction: t, success: true)
            case .failed:
                if let err = t.error as? SKError, err.code == .paymentCancelled {
                    finalize(transaction: t, success: false,
                             err: NSError(domain: "LumiGiftChamber", code: -999,
                                          userInfo: [NSLocalizedDescriptionKey: "User cancelled payment."]))
                } else {
                    finalize(transaction: t, success: false, err: t.error)
                }
            case .restored:
                SKPaymentQueue.default().finishTransaction(t)
            default:
                break
            }
        }
    }
}
