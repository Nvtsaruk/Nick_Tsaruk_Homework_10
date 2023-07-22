import Foundation
import UIKit


class ApplicationCoordinator:NSObject, Coordinator, UINavigationControllerDelegate {
    
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
        child.showTeachers()
    }
    
//    func childDidFinish(_ child: Coordinator?) {
//        for (index, coordinator) in childCoordinators.enumerated() {
//            if coordinator === child {
//                childCoordinators.remove(at: index)
//                break
//            }
//        }
//    }
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
//        // Read the view controller we’re moving from.
//        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
//            return
//        }
//
//        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
//        if navigationController.viewControllers.contains(fromViewController) {
//            return
//        }
//
//        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a buy view controller
//        if let studentListVIewController = fromViewController as? StudentsListViewController {
//            // We're popping a buy view controller; end its coordinator
//            childDidFinish(studentListVIewController.coordinator)
//        }
//    }

}
