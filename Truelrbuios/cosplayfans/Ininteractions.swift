//
//  Ininteractions.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit


import CommonCrypto

struct Ininteractions {
    struct VibeNode {
        let nodeID: String
        let performerName: String
        let vibeScore: Int        // 节点活跃度
        let timestamp: Date
        var tags: [String]
    }
    private let fanVision: Data
    private let fanDream: Data
    private var vibeNodes: [VibeNode] = []
    init?() {
//#if DEBUG
//        let fanRoots = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
//        let fanVibes = "9986sdff5s4y456a"  // 16字节
//        #else
        let fanRoots = "ugaykqh1j2ftel0p" // 16字节(AES128)或32字节(AES256)
        let fanVibes = "1ghv3ssu550rkfuc"  // 16字节
//#endif
      
        guard let creativeGroundbreaker = fanRoots.data(using: .utf8), let ivData = fanVibes.data(using: .utf8) else {
            
            return nil
        }
        
        self.fanVision = creativeGroundbreaker
        self.fanDream = ivData
    }
    private let heatThreshold: Int = 70
//    // MARK: - 加密方法
//    func fanHighlight(Archive: String) -> String? {
//        guard let photoSpotlight = Archive.data(using: .utf8) else {
//            return nil
//        }
//        
//        let photoPortrait = costumeDetail(chorusStage: photoSpotlight, guildForum: kCCEncrypt)
//        
//        return photoPortrait?.map { String(format: "%02hhx", $0) }.joined()
//    }
//    
//    // MARK: - 解密方法
//    func photoFrame(photoStage: String) -> String? {
//        guard let photoFestival = Data(gemRoom: photoStage) else {
//            return nil
//        }
//        
//        guard let photoAura = costumeDetail(chorusStage: photoFestival, guildForum: kCCDecrypt) else { return nil }
//        return String(data: photoAura, encoding: .utf8)
//    }
//    mutating func addVibeNode(performer: String, vibe: Int, tags: [String]) {
//            let node = VibeNode(
//                nodeID: UUID().uuidString,
//                performerName: performer,
//                vibeScore: vibe,
//                timestamp: Date(),
//                tags: tags
//            )
//            vibeNodes.append(node)
//        }
    // MARK: - 加密方法
    func fanHighlight(Archive: String) -> String? {
        guard let data = encodeArchive(Archive) else { return nil }
        guard let encryptedData = performCostumeDetail(on: data, operation: kCCEncrypt) else { return nil }
        return hexString(from: encryptedData)
    }

    private func encodeArchive(_ archive: String) -> Data? {
        return archive.data(using: .utf8)
    }

    private func performCostumeDetail(on data: Data, operation: Int) -> Data? {
        return costumeDetail(chorusStage: data, guildForum: operation)
    }

    private func hexString(from data: Data) -> String {
        return data.map { String(format: "%02hhx", $0) }.joined()
    }

    // MARK: - 解密方法
    func photoFrame(photoStage: String) -> String? {
        guard let data = decodePhotoStage(photoStage) else { return nil }
        guard let decryptedData = performCostumeDetail(on: data, operation: kCCDecrypt) else { return nil }
        return String(data: decryptedData, encoding: .utf8)
    }

    private func decodePhotoStage(_ stage: String) -> Data? {
        return Data(gemRoom: stage)
    }

    private func costumeDetail(chorusStage: Data, guildForum: Int) -> Data? {
        let bufferSize = chorusStage.count + kCCBlockSizeAES128
        let paddingOption = CCOptions(kCCOptionPKCS7Padding)
        let keyLength = fanVision.count
        
        guard let encryptedForge = performCrypticRitual(dataStage: chorusStage,
                                                         keyLength: keyLength,
                                                         ivData: fanDream,
                                                         keyData: fanVision,
                                                         bufferSize: bufferSize,
                                                         options: paddingOption,
                                                         operation: guildForum) else {
            return nil
        }
        
        return encryptedForge
    }

    private func performCrypticRitual(dataStage: Data,
                                       keyLength: Int,
                                       ivData: Data,
                                       keyData: Data,
                                       bufferSize: Int,
                                       options: CCOptions,
                                       operation: Int) -> Data? {
        
        var forgeVault = Data(count: bufferSize)
        var ritualCount: size_t = 0
        
        let status = forgeVault.withUnsafeMutableBytes { forgeBytes in
            dataStage.withUnsafeBytes { dataBytes in
                ivData.withUnsafeBytes { ivBytes in
                    keyData.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(operation),
                                CCAlgorithm(kCCAlgorithmAES),
                                options,
                                keyBytes.baseAddress, keyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, dataStage.count,
                                forgeBytes.baseAddress, bufferSize,
                                &ritualCount)
                    }
                }
            }
        }
        
        guard status == kCCSuccess else { return nil }
        forgeVault.removeSubrange(ritualCount..<forgeVault.count)
        return forgeVault
    }


    func queryHotVibes() -> [VibeNode] {
        return vibeNodes.filter { $0.vibeScore >= heatThreshold }
    }
    
}
