//
//  FlowerOrdersTableViewController.swift
//  FlowerPower
//
//  Created by Andrei Bungiu on 24/06/2018.
//  Copyright © 2018 Andrei Bungiu. All rights reserved.
//

import UIKit

var flowerArray = [Flower]()

class FlowerOrdersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.register(FlowerOrderTableViewCell.self, forCellReuseIdentifier: "flowerOrderCell")
        tableView.register(UINib(nibName: "FlowerOrderTableViewCell", bundle: nil), forCellReuseIdentifier: "flowerOrderCell")
        
        let reqManager = RequestManager()
        reqManager.fetchOrdersWithCompletionBlock { (flArray, error) in
            flowerArray = flArray;
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return flowerArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FlowerOrderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "flowerOrderCell", for: indexPath) as! FlowerOrderTableViewCell
        
        cell.deliverToNameLabel.text = flowerArray[indexPath.row].deliver_to
            
        switch flowerArray[indexPath.row].desc {
            case "Red Roses":
                cell.flowerImg.image = #imageLiteral(resourceName: "red_roses")
            case "Flower power":
                cell.flowerImg.image = #imageLiteral(resourceName: "flower_power")
            case "Chrysanthemum":
                cell.flowerImg.image = #imageLiteral(resourceName: "rainbow_chrysanthemum")
            case "Rainbow Chrysanthemum":
                cell.flowerImg.image = #imageLiteral(resourceName: "rainbow_chrysanthemum")
            case "Blue Roses":
                cell.flowerImg.image = #imageLiteral(resourceName: "blue_roses")
            case  "Yellow Roses":
                cell.flowerImg.image = #imageLiteral(resourceName: "yellow_roses")
            case "Crio Red Roses":
                cell.flowerImg.image = #imageLiteral(resourceName: "crio_red_roses")
            case "Crio Rainbow Roses":
                cell.flowerImg.image = #imageLiteral(resourceName: "crio_rainbow_roses")
            case "Crio Yellow Roses":
                cell.flowerImg.image = #imageLiteral(resourceName: "crio_yellow_roses")
            case "Crio Box":
                cell.flowerImg.image = #imageLiteral(resourceName: "crio_box")
            default:
                cell.flowerImg.image = #imageLiteral(resourceName: "red_roses")
            }

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
