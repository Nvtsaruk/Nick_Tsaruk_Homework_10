import UIKit

final class MainViewController: UIViewController {
    
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

