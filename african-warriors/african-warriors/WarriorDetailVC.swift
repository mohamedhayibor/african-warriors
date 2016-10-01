//
//  WarriorDetailVC.swift
//  african-warriors
//
//  Created by Mohamed Hayibor on 9/29/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.
//

import UIKit

class WarriorDetailVC: UIViewController {
    // set default language to English
    var isEnglish = true
    
    // @IBOutlet weak var isEnglish: UISegmentedControl!
    @IBOutlet weak var warriorImage: UIImageView!
    @IBOutlet weak var warriorBorn: UILabel!
    @IBOutlet weak var warriorDeath: UILabel!
    @IBOutlet weak var warriorKingdom: UILabel!
    @IBOutlet weak var warriorBio: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    // Now the serious part: if language is english
    // 1. warriors.csv gets parsed then
    // 2. corresponding data is set label
    
    // if UISegmentedControl is triggered, change language
    @IBAction func changeLang(_ sender: UISegmentedControl) {
        isEnglish = !isEnglish
    }
    
    // I am feeling terrible, but we are parsing the data again
    func parseWarriorsCSVAgain() {
        let dbPath: String!
        
        if isEnglish {
            dbPath = Bundle.main.path(forResource: "warriors", ofType: "csv" )
        } else {
            dbPath = Bundle.main.path(forResource: "warriorsFrench", ofType: "csv")
        }
        
        do {
            let csv = try CSV(contentsOfURL: dbPath)
            
            // At we know exactly the warriors id then we just need to retrieve and assign
            // data from specific row
            let specificWarrior = csv.rows[ warriorId ]
            
            warriorImage.image = UIImage(named: "\(warriorId)")
            
            warriorBorn.text = specificWarrior["born"]
            warriorDeath.text = specificWarrior["death"]
            warriorKingdom.text = specificWarrior["kingdom"]
            warriorBio.text = specificWarrior["bio"]
            nameLbl.text = specificWarrior["name"]
        } catch let err as NSError {
            print( err.debugDescription )
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // nameLbl.text = String(selectedWarrior) > winner winner chicken dinner
        parseWarriorsCSVAgain()
    }

}
