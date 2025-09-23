//
//  ResultrendVaultController.swift
//  Truelrbuios
//
//  Created by mumu on 2025/9/23.
//

import UIKit

class ResultrendVaultController: UIViewController {
    private var nisertgeing:Dictionary<String,Any>
    init(nisertgeing: Dictionary<String, Any>){
        self.nisertgeing = nisertgeing
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @IBAction func marketStall(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
