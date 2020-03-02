//
//  EmployeeListTableViewController.swift
//  SU_IOS_LEARN
//
//  Created by AI Apple on 2/3/2563 BE.
//  Copyright © 2563 siamu. All rights reserved.
//

import UIKit
import MBProgressHUD
import AlamofireImage

class EmployeeListTableViewController: UITableViewController {
    
    var employeeList:[EmployeeModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(notificationReciver(_:)), name: NSNotification.Name(rawValue: GET_EMPLOYEE_LIST), object: nil)
        MBProgressHUD.showAdded(to: self.view, animated: true)
        APIRequest.sharedInstance.getEmployeeList()
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.employeeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let user = self.employeeList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeecell", for: indexPath) as! EmployeeTableViewCell
        cell.lbl_Id.text = user.id
        cell.lbl_Name.text = String(format: "%@ %@", user.first_name,user.last_name)
        cell.lbl_Email.text = user.email
        
        if let url = URL(string: user.avatar){
            cell.imv_Avatar.af_setImage(withURL: url, placeholderImage: UIImage(named: "user"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
        }
       
        return cell
        
    }
    
    //MARK: - Notificaiton Delagate
    @objc func notificationReciver(_ notification: NSNotification) {
        if(notification.name.rawValue == GET_EMPLOYEE_LIST){
            MBProgressHUD.hide(for: self.view, animated: true)
            let userInfo : NSDictionary = (notification as NSNotification).userInfo! as NSDictionary
            
            if  userInfo.stringWithKey("status") == "S" {
                
                let result : NSArray = userInfo["result"] as! NSArray
                let data = try? JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                self.employeeList = [EmployeeModel](data: data!);
                
                self.tableView.reloadData()
            } else {
                
                let alert = UIAlertController(title: "Message Alert!", message:  userInfo.stringWithKey("result"), preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                    
                }))
                
                self.present(alert, animated: true, completion: nil)
                
                
            }
        }
        
    }
}
