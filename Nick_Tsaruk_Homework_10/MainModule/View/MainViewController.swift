//
//  ViewController.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 21.07.23.
//

import UIKit

class MainViewController: UIViewController {

    var viewModel: MainViewModelProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: -IBAction
    
    @IBAction func studentsButtonAction(_ sender: Any) {
        viewModel?.switchToStudents()
    }
    @IBAction func teachersButtonAction(_ sender: Any) {
        viewModel?.switchToTeachers()
    }
    
}

