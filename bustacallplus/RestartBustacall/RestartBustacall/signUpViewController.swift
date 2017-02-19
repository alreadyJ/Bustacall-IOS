//
//  signUpViewController.swift
//  RestartBustacall
//
//  Created by JongMinKim on 2/10/17.
//  Copyright © 2017 JongMinKim. All rights reserved.
//

import UIKit

class signUpViewController: UIViewController {
    @IBOutlet weak var nickNameText: UITextField!

    @IBOutlet weak var phoneNumText: UITextField!
    
    @IBOutlet weak var verifyText: UITextField!
    
    @IBOutlet weak var duplicateBtn: UIButton!
    
    @IBOutlet weak var requestNumBtn: UIButton!
    
    @IBOutlet weak var loginCompleteBtn: UIButton!
    
    @IBAction func backBtnInsignView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layerChange(nickNameText)
        layerChange(phoneNumText)
        layerChange(verifyText)
        BtnChange(duplicateBtn)
        BtnChange(requestNumBtn)
        BtnChange(loginCompleteBtn)
        setNavigation()
    }
    
    func layerChange(_ textField: UITextField) {
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0).cgColor
    }
    
    func BtnChange(_ btn: UIButton) {
        btn.layer.cornerRadius = 5
    }
    
    func setNavigation() {
        let bar:UINavigationBar! = self.navigationController?.navigationBar
        bar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
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
