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
                
                /* 
                 * Change of plans the main thing we need to transfer to WarriorDetailVC is
                 * the warriorId then we'll fetch the data based on french or default english
                 * database (the 2 csv ;)
                */
                
                warriors.append(Warrior(name: warriorName, warriorId: warriorId))
            }
            
            
            // for debugging purposes
            //  print( rows )
            
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
        var warrior: Warrior!
        
        if inSearchMode {
            warrior = filteredWarriors[indexPath.row]
        } else {
            warrior = warriors[indexPath.row]
        }
        
        // explecitely sending the warrior to WarriorDetailVC but it somehow not working
        // Most likely, I don't understand how performSegue works in conjunction with the prepare function on line 141
    
        performSegue(withIdentifier: "WarriorDetailVC", sender: warrior.warriorId)
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "WarriorDetailVC" {
            if let detailVC = segue.destination as? WarriorDetailVC {
                if let warriorId = sender as? Int {
                    // **** This thing is bugging hard
                    // > I probably don't understand how segues work on IOS yet.
                    // > The only thing I need to send is the warriorId (warrior row from csv)
                    
                    detailVC.warriorId = warriorId
                }
            }
        }
    }
}

