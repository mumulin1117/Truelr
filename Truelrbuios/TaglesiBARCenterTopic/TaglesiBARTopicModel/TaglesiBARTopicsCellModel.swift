//
//  TaglesiBARTopicsCellModel.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit

class TaglesiBARTopicsCellModel: NSObject {
    var duelArena: Array<String>?
    
    var sceneDirector: Int?
    var dialogueFlow: String?
    var arenaStage:Int?
    var danceRoutine:Int?
    var actingCoach:String?
    var tournamentBracket:Int?
    var gestureGuide:Int?
    var improvStage: String?
    var battleScene: Array<String>?
    var poseTrainer: Int?
   
    var guildBadge: String?
   
    var scriptRoom:String?
    var questBoard:Array<Dictionary<String,Any>>?
    var storyboardPanel:Int?
    
    
    static var ExestedLogUserID:Int?{
        
        get{
            let k = "dungeonGuide"
           return UserDefaults.standard.object(forKey: "dungeonGuide") as? Int
        }set{
            let k = "dungeonGuide"
            UserDefaults.standard.set(newValue, forKey: k)
        }
    }
    
    init(setinginit dic:Dictionary<String,Any>) {
        questBoard = dic["questBoard"] as? Array<Dictionary<String,Any>>
        duelArena = dic["dic"] as? Array<String>
        battleScene  = dic["battleScene"] as? Array<String>
        sceneDirector = dic["sceneDirector"] as? Int
        arenaStage = dic["arenaStage"] as? Int
        danceRoutine = dic["danceRoutine"] as? Int
        tournamentBracket = dic["tournamentBracket"] as? Int
        gestureGuide = 0
        poseTrainer = dic["poseTrainer"] as? Int
        
        dialogueFlow = dic["dialogueFlow"] as? String
        
        actingCoach = dic["actingCoach"] as? String
        improvStage = dic["improvStage"] as? String
        guildBadge = dic["guildBadge"] as? String
        scriptRoom = dic["scriptRoom"] as? String
        
        storyboardPanel = Int(dic["storyboardPanel"] as? String ?? "0")
    }

}
