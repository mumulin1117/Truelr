//
//  AnovationLabControlle.swift
//  Truelrbuios
//
//  Created by  on 2025/9/20.
//

import UIKit
import FSPagerView
import SVProgressHUD
class AnovationLabControlle: UIViewController, FSPagerViewDataSource, FSPagerViewDelegate  {
    
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
    private var pagerView: FSPagerView?
       
    private var pageControl: FSPageControl?
       
    @IBOutlet weak var zodiacSignTitleLabel: UILabel!
    
    @IBOutlet weak var spellBook: UIImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           actingCoachBack.isUserInteractionEnabled = true
        
        spellBook.maskedlabeVobor(enter: 16)
     
           
           maskTheatre()
           createrBootpnVir()
       }
    
    private var cellModelFot:TopicsCellModel
    private var dymTyoe:Int
    init(cellModelFot: TopicsCellModel,dymTyoe:Int) {
        self.cellModelFot = cellModelFot
        self.dymTyoe = dymTyoe
        SVProgressHUD.show()
        super.init(nibName: nil, bundle: nil)
    }
    
    @IBOutlet weak var magicCircle: UILabel!
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBOutlet weak var questBoard: UILabel!
    func maskTheatre()  {
        if dymTyoe == 1 {//video
            zodiacSignTitleLabel.text = "Short video"
//            actingCoachBack.displayCharacterPortrait(from: cellModelFot.guildBadge)
            centerpaling.isHidden = false
            
            self.actingCoachBack.insertSubview(self.PlayingView, at: 0)
        }else{//轮播图
            centerpaling.isHidden = true
            setupPager()
            zodiacSignTitleLabel.text = "Dynamic Details"
        }
        NotificationCenter.default.addObserver(self, selector: #selector(suteiback), name: NSNotification.Name.init("Blockuseraction"), object: nil)
 
        
        spellBook.displayCharacterPortrait(from: cellModelFot.improvStage)
        
        magicCircle.text = cellModelFot.actingCoach
        
        enchantmentLab.text = cellModelFot.dialogueFlow
        
        lineArt.isSelected = (cellModelFot.arenaStage == 1)
        
        conceptSheet.text = "\(cellModelFot.poseTrainer ?? 0)"
        
        questBoard.text = "\(cellModelFot.gestureGuide ?? 0)"
        SVProgressHUD.dismiss()
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
    
    private lazy var PlayingView: AuroraReelBox = {
        let videoView = AuroraReelBox(frame: self.view.bounds)
        if let page = cellModelFot.battleScene?.first {
            videoView.igniteStream(resource:page )
        }
        
        return videoView
    }()
    
    
    
    
   
       private func setupPager() {
           // 创建 PagerView
           pagerView = FSPagerView(frame:UIScreen.main.bounds)
           pagerView?.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
           pagerView?.dataSource = self
           pagerView?.delegate = self
           pagerView?.automaticSlidingInterval = 2.0
           pagerView?.isInfinite = true
           pagerView?.transformer = FSPagerViewTransformer(type: .linear)
           self.view.insertSubview(pagerView!, belowSubview: honorMedal)
           
           // 创建 PageControl
           pageControl = FSPageControl(frame: CGRect(x: 0, y: honorMedal.frame.maxY + 20, width: view.bounds.width, height: 10))
           pageControl?.numberOfPages = cellModelFot.battleScene?.count ?? 0
           pageControl?.contentHorizontalAlignment = .center
           
           pageControl?.setFillColor(UIColor(red: 1, green: 0.93, blue: 0.95, alpha: 1), for: .normal)
           pageControl?.setFillColor(UIColor(red: 0.98, green: 0.37, blue: 0.55, alpha: 1), for: .selected)
           self.view.insertSubview(pageControl!, belowSubview: honorMedal)
       }
       
       // MARK: - FSPagerView DataSource
       
       func numberOfItems(in pagerView: FSPagerView) -> Int {
           return cellModelFot.battleScene?.count ?? 0
       }
       
       func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
           let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
           
           cell.imageView?.displayCharacterPortrait(from: cellModelFot.battleScene?[index])
           cell.imageView?.contentMode = .scaleAspectFill
           cell.imageView?.clipsToBounds = true
           return cell
       }
       
       // MARK: - FSPagerView Delegate
       
       func pagerViewDidScroll(_ pagerView: FSPagerView) {
           pageControl?.currentPage = pagerView.currentIndex
       }
 
    @IBAction func makeingCstauchang(_ sender: UIButton) {
        SVProgressHUD.show()
        CosRequestManager.sendStyledRequest(endpoint: "/bjryinqmtbfrekz/ruiyjgtlu", outfitPayload: ["titleSystem":cellModelFot.sceneDirector ?? 0]) { cosplayunityhub in
            SVProgressHUD.dismiss()
            switch cosplayunityhub{
            case .success(_):
                
                
                sender.isSelected = !sender.isSelected
                
            case .failure(let error):
               
                SVProgressHUD.showInfo(withStatus: error.localizedDescription)
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
        let cont = SendCommentControlle.init(cellModelFot: self.cellModelFot.questBoard ?? [])
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
