//
//  ViewController.swift
//  realmDemo
//
//  Created by Özgür  Elmaslı on 6.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var tableview: UITableView!
    var arrays = [String]()
    var user1 = Users()
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
         // just for error handling
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
        // for find our realm path
        // print will throw some information about our database path on output side
        // you need to take copy and open the terminawl
        // write
        // open paste you took copy
        
         // Add some users
        /*
        let newUser = Users()
        newUser.email = "ozge@gmail.com"
        newUser.username = "ozge"
        newUser.password = "ozgurelmasli"
        newUser.password2 = "ozgurelmasli"
 
       try! realm.write {
            // save ,delete , update
            realm.add(newUser)
        }
        
        
        */
       // let results =  realm.objects(Users.self) // sending an array
       // print(results[1].email)
       // let results = realm.objects(Users.self).filter("password = '1234abcd1234'").sorted(byKeyPath: "username")
        //print(results)
        
        let results  = realm.objects(Users.self)
        for item in results
        {
            arrays.append(item.username!)
        }
        
        
        tableview.delegate = self
        tableview.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (arrays.count > 0 )
        {
            return arrays.count
        }
        else
        {
            return 10
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            user1 = realm.objects(Users.self).filter{ $0.username ==  self.arrays[indexPath.row]}.first!
            try! realm.write {
                realm.delete(user1)
            }
            arrays.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showinfo"
        {
            let destinationVC = segue.destination as! InfoViewController
            destinationVC.label_text = user1.username!
            destinationVC.label_text1 = user1.email!
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = UITableViewCell()
       
        if(arrays.count > 0)
        {
            cell.textLabel?.text = arrays[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = "Çekilen bir değer yok"
        }
       return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        user1 = realm.objects(Users.self).filter{ $0.username ==  self.arrays[indexPath.row]}.first!
        performSegue(withIdentifier: "showinfo", sender: nil)
    }
    
    


}

