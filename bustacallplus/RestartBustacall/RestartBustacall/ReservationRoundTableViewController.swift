//
//  ReservationRoundTableViewController.swift
//  RestartBustacall
//
//  Created by JongMinKim on 2/10/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

import UIKit

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

class ReservationRoundTableViewController: UITableViewController {
    // btns
    @IBOutlet weak var purposeBtn: UIButton!
    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var endBtn: UIButton!
    @IBOutlet weak var dateBtn: UIButton!
    @IBOutlet weak var timeBtn: UIButton!
    @IBOutlet weak var startBtn2: UIButton!
    @IBOutlet weak var endBtn2: UIButton!
    @IBOutlet weak var dateBtn2: UIButton!
    @IBOutlet weak var timeBtn2: UIButton!
    
    @IBAction func unwindReservation(segue:UIStoryboardSegue) {
    }
    
    
    @IBAction func purposeSelector(_ sender: Any) {
        let arraySelect = ["산악회", "출퇴근", "수학여행", "현장학습", "기타"]
        
        let alert = UIAlertController(title: "대절목적 선택", message: "", preferredStyle: UIAlertControllerStyle.alert)
        let closure = { (action: UIAlertAction!) -> Void in
            let index = alert.actions.index(of: action)
            if index != nil {
                self.purposeBtn.setTitleColor(UIColor.black, for: .normal)
                self.purposeBtn.setTitle(arraySelect[index!], for: .normal)
            }
        }
        
        
        // add the actions (buttons)
        for item in arraySelect {
            alert.addAction(UIAlertAction(title: item, style: UIAlertActionStyle.default, handler: closure))
        }
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func datePickerBtn(_ sender: Any) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 2
        let limit = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        
        
        DatePickerDialog().show("출발날짜 설정", doneButtonTitle: "확인", cancelButtonTitle: "취소", minimumDate: currentDate, maximumDate: limit, datePickerMode: .date) { (date) in
            if let dt = date {
                let str = dt.string(format: "yyyy. MM. dd. EEE")
                self.dateBtn.setTitleColor(UIColor.black, for: .normal)
                self.dateBtn.setTitle("\(str)", for: .normal)
            }
        }

    }
    
    
    
    @IBAction func datePickerBtn2(_ sender: Any) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 2
        let limit = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        
        
        DatePickerDialog().show("출발날짜 설정", doneButtonTitle: "확인", cancelButtonTitle: "취소", minimumDate: currentDate, maximumDate: limit, datePickerMode: .date) { (date) in
            if let dt = date {
                let str = dt.string(format: "yyyy. MM. dd. EEE")
                self.dateBtn2.setTitleColor(UIColor.black, for: .normal)
                self.dateBtn2.setTitle("\(str)", for: .normal)
            }
        }
        
    }
   
    
    @IBAction func timePickerBtn(_ sender: Any) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 2
        let limit = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        
        
        DatePickerDialog().show("출발날짜 설정", doneButtonTitle: "확인", cancelButtonTitle: "취소", minimumDate: currentDate, maximumDate: limit, datePickerMode: .time) { (date) in
            if let dt = date {
                let str = dt.string(format: "a hh 시")
                self.timeBtn.setTitleColor(UIColor.black, for: .normal)
                self.timeBtn.setTitle("\(str)", for: .normal)
            }
        }
    }
    
    @IBAction func timePickerBtn2(_ sender: Any) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 2
        let limit = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        
        
        DatePickerDialog().show("출발날짜 설정", doneButtonTitle: "확인", cancelButtonTitle: "취소", minimumDate: currentDate, maximumDate: limit, datePickerMode: .time) { (date) in
            if let dt = date {
                let str = dt.string(format: "a hh 시")
                self.timeBtn2.setTitleColor(UIColor.black, for: .normal)
                self.timeBtn2.setTitle("\(str)", for: .normal)
            }
        }
    }
    
    
    //search
    
    @IBAction func startSearchBtn(_ sender: Any) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        purposeBtn.contentHorizontalAlignment = .right
        startBtn.contentHorizontalAlignment = .right
        endBtn.contentHorizontalAlignment = .right
        dateBtn.contentHorizontalAlignment = .left
        timeBtn.contentHorizontalAlignment = .left
        startBtn2.contentHorizontalAlignment = .right
        endBtn2.contentHorizontalAlignment = .right
        dateBtn2.contentHorizontalAlignment = .left
        timeBtn2.contentHorizontalAlignment = .left
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
        
        
        
    
        if segue.identifier == "startRoundSegue"{
            
            if let destination = segue.destination as? UINavigationController{
                let table = destination.viewControllers.first as! RegionSearchTableViewController
                table.flag = 1
            }
        }
        if segue.identifier == "endRoundSegue"{
            
            if let destination = segue.destination as? UINavigationController{
                let table = destination.viewControllers.first as! RegionSearchTableViewController
                table.flag = 2
            }
        }

    }
    

}
