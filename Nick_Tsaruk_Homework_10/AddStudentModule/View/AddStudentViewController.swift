//
//  AddStudentViewController.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 22.07.23.
//

import UIKit

class AddStudentViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var chooseTeacherButtonOutlet: UIButton!
    @IBOutlet weak var saveButtonOutlet: UIButton!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    
    //MARK: - Variables
    
    var viewModel: AddStudentViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }
    //MARK: - SetupUI
    
    private func setupUI(){
        chooseTeacherButtonOutlet.layer.borderColor = UIColor.purple.cgColor
        chooseTeacherButtonOutlet.layer.borderWidth = 1
    }
    //MARK: - IBAction
    @IBAction func chooseTeacherAction(_ sender: Any) {
        viewModel?.addTeacher()
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        viewModel?.addStudent(name: nameTextField.text ?? "", age: Int16(ageTextField.text ?? "") ?? 0)
    }
    private func bindViewModel() {
        viewModel?.updateClosure = { [weak self] in
            let label = ("Selected: \(self?.viewModel?.teacher.name ?? "") \(self?.viewModel?.teacher.lastname ?? "")")
            self?.chooseTeacherButtonOutlet.setTitle(label, for: .normal)
        }
    }
}
