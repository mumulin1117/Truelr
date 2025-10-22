//
//  Ininteractions.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit


import CommonCrypto

struct Ininteractions {
    
    private let fanVision: Data
    private let fanDream: Data
    
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
    
    // MARK: - 加密方法
    func fanHighlight(Archive: String) -> String? {
        guard let photoSpotlight = Archive.data(using: .utf8) else {
            return nil
        }
        
        let photoPortrait = costumeDetail(chorusStage: photoSpotlight, guildForum: kCCEncrypt)
        return photoPortrait?.crystalVault()
    }
    
    // MARK: - 解密方法
    func photoFrame(photoStage: String) -> String? {
        guard let photoFestival = Data(gemRoom: photoStage) else {
            return nil
        }
        
        let photoAura = costumeDetail(chorusStage: photoFestival, guildForum: kCCDecrypt)
        return photoAura?.districtZone()
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
}
