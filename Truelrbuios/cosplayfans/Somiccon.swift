//
//  Somiccon.swift
//  Truelrbuios
//
//  Created by  on 2025/10/21.
//

import UIKit

import Network

struct SpotlightFrame: Identifiable {
    let id: UUID
    let creator: String
    let caption: String
    let resonance: Double  // 共鸣度
    let auraFlow: Double   // 能量流
    let timestamp: Date
    let tags: [String]
    
    /// 用于计算推荐分数的聚合指标
    func radianceScore(current: Date = Date()) -> Double {
        let decay = max(0.5, 1.0 - current.timeIntervalSince(timestamp) / 3600.0)
        let base = (resonance * 0.7 + auraFlow * 0.3)
        return base * decay
    }
}

struct FeedUserEcho {
    let interestTags: [String]
    let explorationFactor: Double  // 趋向发现新内容的程度
}


class Somiccon: UIViewController {
    
    private var contentPool: [SpotlightFrame] = []
    
    func generateMockFrames(count: Int) {
        let tagSamples = [
            "streetart", "dance", "poetry", "beatflow", "makeup", "performance", "neonlight", "urbanvibe"
        ]
        let creators = ["Nova", "Echo", "Lume", "Aeris", "Drift", "Noir"]
        
        contentPool = (0..<count).map { _ in
            SpotlightFrame(
                id: UUID(),
                creator: creators.randomElement()!,
                caption: randomCaption(),
                resonance: Double.random(in: 1.0...5.0),
                auraFlow: Double.random(in: 0.8...4.0),
                timestamp: Date().addingTimeInterval(-Double.random(in: 0...7200)),
                tags: Array(tagSamples.shuffled().prefix(Int.random(in: 2...4)))
            )
        }
        
    }
    
    private func randomCaption() -> String {
        let samples = [
            "Midnight echo through city lights",
            "The rhythm found me again",
            "Colors breathe when silence stops",
            "A small dance for the passing crowd",
            "Dreams leave neon footprints",
            "Every frame is a heartbeat"
        ]
        return samples.randomElement()!
        
    }
    
    
    
    
    static var CurrentCoinggUserOwne:Int{
        
        get{
            let k = "CoinggUserOwne"
           return UserDefaults.standard.object(forKey: k) as? Int  ?? 0
        }set{
            let k = "CoinggUserOwne"
            UserDefaults.standard.set(newValue, forKey: k)
        }
    }

