//
//  ViewController.swift
//  ToDoApp_Realm
//
//  Created by Govind Sen on 01/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var contactTableView: UITableView!
    
    var contactArray = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    
    @IBAction func addContactButtonTapped(_ sender: UIBarButtonItem) {
        contactConfiguration(isAdd: true, index: 0)
    }
    

}

extension ViewController {
    func configuration() {
        contactTableView.dataSource = self
        contactTableView.delegate = self
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        contactArray = DatabaseHelper.shared.getAllContacts()
    }
    
    func contactConfiguration(isAdd: Bool, index: Int) {
        let alertController = UIAlertController(title: isAdd ? "Add Contact" : "Update Contact", message: isAdd ? "Enter your contact details" : "Update your contact details", preferredStyle: .alert)
        let save = UIAlertAction(title: isAdd ? "Save" : "Update ", style: .default) { _ in
            if let firstname = alertController.textFields?.first?.text,
               let lastname = alertController.textFields?[1].text {
                
                let contact = Contact(firstname: firstname, lastname: lastname)
                
                if isAdd {
                    self.contactArray.append(contact)
                    DatabaseHelper.shared.saveContact(contact: contact)
                } else {
                    self.contactArray[index] = contact
                }
                
                self.contactTableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addTextField { firstnameField in
            firstnameField.placeholder = isAdd ? "Enter your first name" : self.contactArray[index].firstname
        }
        
        alertController.addTextField { lastnameField in
            lastnameField.placeholder = isAdd ? "Enter your last name" : self.contactArray[index].lastname
        }
        
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard var cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = contactArray[indexPath.row].firstname
        cell.detailTextLabel?.text = contactArray[indexPath.row].lastname
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { _, _, _ in
        self.contactConfiguration(isAdd: false, index: indexPath.row)
        }
        edit.backgroundColor = UIColor.systemMint

        let delete = UIContextualAction(style: .destructive, title: "delete") { _, _, _ in
            self.contactArray.remove(at: indexPath.row)
            self.contactTableView.reloadData()
        }

        let swipeConfiguration = UISwipeActionsConfiguration(actions: [delete, edit])
        return swipeConfiguration
    }
}

