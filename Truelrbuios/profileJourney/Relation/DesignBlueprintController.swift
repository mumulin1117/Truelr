//
//  DesignBlueprintController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/24.
//

import UIKit
enum OrbitListMode {
    case blacklist
    case followers
    case friends
    case successgfulhistory
}

class DesignBlueprintController: UIViewController {
    @IBAction func yuqihang(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBOutlet weak var noiebrrTitle: UILabel!
    
    private let orbitTable = UITableView(frame: .zero, style: .plain)
       private var orbitMode: OrbitListMode = .followers
    
    private var users: [Dictionary<String,Any>] = [Dictionary<String,Any>]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 根据模式设置标题
             
        switch orbitMode {
        case .blacklist: 
            users = MonkDisciplineController.bloackuserID
            noiebrrTitle.text = "Blacklist"
        case .followers: noiebrrTitle.text = "Fans"
            users = []
        case .friends:
            users = []
            noiebrrTitle.text = "Friends"
        case .successgfulhistory:
            users = CharaMeaasController.matchingSuccessfullist
            noiebrrTitle.text = "Matching success"
        }
        orbitTable.rowHeight = 100
        orbitTable.delegate = self
        orbitTable.dataSource = self
        orbitTable.separatorStyle = .none
        orbitTable.frame = view.bounds
        orbitTable.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        orbitTable.register(OrbitUserCell.self, forCellReuseIdentifier: "OrbitUserCell")
        orbitTable.backgroundColor = .clear
        orbitTable.frame.origin.y = noiebrrTitle.frame.maxY + 40
        view.addSubview(orbitTable)
    }

    init(mode: OrbitListMode) {
           super.init(nibName: nil, bundle: nil)
           self.orbitMode = mode
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

}
extension DesignBlueprintController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrbitUserCell", for: indexPath) as! OrbitUserCell
        let user = users[indexPath.row]
        
        // 按模式设置按钮
        var actionTitle = ""
        switch orbitMode {
        case .blacklist: actionTitle = "Unblock"
        case .followers: actionTitle = "Follow back"
        case .friends: actionTitle = "Unfollow"
        case .successgfulhistory:
            actionTitle = ">"
        }
        
        cell.configure(with: user, actionTitle: actionTitle)
        cell.actionHandler = { [weak self] in
            if self?.orbitMode == .blacklist {
                MonkDisciplineController.bloackuserID = MonkDisciplineController.bloackuserID.filter({ resuil in
                    resuil["mangaPanel"] as? Int != user["mangaPanel"] as? Int
                })
                self?.users = MonkDisciplineController.bloackuserID
                SharedTopicsController.getingallUser.append(user)

                self?.orbitTable.reloadData()
                return
            }
            self?.navigationController?.pushViewController(ArenaStageController.init(nisertgeing: user), animated: true)
           
        }
        return cell
    }
}
class OrbitUserCell: UITableViewCell {
    
    private let avatarView = UIImageView()
    private let nameLabel = UILabel()
    private let locationLabel = UILabel()
    private let actionButton = UIButton(type: .system)
    
    var actionHandler: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        avatarView.layer.cornerRadius = 25
        avatarView.clipsToBounds = true
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        avatarView.contentMode = .scaleAspectFill
        
        nameLabel.font = .boldSystemFont(ofSize: 16)
        locationLabel.font = .systemFont(ofSize: 14)
        locationLabel.textColor = .gray
        
        actionButton.layer.cornerRadius = 15
        actionButton.backgroundColor = UIColor.systemPink
        actionButton.setTitleColor(.white, for: .normal)
        actionButton.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        actionButton.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, locationLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(avatarView)
        contentView.addSubview(stack)
        contentView.addSubview(actionButton)
        
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            avatarView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatarView.widthAnchor.constraint(equalToConstant: 50),
            avatarView.heightAnchor.constraint(equalToConstant: 50),
            
            stack.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 12),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            actionButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            actionButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            actionButton.widthAnchor.constraint(equalToConstant: 90),
            actionButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with user: Dictionary<String,Any>, actionTitle: String) {
        avatarView.displayCharacterPortrait(from: user["villainProfile"] as? String )
        nameLabel.text = (user["heroArchive"] as? String)
        locationLabel.text = (user["folkloreRoom"] as? String)
        actionButton.setTitle(actionTitle, for: .normal)
    }
    
    @objc private func didTapAction() {
        actionHandler?()
    }
}
