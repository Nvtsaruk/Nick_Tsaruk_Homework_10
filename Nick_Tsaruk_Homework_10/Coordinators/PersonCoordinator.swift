import UIKit

class PersonCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var update: Observable<Bool> = Observable(false)
    weak var parentCoordinator: ApplicationCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var updateClosure: (() -> Void)?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        
    }
    
    func showStudents() {
        let storyboard = UIStoryboard(name: "PersonListStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PersonListViewController") as? PersonListViewController else { return }
        navigationController.delegate = self
        let viewModel = StudentListViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    func showTeachers(state: TeachersViewModelState) {
        let storyboard = UIStoryboard(name: "PersonListStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PersonListViewController") as? PersonListViewController else { return }
        navigationController.delegate = self
        let viewModel = TeacherListViewModel(state: state)
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddStudent() {
        let storyboard = UIStoryboard(name: "AddStudentStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AddStudentViewController") as? AddStudentViewController else { return }
        navigationController.delegate = self
        let viewModel = AddStudentViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showStudentDetails(student: StudentModel) {
        let storyboard = UIStoryboard(name: "StudentDetailStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "StudentDetailViewController") as? StudentDetailViewController else { return }
        navigationController.delegate = self
        let viewModel = StudentDetailsViewModel(student: student)
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showTeacherDetails(teacherId: Int) {
        let storyboard = UIStoryboard(name: "TeacherDetailStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "TeacherDetailViewController") as? TeacherDetailViewController else { return }
        navigationController.delegate = self
        let viewModel = TeacherDetailViewModel(teacherId: teacherId)
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showAddTeacher(state: TeachersViewModelState) {
        let storyboard = UIStoryboard(name: "AddTeacherStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "AddTeacherViewController") as? AddTeacherViewController else { return }
        navigationController.delegate = self
        let viewModel = AddTeacherViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }

    func popToPrevious() {
        self.update.value = true
        updateClosure?()
        navigationController.popToViewController(navigationController.viewControllers[1], animated: true)
    }
    func popToStudents(teacher: TeacherModel, teacherId: Int) {
        self.update.value = true
        let vc = navigationController.viewControllers[2] as? AddStudentViewController
        vc?.viewModel?.teacherId = teacherId
        vc?.viewModel?.teacher = teacher
        navigationController.popToViewController(navigationController.viewControllers[2], animated: true)
    }
    func popToTeachers() {
        navigationController.popToViewController(navigationController.viewControllers[3], animated: true)
    }
}
