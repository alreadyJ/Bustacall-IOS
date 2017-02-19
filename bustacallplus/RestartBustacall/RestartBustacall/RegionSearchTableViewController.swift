//
//  RegionSearchTableViewController.swift
//  RestartBustacall
//
//  Created by JongMinKim on 2/11/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

import UIKit

let TMAP_APPKEY = "9175cfb8-62e9-3ed9-b58b-e61c7016bc53"


class RegionSearchTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var filteredPoi = [Poi]()
    
    var searchController : UISearchController!
    var resultsController = UITableViewController()
    let testing = RegionSearch()
    var tableResults = Json4Swift_Base()
    var poiResult = Poi()
    var selectedIdx:Int = 0
    var flag:Int = 0
   
    @IBAction func completeSelectBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func previousViewBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultsController.tableView.dataSource = self
        self.resultsController.tableView.delegate = self
        
        let JSonString = testing.httpRequestTesting("서울")
        var dictonary:NSDictionary?
        if let data = JSonString?.data(using: String.Encoding.utf8) {
            
            do {
                dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                
            } catch let error as NSError {
                print(error)
            }
        }
        tableResults = Json4Swift_Base(dictionary: dictonary!)


        self.searchController = UISearchController(searchResultsController: self.resultsController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        
    }
    
 
    func updateSearchResults(for searchController: UISearchController) {
        // filter through the dogs 
        
        if self.searchController.searchBar.text?.lowercased() != "" {
            
        
        
            let JSonString = testing.httpRequestTesting(self.searchController.searchBar.text!.lowercased())
            var dictonary:NSDictionary?
            if let data = JSonString?.data(using: String.Encoding.utf8) {
            
                do {
                    dictonary = try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject] as NSDictionary?
                    
                } catch let error as NSError {
                    print(error)
                }
            }
            if dictonary != nil {
                tableResults = Json4Swift_Base(dictionary: dictonary!)
            }
            
        //update the results TableView
        
        self.resultsController.tableView.reloadData()
        }
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (self.tableResults?.searchPoiInfo?.pois?.poi?.count)!
        
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: cellIdentifier)
        cell.textLabel?.text = self.tableResults?.searchPoiInfo?.pois?.poi?[indexPath.row].name
        var addrString = (self.tableResults?.searchPoiInfo?.pois?.poi?[indexPath.row].upperAddrName)!+" "
        addrString = addrString + (self.tableResults?.searchPoiInfo?.pois?.poi?[indexPath.row].middleAddrName)!
        addrString = addrString + " "
        addrString = addrString + (self.tableResults?.searchPoiInfo?.pois?.poi?[indexPath.row].lowerAddrName)!
        cell.detailTextLabel?.text = addrString
        cell.accessoryType = .detailDisclosureButton
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        selectedIdx = indexPath.row
        self.performSegue(withIdentifier: "checkMapSegue", sender: self)
//
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if segue.identifier == "checkMapSegue"{
            
            if let destination:checkMapViewController = segue.destination as? checkMapViewController{
                
                var addr = (self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].upperAddrName)!+" "
                addr = addr + (self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].middleAddrName)!
                addr = addr + " "
                addr = addr + (self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].lowerAddrName)!
                
                destination.insertData(tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].name,
                                       (tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].frontLat)!,
                                       (tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].frontLon)!,
                                       (tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].noorLat)!,
                                       (tableResults?.searchPoiInfo?.pois?.poi?[selectedIdx].noorLon)!,
                                       addr)
            }
        }
        if segue.identifier == "ReserveDone" {
            if flag == 1 || flag == 2{
                if let destination:ReservationRoundTableViewController = segue.destination as? ReservationRoundTableViewController{
                    if let selectedIndex = self.tableView.indexPathForSelectedRow?.row{
                        if flag == 1 {
                            destination.startBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.startBtn.setTitleColor(UIColor.black, for: .normal)
                            destination.endBtn2.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.endBtn2.setTitleColor(UIColor.black, for: .normal)
                        } else if flag == 2 {
                            destination.endBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.endBtn.setTitleColor(UIColor.black, for: .normal)
                            destination.startBtn2.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.startBtn2.setTitleColor(UIColor.black, for: .normal)
                        }
                    }
                
                }
            }
            else if flag == 3 || flag == 4{
                if let destination:ReservationOneWayTableViewController = segue.destination as? ReservationOneWayTableViewController{
                    if let selectedIndex = self.tableView.indexPathForSelectedRow?.row{
                        if flag == 3 {
                            destination.startBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.startBtn.setTitleColor(UIColor.black, for: .normal)
                        } else if flag == 4 {
                            destination.endBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.endBtn.setTitleColor(UIColor.black, for: .normal)
                        }
                    }
                    
                }
            }
            else if flag == 5 || flag == 6{
                if let destination:SearchPurposeTableViewController = segue.destination as? SearchPurposeTableViewController{
                    if let selectedIndex = self.tableView.indexPathForSelectedRow?.row{
                        if flag == 5 {
                            destination.startBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.startBtn.setTitleColor(UIColor.black, for: .normal)
                        } else if flag == 6 {
                            destination.endBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.endBtn.setTitleColor(UIColor.black, for: .normal)
                        }
                    }
                    
                }
            }
            else if flag == 7 || flag == 8{
                if let destination:SearchDestinationTableViewController = segue.destination as? SearchDestinationTableViewController{
                    if let selectedIndex = self.tableView.indexPathForSelectedRow?.row{
                        if flag == 7 {
                            destination.startBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.startBtn.setTitleColor(UIColor.black, for: .normal)
                        } else if flag == 8 {
                            destination.endBtn.setTitle(self.tableResults?.searchPoiInfo?.pois?.poi?[selectedIndex].name, for: .normal)
                            destination.endBtn.setTitleColor(UIColor.black, for: .normal)
                        }
                    }
                    
                }
            }
            
            
            
        }
        

        
    }
    

}
