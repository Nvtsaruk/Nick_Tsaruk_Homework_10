import UIKit

class PersonCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
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
    func test() {
        print("Person")
    }
}
