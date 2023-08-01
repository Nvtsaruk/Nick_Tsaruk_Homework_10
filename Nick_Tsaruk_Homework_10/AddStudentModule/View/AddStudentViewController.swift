import UIKit

final class AddStudentViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet private weak var chooseTeacherButtonOutlet: UIButton!
    @IBOutlet private weak var saveButtonOutlet: UIButton!
    
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    
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
    @IBAction private func chooseTeacherAction(_ sender: Any) {
        viewModel?.addTeacher()
    }
    @IBAction private func saveButtonAction(_ sender: Any) {
        viewModel?.addStudent(name: nameTextField.text ?? "", age: Int16(ageTextField.text ?? "") ?? 0)
    }
    private func bindViewModel() {
        viewModel?.updateClosure = { [weak self] in
            let label = ("Selected: \(self?.viewModel?.teacher.name ?? "") \(self?.viewModel?.teacher.lastname ?? "")")
            self?.chooseTeacherButtonOutlet.setTitle(label, for: .normal)
        }
    }
}
