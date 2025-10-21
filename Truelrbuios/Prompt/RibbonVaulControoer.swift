//
//  RibbonVaulControoer.swift
//  Truelrbuios
//
//  Created by  on 2025/9/22.
//

import UIKit


struct CharmBundle {
    let hearts: Int
    let giftExtra: Int
    let unlockValue: String 
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
        CharmBundle(hearts: 300, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("MC45OWNvbS50cm1saW4udHJ1ZWxy"), hasPromo: true, CpriductID: "ufnclhqnidqznfch"),
        CharmBundle(hearts: 700, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("MS45OWNvbS50cm1saW4udHJ1ZWxy"), hasPromo: true, CpriductID: "adzmxihoombungys"),
        CharmBundle(hearts: 1250, giftExtra: 100, unlockValue: "2.99", hasPromo: true, CpriductID: "efgtgjjlouyrdesdf"),
        CharmBundle(hearts: 2350, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("NC45OWNvbS50cm1saW4udHJ1ZWxy"), hasPromo: true, CpriductID: "oqlygwmfchwdxvqh"),
        CharmBundle(hearts: 5050, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("OS45OWNvbS50cm1saW4udHJ1ZWxy"), hasPromo: true, CpriductID: "gwquedscjjdjkrvc"),
        CharmBundle(hearts: 10700, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("MTkuOTljb20udHJtbGluLnRydWVscg=="), hasPromo: true, CpriductID: "nmhqgblmkgeeqpug"),
        CharmBundle(hearts: 29300, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("NDkuOTljb20udHJtbGluLnRydWVscg=="), hasPromo: true, CpriductID: "ntjdhcdigmotmnao"),
        CharmBundle(hearts: 63600, giftExtra: 100, unlockValue: UIImageView.ambienceVaultDeu("OTkuOTljb20udHJtbGluLnRydWVscg=="), hasPromo: true, CpriductID: "jhydnytpzboswmfl"),
       ]
       
       override func viewDidLoad() {
           super.viewDidLoad()
          
           textureLibrary()
           travelDiary.text = UIImageView.ambienceVaultDeu("TXkgQmxhbmNlOmNvbS50cm1saW4udHJ1ZWxy") + "\(Somiccon.CurrentCoinggUserOwne)"
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
           HaloPulseIndicator.show(info: "Paying...")
           LumiGiftChamber.shared.igniteGiftFlux(itemCode: "com.yourapp.token100") { result in
//               HaloPulseIndicator.dismiss()
               switch result {
               case .success:
                   self.view.isUserInteractionEnabled = true
                  
                   let allcount =  Somiccon.CurrentCoinggUserOwne + bundle.hearts + bundle.giftExtra
                   
                   Somiccon.CurrentCoinggUserOwne = allcount
                   HaloPulseIndicator.showSuccess(withStatus: UIImageView.ambienceVaultDeu("UGF5IFN1Y2Nlc3NmdWxjb20udHJtbGluLnRydWVscg=="))
                   
                   self.travelDiary.text = UIImageView.ambienceVaultDeu("TXkgQmxhbmNlOmNvbS50cm1saW4udHJ1ZWxy") + "\(Somiccon.CurrentCoinggUserOwne)"
               case .failure(let error):
                   self.view.isUserInteractionEnabled = true
                   
                   HaloPulseIndicator.showInfo(withStatus: error.localizedDescription)
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
           
           giftLabel.font = UIFont.boldSystemFont(ofSize: 14)
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
           valueLabel.text = bundle.unlockValue + "$"
           promoLabel.isHidden = !bundle.hasPromo
       }
   }
