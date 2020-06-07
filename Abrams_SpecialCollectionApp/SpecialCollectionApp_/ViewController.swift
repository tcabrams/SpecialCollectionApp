//
//  ViewController.swift
//  SpecialCollectionApp_
//
//  Created by Abrams, Teriah C on 6/7/20.
//  Copyright © 2020 Abrams, Teriah C. All rights reserved.
//
// This app is an indexed table of items in what I consdider my Entertainment Collection
// It contains Movies, Gaming Consoles, Video Games and Music Artist
// When the main category is clicked, the table should go to that section.

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // This arrary contains the index titles and the items for each category in my ecelectic entertainment collection.
    //
    let entertainmentItems = [["Movies", "Ride Along", "The Ususal Suspects", "Detective Pikachu", "Alita", "Venom", "Black Panther", "Ice Age"], ["Video Game Consoles", "XBox", "Play Station 4", "Nintendo Switch", "Genesis"], ["Video Games", "SuperSmash Brothers", "Tetris", "Mario Kart", "Space Invaders", "Mortal Kombat", "Street Fighter"], ["Musical Artists", "Sting", "Eminem", "Prince", "Heart", "Bill Withers", "Stevie Wonder"]]
    
    // This array contains the categories for the index along with emojis to represent the category
    //
    let indexArray = ["🎬 Movies", "🎮 Video Game Consoles", "👾 Video Games", "🎼 Musical Artists"]
    
    // Create a cnstant for the cell Id
    //
    let cellID = "cellID"
    
    //
    //Create the outlet for the table -
    //
    @IBOutlet var collectionTable: UITableView!
    
    //
    // modify viewDidLoad to set the collectionTable to the datasource and delegagte
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionTable.dataSource = self
        collectionTable.delegate = self
        // add attributes to table for formatting
        collectionTable.sectionIndexColor = UIColor.lightGray
        collectionTable.sectionIndexBackgroundColor = UIColor.blue
        collectionTable.sectionIndexTrackingBackgroundColor = UIColor.purple
    }
    
    //
    //Define the number of sections needed based on the types of elements in the array
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return entertainmentItems[section].count - 1
    }
    
    //
    //function to load all the data into the table view
    //
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if (cell == nil){
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = entertainmentItems[indexPath.section][indexPath.row + 1]
        
        return  cell!
    }
    
    //
    //function to count the number of sections needed based on the number of types in the array
    //
    func numberOfSections(in tableView: UITableView) -> Int {
        return entertainmentItems.count
    }
    
    //
    //function to display the header for each section of the array elements (Movies, Video Game Consoles, Video Games & Musical Artists
    //
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return entertainmentItems[section][0]
    }
    
    //
    // Function to display an index on the side based on the sections in the table
    //
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }

}

