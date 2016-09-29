//
//  ViewController.swift
//  african-warriors
//
//  Created by Mohamed Hayibor on 9/27/16.
//  Copyright © 2016 Mohamed Hayibor. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var warriors = [Warrior]()
    var filteredWarriors = [Warrior]()
    var inSearchMode = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // example initialization
        // let lat = Warrior(name: "latdior", warriorId: 1);
        
        // assigning the delegate and datasource to self
        collection.dataSource = self
        collection.delegate = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        parseWarriorsCSV()
    }
    
    func parseWarriorsCSV() {
        let path = Bundle.main.path(forResource: "warriors", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let warriorId = Int(row["id"]!)!
                let warriorName = row["name"]!
                
                /*  We'll use these pretty soon > if I extend the warrior class first
                 
                let warriorBorn = row["born"]!
                let warriorDeath = row["death"]!
                let warriorKingdom = row["kingdom"]!
                let warriorBio = row["bio"]!
                */
                
                warriors.append(Warrior(name: warriorName, warriorId: warriorId))
            }
            
            
            // for debugging purposes
            print( rows )
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    // dequeues the cell and sets it up
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WarriorCell", for: indexPath) as? WarriorCell {
            
            let warrior: Warrior!
            
            if inSearchMode {
                warrior = filteredWarriors[indexPath.row]
                cell.configureCell(warrior: warrior)
            } else {
                warrior = warriors[indexPath.row]
                cell.configureCell(warrior: warrior)
            }
            
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
        
        if inSearchMode {
            return filteredWarriors.count
        }
        
        return warriors.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    // defining the size of the cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    // at every key stroke on the searchbar the code runs
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            inSearchMode = false
            collection.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            
            let query = searchBar.text!.lowercased()
            
            filteredWarriors = warriors.filter({ $0.name.range(of: query) != nil })
            collection.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

