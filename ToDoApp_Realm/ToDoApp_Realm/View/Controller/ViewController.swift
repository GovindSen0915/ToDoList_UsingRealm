//
//  ViewController.swift
//  ToDoApp_Realm
//
//  Created by Govind Sen on 01/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var contactTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configuration()
    }
    @IBAction func addContactButtonTapped(_ sender: UIBarButtonItem) {
    }
    

}

extension ViewController {
    func configuration() {
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

