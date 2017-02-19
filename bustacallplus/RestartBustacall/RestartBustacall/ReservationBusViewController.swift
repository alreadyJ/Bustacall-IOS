//
//  ReservationBusViewController.swift
//  RestartBustacall
//
//  Created by JongMinKim on 2/10/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

import UIKit

class ReservationBusViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBAction func changeedIndex(_ sender: Any) {
        
     
        
    }
    @IBAction func completeReservation(_ sender: Any) {
        self.performSegue(withIdentifier: "completeSegue", sender: self)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view.
        
        //burger side bar menu
        if revealViewController() != nil {
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        setupView()
    }
    
    
    private func setupView() {
        setupSegmentedControl()
        updateView()
    }
    
    private func setupSegmentedControl() {
        // Configure Segmented Control
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: "왕복", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "편도", at: 1, animated: false)
        segmentControl.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
        
        // Select First Segment
        segmentControl.selectedSegmentIndex = 0
    }
    
    func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private lazy var ReservationRoundTableViewController: ReservationRoundTableViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ReservationRound") as! ReservationRoundTableViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private lazy var ReservationOneWayTableViewController: ReservationOneWayTableViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "ReservationOneway") as! ReservationOneWayTableViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChildViewController(viewController)
        
        // Add Child View as Subview
        //view.addSubview(viewController.view)
        
        containerView.addSubview(viewController.view)
        
        // Configure Child View
        
        if segmentControl.selectedSegmentIndex == 0 {
            let x:CGFloat = containerView.bounds.origin.x
            let y:CGFloat = containerView.bounds.origin.y
            let width:CGFloat = containerView.bounds.width
            let height:CGFloat = containerView.bounds.height
            viewController.view.frame = CGRect(x: x, y: y - 68, width: width, height: height + 68)
        }else {
            viewController.view.frame = containerView.bounds
        }
        
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    private func updateView() {
        if segmentControl.selectedSegmentIndex == 0 {
            remove(asChildViewController: ReservationOneWayTableViewController)
            add(asChildViewController: ReservationRoundTableViewController)
        } else {
            remove(asChildViewController: ReservationRoundTableViewController)
            add(asChildViewController: ReservationOneWayTableViewController)
        }
    }

    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
