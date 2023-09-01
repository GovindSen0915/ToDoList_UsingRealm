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
        let alertController = UIAlertController(title: "Add Contact", message: "Enter your contact details", preferredStyle: .alert)
        let save = UIAlertAction(title: "Save", style: .default) { _ in
            if let firstname = alertController.textFields?.first?.text,
               let lastname = alertController.textFields?[1].text {
                let contact = Contact(firstname: firstname, lastname: lastname)
                self.contactArray.append(contact)
                self.contactTableView.reloadData()
            }
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addTextField { firstnameField in
            firstnameField.placeholder = "Enter your first name"
        }
        
        alertController.addTextField { lastnameField in
            lastnameField.placeholder = "Enter your last name"
        }
        
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    

}

extension ViewController {
    func configuration() {
        contactTableView.dataSource = self
        contactTableView.delegate = self
        contactTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
            let alertController = UIAlertController(title: "Update Contact", message: "Update your contact details", preferredStyle: .alert)
            let save = UIAlertAction(title: "Save", style: .default) { _ in
                if let firstname = alertController.textFields?.first?.text,
                   let lastname = alertController.textFields?[1].text {
                    let contact = Contact(firstname: firstname, lastname: lastname)
//                    self.contactArray.append(contact)
                    self.contactArray[indexPath.row] = contact
                    self.contactTableView.reloadData()
                }
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            alertController.addTextField { firstnameField in
                firstnameField.placeholder = self.contactArray[indexPath.row].firstname
            }
            
            alertController.addTextField { lastnameField in
                lastnameField.placeholder = self.contactArray[indexPath.row].lastname
            }
            
            alertController.addAction(save)
            alertController.addAction(cancel)
            
            self.present(alertController, animated: true)
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

