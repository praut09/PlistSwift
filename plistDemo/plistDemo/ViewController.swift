//
//  ViewController.swift
//  plistDemo
//
//  Created by sachin shinde on 02/01/20.
//  Copyright © 2020 sachin shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tblViewUserData: UITableView!
    @IBOutlet var signUpbtn: UIButton!
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    var keysArray = NSMutableArray()
    var valueArray = NSMutableArray()
    var plistData: [String: AnyObject] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        readPropertyList()
    }

    func getPath() -> String {
          let plistPath: String? = Bundle.main.path(forResource: "data", ofType: "plist")! //the path of the data
      let plistXML = FileManager.default.contents(atPath: plistPath!)!
        return plistPath!
    }
    
    @IBAction func signUpbtnClicked(_ sender: Any) {
        let plistPath = self.getPath()

        if FileManager.default.fileExists(atPath: plistPath) {
               let nationAndCapitalCitys = NSMutableDictionary(contentsOfFile: plistPath)!
               nationAndCapitalCitys.setValue(txtUsername.text!, forKey: txtPassword.text!)
               nationAndCapitalCitys.write(toFile: plistPath, atomically: true)
        }
            readPropertyList()
       
     //   keysArray.removeAllObjects()
     //   valueArray.removeAllObjects()
           txtUsername.text = ""
           txtPassword.text = ""
           
    }
    
    func readPropertyList() {
        var propertyListFormat =  PropertyListSerialization.PropertyListFormat.xml //Format of the Property List.
         //Our data
        let plistPath = self.getPath() //the path of the data
        let plistXML = FileManager.default.contents(atPath: plistPath)!
        if let nationAndCapitalCitys = NSMutableDictionary(contentsOfFile: plistPath) {
            keysArray.removeAllObjects()
            valueArray.removeAllObjects()

            for (_, element) in nationAndCapitalCitys.enumerated() {
               // self.textView.text = self.textView.text + "\(element.key) --> \(element.value) \n"

                keysArray.add(element.key)
                valueArray.add(element.value)
            }
        }
   print(plistData)
         tblViewUserData.reloadData()
        
    }
    
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        keysArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDataTableViewCell", for: indexPath) as! UserDataTableViewCell
        cell.lblUserName.text = valueArray[indexPath.row] as? String
        cell.lblPassword.text = keysArray[indexPath.row] as? String
//        keysArray.removeAllObjects()
//        valueArray.removeAllObjects()
     //   cell.lblPassword.text = plistData[txtUsername.text!] as? String
        
        return cell
    }
    
}
