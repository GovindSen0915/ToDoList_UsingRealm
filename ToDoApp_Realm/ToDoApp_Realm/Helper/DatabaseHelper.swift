//
//  DatabaseHelper.swift
//  ToDoApp_Realm
//
//  Created by Govind Sen on 01/09/23.
//

import UIKit
import RealmSwift

// Singleton class
class DatabaseHelper {
    static let shared = DatabaseHelper()
    
    private var realm = try! Realm()
    
    func getDatabaseURL() -> URL? {
        return Realm.Configuration.defaultConfiguration.fileURL
    }
    
    func saveContact(contact: Contact) {
        try! realm.write{
            realm.add(contact)
        }
    }
    
    func deleteContact(contact: Contact) {
        try! realm.write {
            realm.delete(contact)
        }
    }
    
    func updateContact(oldContact: Contact, newContact: Contact) {
        try! realm.write {
            oldContact.firstname = newContact.firstname
            oldContact.lastname = newContact.lastname
        }
    }
    
    func getAllContacts() -> [Contact] {
        return Array(realm.objects(Contact.self))
    }
}
