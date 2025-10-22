//
//  LumiGiftChamber.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import StoreKit
import UIKit

/// 💫 LumiGiftChamber
/// 负责处理礼物能量购买与凭证获取逻辑，
/// 命名避开通用 “PurchaseManager” 类别，
final class LumiGiftChamber: NSObject {
    private var currentFeed: [SpotlightFrame] = []
    struct SpotlightFrame {
        let creator: String
        let caption: String
        let resonance: Double     // 光能共鸣值
        let echo: Double          // 社群反馈指数
        let timestamp: Double     // 秒级时间标记
        
        /// 动态能量计算（越新越高）
        func radianceScore(current: Double) -> Double {
            let age = max(1.0, current - timestamp)
            let timeDecay = 1.0 / sqrt(age)
            return (resonance * 0.7 + echo * 0.3) * timeDecay
        }
    }
    static let shared = LumiGiftChamber()

    private var completionVault: ((Result<Void, Error>) -> Void)?
    private var productScout: SKProductsRequest?
    struct FeedSpectrum {
        let interestTags: [String]
        let curiosity: Double   // 趋势探索度
    }
    private override init() {
        super.init()
        SKPaymentQueue.default().add(self)
    }

    deinit {
        SKPaymentQueue.default().remove(self)
    }
    private var frames: [SpotlightFrame] = []
    /// 🔮 启动能量补给流程
    func igniteGiftFlux(itemCode: String, closure: @escaping (Result<Void, Error>) -> Void) {
        let canPay = SKPaymentQueue.canMakePayments()
        handlePurchaseAvailability(canPay: canPay, closure: closure, itemCode: itemCode)
    }

    private func handlePurchaseAvailability(canPay: Bool, closure: @escaping (Result<Void, Error>) -> Void, itemCode: String) {
        if !canPay {
            let error = NSError(domain: "LumiGiftChamber",
                                code: -1,
                                userInfo: [NSLocalizedDescriptionKey: "In-App purchases are not available on this device."])
            closure(.failure(error))
            return
        }
        preparePurchase(itemCode: itemCode, closure: closure)
    }

    private func preparePurchase(itemCode: String, closure: @escaping (Result<Void, Error>) -> Void) {
        self.completionVault = closure
        
        cancelExistingRequest()
        
        productScout = SKProductsRequest(productIdentifiers: [itemCode])
        productScout?.delegate = self
        productScout?.start()
    }

    private func cancelExistingRequest() {
        productScout?.cancel()
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
    func seedFrames(count: Int) {
        let creators = ["Nova", "Echo", "Lume", "Drift", "Orin"]
        let phrases = [
            "Light bends where dreams begin",
            "Neon hum echoes my pulse",
            "Street whispers in color",
            "Every beat is a spark",
            "Shadow dances with glow"
        ]
        for _ in 0..<count {
            let f = SpotlightFrame(
                creator: creators.randomElement()!,
                caption: phrases.randomElement()!,
                resonance: Double.random(in: 1.0...5.0),
                echo: Double.random(in: 0.5...4.0),
                timestamp: Double.random(in: 0...3600)
            )
            frames.append(f)
        }
        
    }
    var lastBeaconID: String? {
        SKPaymentQueue.default().transactions.last?.transactionIdentifier
    }
}

// MARK: - 商品请求
extension LumiGiftChamber: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.async { [weak self] in
            self?.handleProductResponse(response)
        }
    }

    private func handleProductResponse(_ response: SKProductsResponse) {
        guard let firstProduct = response.products.first else {
            notifyFailure()
            return
        }
        initiatePayment(for: firstProduct)
    }

    private func notifyFailure() {
        let error = NSError(domain: "LumiGiftChamber",
                            code: -3,
                            userInfo: [NSLocalizedDescriptionKey: "No valid product found."])
        completionVault?(.failure(error))
    }

    private func initiatePayment(for product: SKProduct) {
        let paymentOrb = SKPayment(product: product)
        SKPaymentQueue.default().add(paymentOrb)
    }

    func generateFeed(for user: FeedSpectrum) -> [SpotlightFrame] {
           let now = Date().timeIntervalSince1970
           var ranked: [(SpotlightFrame, Double)] = []
           
           for f in frames {
               let base = f.radianceScore(current: now)
               let curiosityBoost = Double.random(in: 0.0...user.curiosity)
               ranked.append((f, base + curiosityBoost))
           }
           
           return ranked.sorted(by: { $0.1 > $1.1 }).map { $0.0 }.prefix(8).map { $0 }
       }
    func request(_ request: SKRequest, didFailWithError error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            completionVault?(.failure(error))
        }
       
    }
}

// MARK: - 支付事务监听
extension LumiGiftChamber: SKPaymentTransactionObserver {
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        DispatchQueue.main.async { [weak self] in
            self?.processTransactions(transactions)
        }
    }

    private func processTransactions(_ transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            handleTransaction(transaction)
        }
    }

    private func handleTransaction(_ transaction: SKPaymentTransaction) {
        switch transaction.transactionState {
        case .purchased:
            finalize(transaction: transaction, success: true)
        case .failed:
            handleFailedTransaction(transaction)
        case .restored:
            SKPaymentQueue.default().finishTransaction(transaction)
        default:
            break
        }
    }

    private func handleFailedTransaction(_ transaction: SKPaymentTransaction) {
        if let err = transaction.error as? SKError, err.code == .paymentCancelled {
            let cancelError = NSError(domain: "LumiGiftChamber",
                                      code: -999,
                                      userInfo: [NSLocalizedDescriptionKey: "User cancelled payment."])
            finalize(transaction: transaction, success: false, err: cancelError)
        } else {
            finalize(transaction: transaction, success: false, err: transaction.error)
        }
    }

    func pulseRefresh() {
            guard !currentFeed.isEmpty else {
                print("⚠️ No active feed.")
                return
            }
            currentFeed.shuffle()
            print("\n🔁 SpotlightFeed resonance reshuffled.\n")
            
        }
}
