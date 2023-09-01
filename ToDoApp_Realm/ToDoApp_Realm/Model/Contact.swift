//
//  Contact.swift
//  ToDoApp_Realm
//
//  Created by Govind Sen on 01/09/23.
//

import Foundation
import RealmSwift

class Contact: Object {
    @Persisted var firstname: String
    @Persisted var lastname: String
    
    convenience init(firstname: String, lastname: String) {
        self.init()
        self.firstname = firstname
        self.lastname = lastname
    }
}
