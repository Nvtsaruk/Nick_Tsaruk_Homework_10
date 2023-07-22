import UIKit

class PersonCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var update:Bool?
    weak var parentCoordinator: ApplicationCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
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
    func showTeachers() {
        let storyboard = UIStoryboard(name: "PersonListStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "PersonListViewController") as? PersonListViewController else { return }
        navigationController.delegate = self
        let viewModel = TeacherListViewModel()
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
    
    func popToPrevious() {
        navigationController.viewControllers.remove(at: navigationController.viewControllers.count-1)
        navigationController.viewControllers.remove(at: navigationController.viewControllers.count-1)
        let storyboard = UIStoryboard(name: "PersonListStoryboard", bundle: nil)
        guard let vcPerson = storyboard.instantiateViewController(withIdentifier: "PersonListViewController") as? PersonListViewController else { return }
        navigationController.delegate = self
        let viewModel = StudentListViewModel()
        viewModel.coordinator = self
        vcPerson.viewModel = viewModel
        navigationController.viewControllers.append(vcPerson)
        guard let vc = navigationController.viewControllers.last as? PersonListViewController else { return }
        navigationController.popToViewController(vc, animated: true)
    }
    func test() {
        print("Person")
    }
}
