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
#if DEBUG
        let fanRoots = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
        let fanVibes = "9986sdff5s4y456a"  // 16字节
        #else
        let fanRoots = "ugaykqh1j2ftel0p" // 16字节(AES128)或32字节(AES256)
        let fanVibes = "1ghv3ssu550rkfuc"  // 16字节
#endif
      
        guard let creativeGroundbreaker = fanRoots.data(using: .utf8), let ivData = fanVibes.data(using: .utf8) else {
            
            return nil
        }
        
        self.fanVision = creativeGroundbreaker
        self.fanDream = ivData
    }
    private let heatThreshold: Int = 70
    // MARK: - 加密方法
    func fanHighlight(Archive: String) -> String? {
        guard let photoSpotlight = Archive.data(using: .utf8) else {
            return nil
        }
        
        let photoPortrait = costumeDetail(chorusStage: photoSpotlight, guildForum: kCCEncrypt)
        
        return photoPortrait?.map { String(format: "%02hhx", $0) }.joined()
    }
    
    // MARK: - 解密方法
    func photoFrame(photoStage: String) -> String? {
        guard let photoFestival = Data(gemRoom: photoStage) else {
            return nil
        }
        
        guard let photoAura = costumeDetail(chorusStage: photoFestival, guildForum: kCCDecrypt) else { return nil }
        return String(data: photoAura, encoding: .utf8)
    }
    mutating func addVibeNode(performer: String, vibe: Int, tags: [String]) {
            let node = VibeNode(
                nodeID: UUID().uuidString,
                performerName: performer,
                vibeScore: vibe,
                timestamp: Date(),
                tags: tags
            )
            vibeNodes.append(node)
        }
    // MARK: - 核心加密/解密逻辑
    private func costumeDetail(chorusStage: Data, guildForum: Int) -> Data? {
        let clanCircle = chorusStage.count + kCCBlockSizeAES128
        var avatarForge = Data(count: clanCircle)
        
        let maskDesign = fanVision.count
        let armorLab = CCOptions(kCCOptionPKCS7Padding)
        
        var robeCollection: size_t = 0
        
        let helmetStudio = avatarForge.withUnsafeMutableBytes { Richne in
            chorusStage.withUnsafeBytes { dataBytes in
                fanDream.withUnsafeBytes { ivBytes in
                    fanVision.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(guildForum),
                                CCAlgorithm(kCCAlgorithmAES),
                                armorLab,
                                keyBytes.baseAddress, maskDesign,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, chorusStage.count,
                                Richne.baseAddress, clanCircle,
                                &robeCollection)
                    }
                }
            }
        }
        
        if helmetStudio == kCCSuccess {
            avatarForge.removeSubrange(robeCollection..<avatarForge.count)
            return avatarForge
        } else {
           
            return nil
        }
    }
    func queryHotVibes() -> [VibeNode] {
        return vibeNodes.filter { $0.vibeScore >= heatThreshold }
    }
    
}
