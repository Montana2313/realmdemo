//
//  InfoViewController.swift
//  realmDemo
//
//  Created by Özgür  Elmaslı on 7.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import UIKit
import RealmSwift

class InfoViewController: UIViewController {

    @IBOutlet weak var Tf: UITextField!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    var label_text = ""
    var label_text1 = ""
    let realm = try! Realm()
    var user_1 = Users()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = label_text
        label2.text = label_text1
    }

    @IBAction func UpdateButton(_ sender: Any) {
        if Tf.text != ""
        {
            // eğer boş değilses
            // if tf is not null / nil
            user_1 = realm.objects(Users.self).filter{
                $0.username == self.label_text
            }.first!
            try! realm.write {
                user_1.setValue(Tf.text!, forKey: "username")
            }
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            let alert = UIAlertController(title: "Hata", message: "TextField Boş Geçilemez", preferredStyle: UIAlertController.Style.alert)
            let okbutton = UIAlertAction(title: "Tamama", style: UIAlertAction.Style.cancel, handler: nil)
            
            alert.addAction(okbutton)
            
            self.present(alert,animated: true , completion: nil)
        }
    }
}
