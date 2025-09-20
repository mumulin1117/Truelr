//
//  TopicsCellModel.swift
//  Truelrbuios
//
//  Created by  on 2025/9/18.
//

import UIKit

class TopicsCellModel: NSObject {
    var duelArena: Array<String>?// "dynamicImgList",
    
    var sceneDirector: Int? //"dynamicId",
    var dialogueFlow: String?//"dynamicContent",
    var arenaStage:Int?// "attentionFlag",
    var danceRoutine:Int?// "createDate",
    var actingCoach:String?// "userName",
    var tournamentBracket:Int?// "storeFlag",
    var gestureGuide:Int?// "commentNum",
    var improvStage: String?// userImgUrl",
    var battleScene: Array<String>?// dynamicImgList",
    var poseTrainer: Int?// forwardNum",
   
    var guildBadge: String?//videoImgUrl",
   
    var scriptRoom:String? //dynamicTitle",
    var questBoard:Array<Dictionary<String,Any>>?// "commentVoList",

    init(setinginit dic:Dictionary<String,Any>) {
        questBoard = dic["questBoard"] as? Array<Dictionary<String,Any>>
        duelArena = dic["dic"] as? Array<String>
        battleScene  = dic["battleScene"] as? Array<String>
        sceneDirector = dic["sceneDirector"] as? Int
        arenaStage = dic["arenaStage"] as? Int
        danceRoutine = dic["danceRoutine"] as? Int
        tournamentBracket = dic["tournamentBracket"] as? Int
        gestureGuide = dic["gestureGuide"] as? Int
        poseTrainer = dic["poseTrainer"] as? Int
        
        dialogueFlow = dic["dialogueFlow"] as? String
        
        actingCoach = dic["actingCoach"] as? String
        improvStage = dic["improvStage"] as? String
        guildBadge = dic["guildBadge"] as? String
        scriptRoom = dic["scriptRoom"] as? String
    }

}
