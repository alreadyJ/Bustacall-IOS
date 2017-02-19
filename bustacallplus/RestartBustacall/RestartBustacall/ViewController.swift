//
//  ViewController.swift
//  RestartBustacall
//
//  Created by JongMinKim on 2/10/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func loginBtnClick(_ sender: Any) {
        self.performSegue(withIdentifier: "autoLoginSegue", sender: self)
        
    }
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginBtn.layer.cornerRadius = 3
   }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

