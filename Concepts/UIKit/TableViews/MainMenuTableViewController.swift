//
//  MainMenuTableViewController.swift
//  Concepts
//
//  Created by Gina De La Rosa on 12/2/20.
//  Source: https://developer.apple.com/documentation/uikit/views_and_controls/table_views

/*
 The table view is a staple for iOS development and UIKit. It can display information on a single scrollable column. A table view can easily be setup with code or a storyboard. This example uses a UITableViewController as the main menu with the storyboard.
 
 Each table view will rely on cells to display information such as a string or image. In this example, I created a cell to display each of the menu options below. The cell uses an identifier that the table view can recognize. In order for the table view to function properly we need to make sure to setup the UITableViewDataSource which provides information to the table and UITableViewDelegate which manages the user interactions. 
 
*/

import UIKit

class MainMenuTableViewController: UITableViewController {
    
    var menuOptions = ["Architecture", "UIKit", "Animations", "Networking", "Data Persistence", "Memory", "Threading", "Libraries"]

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuOptions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MainMenuCell", for: indexPath) as! MainMenuCell
        cell.menuLabel.text = menuOptions[indexPath.row]
        
        return cell
    }
    

}
