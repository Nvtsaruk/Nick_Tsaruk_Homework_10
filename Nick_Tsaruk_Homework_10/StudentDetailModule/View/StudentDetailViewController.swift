import UIKit

final class StudentDetailViewController: UIViewController {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var ageLabel: UILabel!
    @IBOutlet private weak var teacherLabel: UILabel!
    
    var viewModel: StudentDetailsViewModelProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadUI()
    }
    

    private func loadUI() {
        let name = TextDecoration.getDecoratedString(firstWord: "Name: ",secondWordString: viewModel?.student.name, style: .details)
        let age = TextDecoration.getDecoratedString(firstWord: "Age: ",secondWordInt: viewModel?.student.age, style: .details)
        let teacherFullName = (viewModel?.student.teacher.name ?? "") + " " + (viewModel?.student.teacher.lastname ?? "")
        let teacher = TextDecoration.getDecoratedString(firstWord: "Teacher: ",secondWordString: teacherFullName, style: .details)
        nameLabel.attributedText = name
        ageLabel.attributedText = age
        teacherLabel.attributedText = teacher
    }
    
}