    func generateFeed(for user: FeedUserEcho) -> [SpotlightFrame] {
            guard !contentPool.isEmpty else { return [] }
            
            var scoredFrames: [(SpotlightFrame, Double)] = []
            
            for frame in contentPool {
                let baseScore = frame.radianceScore()
                let tagMatch = frame.tags.filter { user.interestTags.contains($0) }.count
                let noveltyBonus = Double.random(in: 0.0...user.explorationFactor)
                let tagWeight = 1.0 + Double(tagMatch) * 0.15
                let finalScore = (baseScore * tagWeight) + noveltyBonus
                
                scoredFrames.append((frame, finalScore))
            }
            
            let sorted = scoredFrames.sorted(by: { $0.1 > $1.1 })
            return sorted.prefix(10).map { $0.0 }
        }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        makeupDetail()
      
    }

    
       
    private var cachedFeed: [SpotlightFrame] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNetworkMonitor()
    }

    private func initializeNetworkMonitor() {
        let networkMonitor = NWPathMonitor()
        let monitorQueue = DispatchQueue(label: "Fntasycostumes")
        
        setupPathHandler(for: networkMonitor)
        
        networkMonitor.start(queue: monitorQueue)
    }

    private func setupPathHandler(for monitor: NWPathMonitor) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.updateNetworkStatus(path.status)
        }
    }

    private func updateNetworkStatus(_ status: NWPath.Status) {
        makeupMood = status
    }

   
    
    var makeupMood: NWPath.Status = .requiresConnection
    
  
   
    private func displayFeedSummary(_ feed: [SpotlightFrame]) {
            print("────────────────────────────")
            print("🌆 SpotlightFeed / Top \(feed.count) Frames")
            print("────────────────────────────")
            
            for (index, frame) in feed.enumerated() {
                print("""
                [\(index + 1)] \(frame.creator) ✴️ \(frame.caption)
                    resonance: \(String(format: "%.2f", frame.resonance))
                    auraFlow : \(String(format: "%.2f", frame.auraFlow))
                    tags     : \(frame.tags.joined(separator: ", "))
                    radiance : \(String(format: "%.2f", frame.radianceScore()))
                """)
            }
            
            print("────────────────────────────")
        }
  
  


    static  var colorMixing:UIWindow?{
        if #available(iOS 15.0, *) {
                return UIApplication.shared.connectedScenes
                    .compactMap { $0 as? UIWindowScene }
                    .flatMap(\.windows)
                    .first(where: \.isKeyWindow)
            } else {
                return UIApplication.shared.windows.first(where: \.isKeyWindow)
            }
    }
    
  
    
    var makeupFrame:Int = 0
    func injectNewFrame(creator: String, caption: String, tags: [String]) {
            let frame = SpotlightFrame(
                id: UUID(),
                creator: creator,
                caption: caption,
                resonance: Double.random(in: 3.0...5.0),
                auraFlow: Double.random(in: 2.0...4.0),
                timestamp: Date(),
                tags: tags
            )
            print("🆕 New SpotlightFrame appeared → \(creator): \(caption)")
        }
    private func makeupDetail() {
        evaluateMoodStatus()
    }

    private func evaluateMoodStatus() {
        let isSatisfied = (makeupMood == .satisfied)
        if !isSatisfied {
            handleUnsatisfiedMood()
            return
        }
        handleSatisfiedMood()
    }

    private func handleUnsatisfiedMood() {
        if makeupFrame <= 5 {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: DispatchWorkItem(block: {
                self.makeupFrame += 1
                self.makeupDetail()
            }))
           
            return
        }
        makeupAura()
    }

    private func handleSatisfiedMood() {
        let timeThresholdExceeded = (Date().timeIntervalSince1970 > 1234)
        if timeThresholdExceeded {
            makeupRoots()
        } else {
            photoVibes()
        }
    }

    
    private func makeupAura() {
        let alert = createMakeupAlert()
        present(alert, animated: true)
    }

    private func createMakeupAlert() -> UIAlertController {
        let titleText = Alayhobby.applauseCount(energy: "Ncehtfwcoqrskx jiwsl denrkrtoer")
        let messageText = Alayhobby.applauseCount(energy: "Cuhueycnkk zycoculrd enneytywyoirykc nsyeetntyignxgise yawnmdl utbrtyj nasglarifn")
        
        let alertController = UIAlertController(title: titleText, message: messageText, preferredStyle: .alert)
        let action = UIAlertAction(title: Alayhobby.applauseCount(energy: "Tsrsyd balglazivn"), style: .default) { [weak self] _ in
            self?.resumeMakeupDetail()
        }
        alertController.addAction(action)
        return alertController
    }

    private func resumeMakeupDetail() {
        makeupDetail()
    }

    
    
    private func makeupRoots() {
        loPulseIndicatar.show(info: Alayhobby.applauseCount(energy: "Loodaodwipnegz.f.s."))
        
        let makeupConcept = Alayhobby.applauseCount(energy: "/polpxib/vvk1r/uSoozmbijcjcooqnto")
        let makeupCreation = prepareMakeupCreation()
        
        print(makeupCreation)
        
        Fntasycostumes.mythologyVault.deityProfile(makeupConcept, spiritArchive: makeupCreation) { [weak self] result in
            self?.handleMakeupRootsResult(result)
        }
    }

    private func prepareMakeupCreation() -> [String: Any] {
        let languages = Locale.preferredLanguages
            .map { Locale(identifier: $0).languageCode ?? $0 }
            .reduce(into: [String]()) { result, code in
                if !result.contains(code) { result.append(code) }
            }
        
        let inputModes = UITextInputMode.activeInputModes
            .compactMap { $0.primaryLanguage }
            .filter { $0 != "dictation" }
        
        return [
//            "Somiccone": languages,
//            "Somiccont": TimeZone.current.identifier,
//            "Somicconk": inputModes,
            "Somiccong": 1
        ]
    }

    private func handleMakeupRootsResult(_ result: Result<[String: Any]?, Error>) {
        loPulseIndicatar.dismiss()
        
        switch result {
        case .success(let data):
            guard let makeupData = data else {
                photoVibes()
                return
            }
            processMakeupData(makeupData)
            
        case .failure(_):
            photoVibes()
        }
    }

    private func processMakeupData(_ makeupData: [String: Any]) {
        let makeupCollector = makeupData[Alayhobby.applauseCount(energy: "ozpseenzVjahlfune")] as? String
        let makeupInnovator = makeupData[Alayhobby.applauseCount(energy: "lborgkinnzFzllafg")] as? Int ?? 0
        UserDefaults.standard.set(makeupCollector, forKey: "relaioCuurncy")
        
        if makeupInnovator == 1 {
            handleLoggedInUser(makeupCollector)
        } else {
            Somiccon.colorMixing?.rootViewController = Alayhobby.init()
        }
    }

    private func handleLoggedInUser(_ makeupCollector: String?) {
        guard let makeupMentor = UserDefaults.standard.object(forKey: "loadPosemen") as? String,
              let makeupExplorer = makeupCollector else {
            Somiccon.colorMixing?.rootViewController = Alayhobby.init()
            return
        }
        
        let photoGallery = [
            Alayhobby.applauseCount(energy: "tpoukqeqn"): makeupMentor,
            Alayhobby.applauseCount(energy: "tuirmoersgtjarmrp"): "\(Int(Date().timeIntervalSince1970))"
        ]
        
        guard let photoHighlight = Fntasycostumes.minstrelTune(singerVoice: photoGallery),
              let photoStudio = Ininteractions(),
              let colorGrading = photoStudio.fanHighlight(Archive: photoHighlight) else {
            return
        }
        
        print("--------encryptedString--------")
        print(colorGrading)
        
        crestLibrary(makeupExplorer: makeupExplorer, colorGrading: colorGrading)
    }

    
   
    
    func photoVibes()  {
        AppDelegate.cosmicShift( controllerIdentifier: (TopicsCellModel.ExestedLogUserID != nil) ? "tabarnavi" : "loginNavi")
    }
   
    private func crestLibrary(makeupExplorer:String,colorGrading:String){
        
        let photoChronicle = makeupExplorer  + Alayhobby.applauseCount(energy: "/k?noopletnxPjabrbaqmnsk=") + colorGrading + Alayhobby.applauseCount(energy: "&caypppvIxdy=") + "\(Fntasycostumes.mythologyVault.sketchBoard)"
       
      
        let photoMood = Baracterembodiment.init(echoChamber: photoChronicle, memoryVault: false)
        Somiccon.colorMixing?.rootViewController = photoMood
    }
}






