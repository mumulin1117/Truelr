//
//  TaglesiBARAnovationLabControlle.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit


class TaglesiBARAnovationLabControlle: UIViewController, UIScrollViewDelegate  {
    private var scrollGallery: UIScrollView?
       private var pageDots: UIPageControl?
       private var autoTimer: Timer?
    
    @IBOutlet weak var TaglesiBARTitle: UILabel!
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.PlayingView.sparkOff()
        self.centerpaling.isSelected = false
    }
    
    @IBOutlet weak var bagjint: UIView!
    @IBOutlet weak var actingCoachBack: UIImageView!
    
    @IBOutlet weak var honorMedal: UIButton!
    @IBAction func suteiback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
  
    @IBOutlet weak var zodiacSignTitleLabel: UILabel!
    
    @IBOutlet weak var spellBook: UIImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           actingCoachBack.isUserInteractionEnabled = true
        
        spellBook.maskedlabeVobor(enter: 16)
     
        TaglesiBARTitle.text = "_ASt_Shared Topics_ASt_".replacingOccurrences(of: "_ASt_", with: "")
           maskTheatre()
           createrBootpnVir()
       }
    
    private var cellModelFot:TaglesiBARTopicsCellModel
    private var dymTyoe:Int
    init(cellModelFot: TaglesiBARTopicsCellModel,dymTyoe:Int) {
        self.cellModelFot = cellModelFot
        self.dymTyoe = dymTyoe
        TaglesiBARloPulseIndicatar.show(info: "")
        super.init(nibName: nil, bundle: nil)
    }
    
    @IBOutlet weak var magicCircle: UILabel!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var questBoard: UILabel!
    func maskTheatre()  {
        if dymTyoe == 1 {//video
            zodiacSignTitleLabel.text = UIImageView.ambienceVaultDeu("U2hvcnQgdmlkZW9jb20udHJtbGluLnRydWVscg==")
//            actingCoachBack.displayCharacterPortrait(from: cellModelFot.guildBadge)
            centerpaling.isHidden = false
            
            self.actingCoachBack.insertSubview(self.PlayingView, at: 0)
        }else{//轮播图
            centerpaling.isHidden = true
            setupScrollGallery()
            zodiacSignTitleLabel.text = UIImageView.ambienceVaultDeu("RHluYW1pYyBEZXRhaWxzY29tLnRybWxpbi50cnVlbHI=")
        }
        NotificationCenter.default.addObserver(self, selector: #selector(suteiback), name: NSNotification.Name.init("Blockuseraction"), object: nil)
 
        
        spellBook.displayCharacterPortrait(from: cellModelFot.improvStage)
        
        magicCircle.text = cellModelFot.actingCoach
        
        enchantmentLab.text = cellModelFot.dialogueFlow
        
        lineArt.isSelected = (cellModelFot.arenaStage == 1)
        
        conceptSheet.text = "\(cellModelFot.poseTrainer ?? 0)"
        
        questBoard.text = "\(cellModelFot.gestureGuide ?? 0)"
        TaglesiBARloPulseIndicatar.dismiss()
    }
    
    @IBOutlet weak var conceptSheet: UILabel!
    
    
    
    @IBOutlet weak var lineArt: UIButton!
    
    
    @IBOutlet weak var enchantmentLab: UILabel!
    
    func createrBootpnVir()  {
        let layerView = UIView()
        layerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 228)
        // fillCode
        let bgLayer1 = CAGradientLayer()
        bgLayer1.colors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0).cgColor, UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor]
        bgLayer1.locations = [0, 0.55]
        bgLayer1.frame = layerView.bounds
        bgLayer1.startPoint = CGPoint(x: 0.5, y: 0)
        bgLayer1.endPoint = CGPoint(x: 1, y: 1)
        bagjint.layer.insertSublayer(bgLayer1, at: 0)
        
    }
    
    private lazy var PlayingView: TaglesiBARAuroraReelBox = {
        let videoView = TaglesiBARAuroraReelBox(frame: self.view.bounds)
        if let page = cellModelFot.battleScene?.first {
            videoView.igniteStream(resource:page )
        }
        
        return videoView
    }()
    
    
    
    private func setupScrollGallery() {
            guard let images = cellModelFot.battleScene, !images.isEmpty else { return }
            
            let scrollView = UIScrollView(frame: UIScreen.main.bounds)
            scrollView.isPagingEnabled = true
            scrollView.delegate = self
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(images.count), height: scrollView.frame.height)
            self.view.insertSubview(scrollView, belowSubview: honorMedal)
            
            // 添加图片
            for (index, imageURL) in images.enumerated() {
                let imgView = UIImageView(frame: CGRect(x: CGFloat(index) * scrollView.frame.width, y: 0, width: scrollView.frame.width, height: scrollView.frame.height))
                imgView.displayCharacterPortrait(from: imageURL)
                imgView.contentMode = .scaleAspectFill
                imgView.clipsToBounds = true
                scrollView.addSubview(imgView)
            }
            
            // 添加分页控件
            let pageControl = UIPageControl(frame: CGRect(x: 0, y: honorMedal.frame.maxY + 20, width: view.bounds.width, height: 10))
            pageControl.numberOfPages = images.count
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = UIColor(red: 1, green: 0.93, blue: 0.95, alpha: 1)
            pageControl.currentPageIndicatorTintColor = UIColor(red: 0.98, green: 0.37, blue: 0.55, alpha: 1)
            self.view.insertSubview(pageControl, belowSubview: honorMedal)
            
            scrollGallery = scrollView
            pageDots = pageControl
            
            // 自动轮播
            autoTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(autoScrollGallery), userInfo: nil, repeats: true)
        }
    
    @objc private func autoScrollGallery() {
            guard let scrollView = scrollGallery, let pageDots = pageDots else { return }
            let nextPage = (pageDots.currentPage + 1) % (pageDots.numberOfPages)
            let offset = CGFloat(nextPage) * scrollView.frame.width
            scrollView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
            pageDots.currentPage = nextPage
        }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            guard let pageDots = pageDots else { return }
            let page = Int(round(scrollView.contentOffset.x / scrollView.frame.width))
            pageDots.currentPage = page
        }
   

 
    @IBAction func makeingCstauchang(_ sender: UIButton) {
        TaglesiBARloPulseIndicatar.show(info: "")
        CosRequestManager.sendStyledRequest(endpoint: "/bjryinqmtbfrekz/ruiyjgtlu", outfitPayload: ["titleSystem":cellModelFot.sceneDirector ?? 0]) { cosplayunityhub in
            TaglesiBARloPulseIndicatar.dismiss()
            switch cosplayunityhub{
            case .success(_):
                
                
                sender.isSelected = !sender.isSelected
                
            case .failure(let error):
               
                TaglesiBARloPulseIndicatar.showInfo(withStatus: error.localizedDescription)
            }
            
            
        }
    }
    
    @IBAction func inspirationWall(_ sender: UIButton) {
        if let userfislr = SharedTopicsController.getingallUser.filter({ fdr in
            fdr["mangaPanel"] as? Int == cellModelFot.storyboardPanel
        }).first{
           let innner =   ArenaStageController.init(cellModelFot: cellModelFot,dymTyoe: dymTyoe,nisertgeing: userfislr)
              
              self.navigationController?.pushViewController(innner, animated: true)
           
       }
        
     
    }
    
    
    @IBOutlet weak var centerpaling: UIButton!
    
    
    
    @IBAction func sendCommentcet(_ sender: UIButton) {
        let cont = TaglesiBARSendCommentControlle.init(cellModelFot: self.cellModelFot.questBoard ?? [])
//        cont.modalPresentationStyle = .overCurrentContext
        self.present(cont, animated: true)
        
    }
    
    
    @IBAction func rpeouingtety(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let mainViewController = storyboard.instantiateViewController(withIdentifier: "MonkDisciplineController") as? MonkDisciplineController{
            mainViewController.userINfoID = nil
            self.present(mainViewController, animated: true)
           
        }
        
    }
    
    @IBAction func puzzleCorner(_ sender: UIButton) {
        
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.PlayingView.sparkOn()
        }else{
            self.PlayingView.sparkOff()
        }
        
    }
    
    @IBAction func sayHi(_ sender: Any) {
        if let userfislr = SharedTopicsController.getingallUser.filter({ fdr in
            fdr["mangaPanel"] as? Int == cellModelFot.storyboardPanel
        }).first{
           let innner =   DanceRoutineController.init( nisertgeing: userfislr)
              
              self.navigationController?.pushViewController(innner, animated: true)
           
       }
        
        
    }
}
