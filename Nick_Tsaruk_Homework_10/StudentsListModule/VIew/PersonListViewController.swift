//
//  StudentsListViewController.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 21.07.23.
//

import UIKit

class PersonListViewController: UIViewController {
    var viewModel: PersonListViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func testbutton(_ sender: Any) {
        viewModel?.switchToStudents()
    }
}
