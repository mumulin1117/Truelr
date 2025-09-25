//
//  RibbonVaulControoer.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit
import SVProgressHUD
import SwiftyStoreKit
struct CharmBundle {
    let hearts: Int       // 基础数量
    let giftExtra: Int    // 赠送
    let unlockValue: String // 美金价格
    let hasPromo: Bool
    let CpriductID:String
    
}

class RibbonVaulControoer: UIViewController {

    @IBOutlet weak var travelDiary: UILabel!
    
    @IBOutlet weak var expeditionNotes: UICollectionView!
   
    @IBAction func bahingop(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    private let charmBundles: [CharmBundle] = [
        CharmBundle(hearts: 300, giftExtra: 100, unlockValue: "0.99", hasPromo: true, CpriductID: "ufnclhqnidqznfch"),
        CharmBundle(hearts: 700, giftExtra: 100, unlockValue: "1.99", hasPromo: true, CpriductID: "adzmxihoombungys"),
        CharmBundle(hearts: 2350, giftExtra: 100, unlockValue: "4.99", hasPromo: true, CpriductID: "oqlygwmfchwdxvqh"),
        CharmBundle(hearts: 5050, giftExtra: 100, unlockValue: "9.99", hasPromo: true, CpriductID: "gwquedscjjdjkrvc"),
        CharmBundle(hearts: 10800, giftExtra: 100, unlockValue: "19.99", hasPromo: true, CpriductID: "nmhqgblmkgeeqpug"),
        CharmBundle(hearts: 29400, giftExtra: 100, unlockValue: "49.99", hasPromo: true, CpriductID: "ntjdhcdigmotmnao"),
        CharmBundle(hearts: 63700, giftExtra: 100, unlockValue: "99.99", hasPromo: true, CpriductID: "jhydnytpzboswmfl"),
       ]
       
       override func viewDidLoad() {
           super.viewDidLoad()
          
           textureLibrary()
           travelDiary.text = "My Blance:\(ViewController.CurrentCoinggUserOwne)"
       }
       
       private func textureLibrary() {
           let layout = UICollectionViewFlowLayout()
          
           layout.minimumLineSpacing = 16
           layout.minimumInteritemSpacing = 11
           let width = (view.bounds.width - 16*2 - 11) / 2
           layout.itemSize = CGSize(width: width, height: 174)
           
           expeditionNotes.collectionViewLayout = layout
           expeditionNotes.backgroundColor = UIColor.white
           expeditionNotes.register(CharmBundleCell.self, forCellWithReuseIdentifier: "CharmBundleCell")
           expeditionNotes.dataSource = self
           expeditionNotes.delegate = self
           
          
       }
   }

   // MARK: - CollectionView DataSource
   extension RibbonVaulControoer: UICollectionViewDataSource, UICollectionViewDelegate {
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           return charmBundles.count
       }
       
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharmBundleCell", for: indexPath) as? CharmBundleCell else {
               return UICollectionViewCell()
           }
           let bundle = charmBundles[indexPath.item]
           cell.configure(with: bundle)
           return cell
       }
       
       func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
           let bundle = charmBundles[indexPath.item]
         
           view.isUserInteractionEnabled = false
           SVProgressHUD.show(withStatus: "Paying...")
         
           SwiftyStoreKit.purchaseProduct(bundle.CpriductID, atomically: true) { psResult in
               
               if case .success(let psPurch) = psResult {
                   let psdownloads = psPurch.transaction.downloads
                   
                   if !psdownloads.isEmpty {
                       SwiftyStoreKit.start(psdownloads)
                   }
                   
                   if psPurch.needsFinishTransaction {
                       SwiftyStoreKit.finishTransaction(psPurch.transaction)
                   }
                   
                   self.view.isUserInteractionEnabled = true
                  
                   let allcount =  ViewController.CurrentCoinggUserOwne + bundle.hearts + bundle.giftExtra
                   
                   ViewController.CurrentCoinggUserOwne = allcount
                   SVProgressHUD.showSuccess(withStatus: "Pay Successful")
                   
                   self.travelDiary.text = "My Blance:\(ViewController.CurrentCoinggUserOwne)"
             
               }else if case .error(let error) = psResult {
                   self.view.isUserInteractionEnabled = true
                   
                   if error.code != .paymentCancelled {
                       SVProgressHUD.showError(withStatus: error.localizedDescription)
                       return
                   }
                   
                   SVProgressHUD.dismiss()
               }
           }
           
       }
       
       
       
   }

   // MARK: - Cell
   class CharmBundleCell: UICollectionViewCell {
       
       private let promoLabel = UIImageView(image: UIImage.init(named: "figureCraft"))
       private let heartLabel = UILabel()
       private let giftLabel = UILabel()
       private let valueLabel = UILabel()
       
       override init(frame: CGRect) {
           super.init(frame: frame)
           contentView.backgroundColor = UIColor.white
           contentView.layer.cornerRadius = 12
           contentView.layer.borderWidth = 1
           contentView.layer.borderColor = UIColor.systemPink.cgColor
           setupUI()
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       private func setupUI() {
        
           
           heartLabel.font = UIFont.boldSystemFont(ofSize: 22)
           heartLabel.textColor = UIColor.systemPink
           heartLabel.textAlignment = .center
           
           giftLabel.font = UIFont.systemFont(ofSize: 14)
           giftLabel.textColor = UIColor.orange
           giftLabel.textAlignment = .center
           
           valueLabel.font = UIFont.boldSystemFont(ofSize: 16)
           valueLabel.textColor = UIColor.white
           valueLabel.textAlignment = .center
           valueLabel.backgroundColor = UIColor.systemPink
           valueLabel.layer.cornerRadius = 15
           valueLabel.layer.masksToBounds = true
           
           contentView.addSubview(promoLabel)
           contentView.addSubview(heartLabel)
           contentView.addSubview(giftLabel)
           contentView.addSubview(valueLabel)
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           promoLabel.frame = CGRect(x: 0, y: 0, width: 88, height: 24)
           heartLabel.frame = CGRect(x: 0, y: 38, width: contentView.bounds.width, height: 40)
           giftLabel.frame = CGRect(x: 0, y: 84, width: contentView.bounds.width, height: 20)
           valueLabel.frame = CGRect(x: 12, y: 119, width: contentView.bounds.width - 24, height: 43)
       }
       
       func configure(with bundle: CharmBundle) {
           heartLabel.text = "\(bundle.hearts)"
           giftLabel.text = "+\(bundle.giftExtra)"
           valueLabel.text = bundle.unlockValue
           promoLabel.isHidden = !bundle.hasPromo
       }
   }
