//
//  ViewController.swift
//  african-warriors
//
//  Created by Mohamed Hayibor on 9/27/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!
    
    var warrior = [Warrior]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // example initialization
        // let lat = Warrior(name: "latdior", warriorId: 1);
        
        // assigning the delegate and datasource to self
        collection.dataSource = self
        collection.delegate = self
        
        parseWarriorsCSV()
    }
    
    func parseWarriorsCSV() {
        let path = Bundle.main.path(forResource: "warriors", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            // for debugging purposes
            print( rows )
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    // dequeues the cell and sets it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WarriorCell", for: indexPath) as? WarriorCell {
            
            let warrior = Warrior(name: "Warrior", warriorId: indexPath.row)
            cell.configureCell(warrior: warrior)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    // executes when a cell is tapped
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
    // sets the number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return 15 for now > for testing purposes
        return 15
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // defining the size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
}

