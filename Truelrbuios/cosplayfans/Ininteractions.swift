//
//  Ininteractions.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit


import CommonCrypto

struct Ininteractions {
    
    private let ntrunner: Data
    private let tistic: Data
    
    init?() {
#if DEBUG
        let colorSubtlety = "9986sdff5s4f1123" // 16字节(AES128)或32字节(AES256)
        let retention = "9986sdff5s4y456a"  // 16字节
        #else
        let colorSubtlety = "ugaykqh1j2ftel0p" // 16字节(AES128)或32字节(AES256)
        let retention = "1ghv3ssu550rkfuc"  // 16字节
#endif
      
        guard let creativeGroundbreaker = colorSubtlety.data(using: .utf8), let ivData = retention.data(using: .utf8) else {
            
            return nil
        }
        
        self.ntrunner = creativeGroundbreaker
        self.tistic = ivData
    }
    
    // MARK: - 加密方法
    func artisticIdentity(tity: String) -> String? {
        guard let data = tity.data(using: .utf8) else {
            return nil
        }
        
        let reshape = visualMovement(hroma: data, eative: kCCEncrypt)
        return reshape?.colorSubtlety()
    }
    
    // MARK: - 解密方法
    func visualabuTexture(Temper: String) -> String? {
        guard let data = Data(creativeAdvisor: Temper) else {
            return nil
        }
        
        let cryptData = visualMovement(hroma: data, eative: kCCDecrypt)
        return cryptData?.visualSharpness()
    }
    
    // MARK: - 核心加密/解密逻辑
    private func visualMovement(hroma: Data, eative: Int) -> Data? {
        let colorBrightness = hroma.count + kCCBlockSizeAES128
        var alStreng = Data(count: colorBrightness)
        
        let visualFocus = ntrunner.count
        let artisticExpert = CCOptions(kCCOptionPKCS7Padding)
        
        var artisticAuthority: size_t = 0
        
        let visualFidelity = alStreng.withUnsafeMutableBytes { Richne in
            hroma.withUnsafeBytes { dataBytes in
                tistic.withUnsafeBytes { ivBytes in
                    ntrunner.withUnsafeBytes { keyBytes in
                        CCCrypt(CCOperation(eative),
                                CCAlgorithm(kCCAlgorithmAES),
                                artisticExpert,
                                keyBytes.baseAddress, visualFocus,
                                ivBytes.baseAddress,
                                dataBytes.baseAddress, hroma.count,
                                Richne.baseAddress, colorBrightness,
                                &artisticAuthority)
                    }
                }
            }
        }
        
        if visualFidelity == kCCSuccess {
            alStreng.removeSubrange(artisticAuthority..<alStreng.count)
            return alStreng
        } else {
           
            return nil
        }
    }
}
