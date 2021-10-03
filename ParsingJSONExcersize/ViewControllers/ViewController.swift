//
//  ViewController.swift
//  ParsingJSONExcersize
//
//  Created by Arcani on 03.10.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let link = "https://randomuser.me/api/?results=15"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkJSON() {
        NetworkManager.shared.fetchUsers(from: link) { result in
            switch result {
            case.success:
                (print("ugabuga"))
            case.failure:
                (print("nope  nope nope"))
            }
        }
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
