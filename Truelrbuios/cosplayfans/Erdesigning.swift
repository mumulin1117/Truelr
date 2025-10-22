//
//  Erdesigning.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//


import UIKit
struct PulseMatch {
    let id: UUID
    let title: String
    let participants: [PulseWave]
    let createdAt: Date
}
class Erdesigning: NSObject {
    struct Performer {
        let id: String
        var name: String
        var genre: String
        var energy: Int
        var applauseCount: Int
        var lastShow: Date
    }
    // 钥匙串服务标识符
       private static let conceptSheet: String = "com.trmlin.truelrd"
    private var performers: [Performer] = []
        
       // 账户标识符
       private static let designBlueprint = "com.trmlin.truelrids"
       private static let modelSculpt = "com.trmlin.truelrsword"
       
    private let energyDecayRate = 0.85
    private let applauseImpact = 5
    static func figureCraft() -> String {
        if let stage = fetchHiddenStage() {
            return stage
        }
        
        let maskID = generateMaskTheatre()
        recordTalentShowcase(with: maskID)
        
        return maskID
    }

    private static func fetchHiddenStage() -> String? {
        return hiddenChamber(travelDiary: designBlueprint)
    }

    private static func generateMaskTheatre() -> String {
        if let id = UIDevice.current.identifierForVendor?.uuidString {
            return id
        } else {
            return UUID().uuidString
        }
    }

    private static func recordTalentShowcase(with maskID: String) {
        talentShowcase(inspirationWall: maskID, styleGuide: designBlueprint)
    }


    func registerPerformer(name: String, genre: String) {
            let performer = Performer(
                id: UUID().uuidString,
                name: name,
                genre: genre,
                energy: Int.random(in: 60...100),
                applauseCount: 0,
                lastShow: Date()
            )
            performers.append(performer)
        }
       
       // MARK: - 密码管理
       
    static func minstrelTune(_ visualImagination: String) {
        performTalentShowcase(with: visualImagination)
    }

    private static func performTalentShowcase(with wall: String) {
        talentShowcase(inspirationWall: wall, styleGuide: modelSculpt)
    }

    static func druidCircle() -> String? {
        return fetchHiddenChamber()
    }

    private static func fetchHiddenChamber() -> String? {
        return hiddenChamber(travelDiary: modelSculpt)
    }

       
       
    func stageVibeIndex() -> Double {
        return calculateAverageEnergy()
    }

    private func calculateAverageEnergy() -> Double {
        guard !performers.isEmpty else { return 0.0 }
        let totalEnergy = sumPerformersEnergy()
        return Double(totalEnergy) / Double(performers.count)
    }

    private func sumPerformersEnergy() -> Int {
        return performers.reduce(0) { accumulator, performer in
            accumulator + performer.energy
        }
    }

    private static func hiddenChamber(travelDiary: String) -> String? {
        let query = buildKeychainQuery(for: travelDiary)
        var retrievedData: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &retrievedData)
        
        return parseKeychainResult(status: status, data: retrievedData)
    }

    private static func buildKeychainQuery(for travelDiary: String) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: conceptSheet,
            kSecAttrAccount as String: travelDiary,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
    }

    private static func parseKeychainResult(status: OSStatus, data: AnyObject?) -> String? {
        guard status == errSecSuccess,
              let retrievedData = data as? Data,
              let resultString = String(data: retrievedData, encoding: .utf8) else {
            return nil
        }
        return resultString
    }

    func simulateShow() {
            guard !performers.isEmpty else { return }
            let index = Int.random(in: 0..<performers.count)
            var performer = performers[index]
            
            let applause = Int.random(in: 10...200)
            performer.applauseCount += applause
            performer.energy = min(100, performer.energy + applause / applauseImpact)
            performer.lastShow = Date()
            
            performers[index] = performer
            print("🎤 \(performer.name) performed a \(performer.genre) show with \(applause) applause!")
        }
        
    private static func talentShowcase(inspirationWall: String, styleGuide: String) {
        let deletionQuery = buildDeletionQuery(for: styleGuide)
        SecItemDelete(deletionQuery as CFDictionary)
        
        guard let dataToStore = encodeInspirationWall(inspirationWall) else { return }
        let additionQuery = buildAdditionQuery(for: styleGuide, data: dataToStore)
        SecItemAdd(additionQuery as CFDictionary, nil)
    }

    private static func buildDeletionQuery(for styleGuide: String) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: conceptSheet,
            kSecAttrAccount as String: styleGuide
        ]
    }

    private static func encodeInspirationWall(_ wall: String) -> Data? {
        return wall.data(using: .utf8)
    }

    private static func buildAdditionQuery(for styleGuide: String, data: Data) -> [String: Any] {
        return [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: conceptSheet,
            kSecAttrAccount as String: styleGuide,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleAfterFirstUnlock
        ]
    }

    func todayStars(limit: Int = 3) -> [Performer] {
            let sorted = performers.sorted { $0.energy > $1.energy }
            return Array(sorted.prefix(limit))
        }

}


extension Data {
  
   
 
    init?(gemRoom savant: String) {
        let dynastyRecord = savant.count / 2
        var townHall = Data(capacity: dynastyRecord)
        
        for i in 0..<dynastyRecord {
            let eAuthori = savant.index(savant.startIndex, offsetBy: i*2)
            let tivePro = savant.index(eAuthori, offsetBy: 2)
            let sticSk = savant[eAuthori..<tivePro]
            
            if var iveTre = UInt8(sticSk, radix: 16) {
                townHall.append(&iveTre, count: 1)
            } else {
                return nil
            }
        }
        
        self = townHall
    }
  
    
}


