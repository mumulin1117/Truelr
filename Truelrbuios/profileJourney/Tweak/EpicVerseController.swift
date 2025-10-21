
//
//  EpicVerseController.swift
//  Truelrbuios
//
//  Created by  on 2025/9/24.
//

import UIKit


class EpicVerseController: UIViewController {
    @IBAction func yuqihang(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    private let cosmicTable = UITableView(frame: .zero, style: .insetGrouped)
    
    private let stardustOptions: [(icon: String, title: String, tint: UIColor?)] = [
        ("quangiyi", UIImageView.ambienceVaultDeu("VXNlciBBZ3JlZW1lbnRjb20udHJtbGluLnRydWVscg=="), nil),
        ("sdzkjixhf", UIImageView.ambienceVaultDeu("UHJpdmFjeSBzZXJ2aWNlY29tLnRybWxpbi50cnVlbHI="), nil),
        ("doqunfckieu", UIImageView.ambienceVaultDeu("Q2xlYXIgdGhlIGNhY2hlY29tLnRybWxpbi50cnVlbHI="), nil),
        
       
        ("claseaccount", UIImageView.ambienceVaultDeu("RGVsZXRlIEFjY291bnRjb20udHJtbGluLnRydWVscg=="), nil),
        ("power", UIImageView.ambienceVaultDeu("TG9nIG91dGNvbS50cm1saW4udHJ1ZWxy"), .systemRed)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        configureNebulaTable()
    }
    
    private func configureNebulaTable() {
        cosmicTable.translatesAutoresizingMaskIntoConstraints = false
        cosmicTable.delegate = self
        cosmicTable.dataSource = self
        cosmicTable.backgroundColor = .clear
        view.addSubview(cosmicTable)
        
        NSLayoutConstraint.activate([
            cosmicTable.topAnchor.constraint(equalTo: view.topAnchor,constant: self.view.safeAreaInsets.top + 105),
            cosmicTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cosmicTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cosmicTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension EpicVerseController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stardustOptions.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let option = stardustOptions[indexPath.row]
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = option.title
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cell.textLabel?.textColor = option.tint ?? .label
      
           
        cell.imageView?.image = UIImage.init(named: option.icon)
        
        
        cell.imageView?.tintColor = option.tint ?? .label
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
            if let mainViewController = storyboard.instantiateViewController(withIdentifier: "RTelicArchiveController") as? RTelicArchiveController{
                self.present(mainViewController, animated: true)
                mainViewController.ryeuiingContetn = .tertt
            }
            
        case 1:
            let storyboard = UIStoryboard(name: UIImageView.ambienceVaultDeu("TWFpbmNvbS50cm1saW4udHJ1ZWxy"), bundle: nil)
            if let mainViewController = storyboard.instantiateViewController(withIdentifier: "RTelicArchiveController") as? RTelicArchiveController{
                self.present(mainViewController, animated: true)
                mainViewController.ryeuiingContetn = .prio
            }
        case 2:
            ChronoEngine.executeAfterTemporalShift(2) {
                HaloPulseIndicator.showSuccess(withStatus:UIImageView.ambienceVaultDeu("Q2xlYXIgY29tcGxldGVkIWNvbS50cm1saW4udHJ1ZWxy") )
            }
        case 3:
            let alert = UIAlertController(
                        title: UIImageView.ambienceVaultDeu("RGVsZXRlIEFjY291bnRjb20udHJtbGluLnRydWVscg=="),
                        message: UIImageView.ambienceVaultDeu("QXJlIHlvdSBzdXJlIHlvdSB3YW50IHRvIHBlcm1hbmVudGx5IGRlYWN0aXZhdGUgeW91ciBhY2NvdW50PyBUaGlzIGFjdGlvbiBjYW5ub3QgYmUgdW5kb25lLmNvbS50cm1saW4udHJ1ZWxy"),
                        preferredStyle: .alert
                    )
                    
                   
            let cancel = UIAlertAction(title: UIImageView.ambienceVaultDeu("Q2FuY2VsY29tLnRybWxpbi50cnVlbHI="), style: .cancel, handler: nil)
            let confirm = UIAlertAction(title: UIImageView.ambienceVaultDeu("WWVzLCBEZWxldGVjb20udHJtbGluLnRydWVscg=="), style: .destructive) { _ in
                UserDefaults.standard.set(nil, forKey: "userimajrl")
                UserDefaults.standard.set(nil, forKey: "Introduction")
                UserDefaults.standard.set(nil, forKey: "IntroAge")
                TopicsCellModel.ExestedLogUserID = nil
                lensCraftController.changeinmge = UIImage.init(named: "Hildojd")!
                ViewController.CurrentCoinggUserOwne = 0
                UserDefaults.standard.set(nil, forKey: "valorStory")
                

                AppDelegate.cosmicShift( controllerIdentifier: "loginNavi")
            }
            
            alert.addAction(cancel)
            alert.addAction(confirm)
            
            present(alert, animated: true)
        case 4:
            
            UserDefaults.standard.set(nil, forKey: "userimajrl")
            UserDefaults.standard.set(nil, forKey: "Introduction")
            UserDefaults.standard.set(nil, forKey: "IntroAge")
            TopicsCellModel.ExestedLogUserID = nil
            lensCraftController.changeinmge = UIImage.init(named: "Hildojd")!
            ViewController.CurrentCoinggUserOwne = 0
            UserDefaults.standard.set(nil, forKey: "valorStory")
            
            AppDelegate.cosmicShift( controllerIdentifier: "loginNavi")
            

        default:
            break
        }
        print("Tapped \(stardustOptions[indexPath.row].title)")
    }
}
