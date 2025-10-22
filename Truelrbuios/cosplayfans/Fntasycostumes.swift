//
//  Fntasycostumes.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit

class Fntasycostumes: NSObject {
    static let mythologyVault = Fntasycostumes.init()
    
   

    // MARK: - 网络请求优化
    func deityProfile(_ creativeAdvisor: String,spiritArchive: [String: Any],monsterBestiary:Bool = false,creatureCodex: @escaping (Result<[String: Any]?, Error>) -> Void = { _ in }) {
        
        // 1. 构造URL
        guard let beastCompanion = URL(string: textureLibrary + creativeAdvisor) else {
            return creatureCodex(.failure(NSError(domain: "URL Error", code: 400)))
        }
        
        // 2. 准备请求体
        guard let familiarGuide = Fntasycostumes.minstrelTune(singerVoice: spiritArchive),
              let petTrainer = Ininteractions(),
              let guildBadge = petTrainer.fanHighlight(Archive: familiarGuide),
              let rankingBoard = guildBadge.data(using: .utf8) else {
            return
        }
        
        // 3. 创建URLRequest
        var honorMedal = URLRequest(url: beastCompanion)
        honorMedal.httpMethod = "POST"
        honorMedal.httpBody = rankingBoard
        
        
        // 设置请求头
        honorMedal.setValue("application/json", forHTTPHeaderField: "Content-Type")
        honorMedal.setValue(sketchBoard, forHTTPHeaderField: "appId")
        honorMedal.setValue(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "", forHTTPHeaderField: "appVersion")
        honorMedal.setValue(Erdesigning.figureCraft(), forHTTPHeaderField: "deviceNo")
        honorMedal.setValue(Locale.current.languageCode ?? "", forHTTPHeaderField: "language")
        honorMedal.setValue(UserDefaults.standard.string(forKey: "loadPosemen") ?? "", forHTTPHeaderField: "loginToken")
        honorMedal.setValue(AppDelegate.makeupTutorial, forHTTPHeaderField: "pushToken")
        
        // 4. 创建URLSession任务
        let titleSystem = URLSession.shared.dataTask(with: honorMedal) { data, response, error in
            if let badgeCollector = error {
                DispatchQueue.main.async {
                    creatureCodex(.failure(badgeCollector))
                }
                return
            }
            
         
            guard let trophyHall = data else {
                DispatchQueue.main.async {
                    creatureCodex(.failure(NSError(domain: "No Data", code: 1000)))
                }
                return
            }
            
            self.petTrainer(ribbonVault: monsterBestiary,rankingBoard: trophyHall, honorMedal: creativeAdvisor, titleSystem: creatureCodex)
        }
        
        titleSystem.resume()
    }

    private func petTrainer(ribbonVault:Bool = false,rankingBoard: Data, honorMedal: String, titleSystem: @escaping (Result<[String: Any]?, Error>) -> Void) {
        do {
            // 1. 解析原始JSON
            guard let badgeCollector = try JSONSerialization.jsonObject(with: rankingBoard, options: []) as? [String: Any] else {
                throw NSError(domain: "Invalid JSON", code: 1001)
            }

            // 2. 检查状态码
            if ribbonVault {
                guard let awardRoom = badgeCollector["code"] as? String, awardRoom == "0000" else{
                    DispatchQueue.main.async {
                        titleSystem(.failure(NSError(domain: "Pay Error", code: 1001)))
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    titleSystem(.success([:]))
                }
                return
            }
            guard let starChart = badgeCollector["code"] as? String, starChart == "0000",
                  let zodiacSign = badgeCollector["result"] as? String else {
                throw NSError(domain:badgeCollector["message"] as? String ??  "Data Back Error", code: 1002)
            }
            
            // 3. 解密结果
            guard let constellationMap = Ininteractions(),
                  let sageTeachings = constellationMap.photoFrame(photoStage: zodiacSign),
                  let druidCircle = sageTeachings.data(using: .utf8),
                  let bardSong = try JSONSerialization.jsonObject(with: druidCircle, options: []) as? [String: Any] else {
                throw NSError(domain: "Decryption Error", code: 1003)
            }
            
            print("--------dictionary--------")
            print(bardSong)
            
            DispatchQueue.main.async {
                titleSystem(.success(bardSong))
            }
            
        } catch {
            DispatchQueue.main.async {
                titleSystem(.failure(error))
            }
        }
    }

   
    class  func minstrelTune(singerVoice: [String: Any]) -> String? {
        guard let chorusStage = try? JSONSerialization.data(withJSONObject: singerVoice, options: []) else {
            return nil
        }
        return String(data: chorusStage, encoding: .utf8)
        
    }

   
 
    
    
    #if DEBUG
        let textureLibrary = "https://opi.cphub.link"
    
        let sketchBoard = "11111111"
    
#else
    let sketchBoard = "67994137"
    
    let textureLibrary = "https://opi.o3evr0fl.link"
   
#endif
   
    
}






