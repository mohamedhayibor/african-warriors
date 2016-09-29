//
//  WarriorDetailVC.swift
//  african-warriors
//
//  Created by Mohamed Hayibor on 9/29/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.
//

import UIKit

class WarriorDetailVC: UIViewController {
    var warrior: Warrior!

    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        nameLbl.text = warrior.name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
