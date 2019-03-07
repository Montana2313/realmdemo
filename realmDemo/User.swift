//
//  User.swift
//  realmDemo
//
//  Created by Özgür  Elmaslı on 6.03.2019.
//  Copyright © 2019 Özgür  Elmaslı. All rights reserved.
//

import Foundation
import RealmSwift

class Users : Object
{
    @objc dynamic var username : String?
    @objc dynamic var email : String?
    @objc dynamic var password : String?
    @objc dynamic var password2 : String?
}
