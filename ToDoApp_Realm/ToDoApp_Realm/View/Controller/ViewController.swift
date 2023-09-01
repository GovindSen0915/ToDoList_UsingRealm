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
            
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(save)
        alertController.addAction(cancel)
        present(alertController, animated: true)
    }
    

}

extension ViewController {
    func configuration() {
        
    }
}

//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}

