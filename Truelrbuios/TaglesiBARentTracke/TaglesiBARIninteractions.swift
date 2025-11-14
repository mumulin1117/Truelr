//
//  TaglesiBARIninteractions.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit


import CommonCrypto

struct TaglesiBARIninteractions {
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
        vibeNodes = []
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

    func TaglesiBARfanHighlight(ATaglesiBARrchive: String) -> String? {
        guard let data = TaglesiBARencodeArchive(ATaglesiBARrchive) else { return nil }
        guard let encryptedData = TaglesiBARperformCostumeDetail(on: data, TaglesiBARoperation: kCCEncrypt) else { return nil }
        return TaglesiBARhexString(from: encryptedData)
    }

    private func TaglesiBARencodeArchive(_ archive: String) -> Data? {
        return archive.data(using: .utf8)
    }

    private func TaglesiBARperformCostumeDetail(on data: Data, TaglesiBARoperation: Int) -> Data? {
        return TaglesiBARcostumeDetail(TaglesiBARchorusStage: data, TaglesiBARguildForum: TaglesiBARoperation)
    }

    private func TaglesiBARhexString(from data: Data) -> String {
        return data.map { String(format: "%02hhx", $0) }.joined()
    }

   
    func TaglesiBARphotoFrame(TaglesiBARphotoStage: String) -> String? {
        guard let data = TaglesiBARdecodePhotoStage(TaglesiBARphotoStage) else { return nil }
        guard let decryptedData = TaglesiBARperformCostumeDetail(on: data, TaglesiBARoperation: kCCDecrypt) else { return nil }
        return String(data: decryptedData, encoding: .utf8)
    }

    private func TaglesiBARdecodePhotoStage(_ stage: String) -> Data? {
        return Data(gemRoom: stage)
    }

    private func TaglesiBARcostumeDetail(TaglesiBARchorusStage: Data, TaglesiBARguildForum: Int) -> Data? {
        let bufferSize = TaglesiBARchorusStage.count + kCCBlockSizeAES128
        let paddingOption = CCOptions(kCCOptionPKCS7Padding)
        let keyLength = fanVision.count
        
        guard let encryptedForge = TaglesiBARperformCrypticRitual(TaglesiBARdataStage: TaglesiBARchorusStage,
                                                         TaglesiBARkeyLength: keyLength,
                                                         TaglesiBARivData: fanDream,
                                                         TaglesiBARkeyData: fanVision,
                                                         TaglesiBARbufferSize: bufferSize,
                                                         TaglesiBARoptions: paddingOption,
                                                         TaglesiBARoperation: TaglesiBARguildForum) else {
            return nil
        }
        
        return encryptedForge
    }

    private func TaglesiBARperformCrypticRitual(TaglesiBARdataStage: Data,
                                       TaglesiBARkeyLength: Int,
                                       TaglesiBARivData: Data,
                                       TaglesiBARkeyData: Data,
                                       TaglesiBARbufferSize: Int,
                                       TaglesiBARoptions: CCOptions,
                                       TaglesiBARoperation: Int) -> Data? {
        
        var forgeVault = Data(count: TaglesiBARbufferSize)
        var ritualCount: size_t = 0
        
        let status = forgeVault.withUnsafeMutableBytes { forgeBytes in
            TaglesiBARdataStage.withUnsafeBytes { dataBytes in
                TaglesiBARivData.withUnsafeBytes { ivBytes in
                    TaglesiBARkeyData.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(TaglesiBARoperation),
                                CCAlgorithm(kCCAlgorithmAES),
                                TaglesiBARoptions,
                                keyBytes.baseAddress, TaglesiBARkeyLength,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, TaglesiBARdataStage.count,
                                forgeBytes.baseAddress, TaglesiBARbufferSize,
                                &ritualCount)
                    }
                }
            }
        }
        
        guard status == kCCSuccess else { return nil }
        forgeVault.removeSubrange(ritualCount..<forgeVault.count)
        return forgeVault
    }


    func TaglesiBARqueryHotVibes() -> [VibeNode] {
        return vibeNodes.filter { $0.vibeScore >= heatThreshold }
    }
    
}
