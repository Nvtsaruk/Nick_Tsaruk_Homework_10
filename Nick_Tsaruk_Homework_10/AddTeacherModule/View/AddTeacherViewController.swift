//
//  AddStudentViewController.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 22.07.23.
//

import UIKit

class AddTeacherViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    
    //MARK: - Variables
    
    var viewModel: AddTeacherViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //MARK: - IBAction

    @IBAction func saveButtonAction(_ sender: Any) {
        viewModel?.addTeacher(name: nameTextField.text ?? "", lastname: lastnameTextField.text ?? "")
    }
}
