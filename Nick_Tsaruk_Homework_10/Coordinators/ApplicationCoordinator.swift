import Foundation
import UIKit

final class ApplicationCoordinator:NSObject, Coordinator, UINavigationControllerDelegate {
    var updateClosure: (() -> Void)?
    
    var update: Observable<Bool> = Observable(false)
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "MainViewControllerStoryboard", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { return }
        navigationController.delegate = self
        let viewModel = MainViewModel()
        viewModel.coordinator = self
        vc.viewModel = viewModel
        navigationController.pushViewController(vc, animated: true)
    }
    
    func showStudentsList() {
        let child = PersonCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.showStudents()
    }
    
    func showTeachersList() {
        let child = PersonCoordinator(navigationController: navigationController)
        childCoordinators.append(child)
        child.parentCoordinator = self
        child.showTeachers(state: TeachersViewModelState.ViewTeachers)
    }
}
