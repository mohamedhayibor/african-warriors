//
//  WarriorCell.swift
//  african-warriors
//
//  Created by Mohamed Hayibor on 9/28/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.
//

import UIKit

class WarriorCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var warrior: Warrior!
    
    /* snippet of code for rounded cell corners
    required init?(coder: aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    */
 
    
    func configureCell(warrior: Warrior) {
        self.warrior = warrior
        nameLbl.text = self.warrior.name.capitalized
        thumbImg.image = UIImage(named: "\(self.warrior.warriorId)")
    }
    
}
