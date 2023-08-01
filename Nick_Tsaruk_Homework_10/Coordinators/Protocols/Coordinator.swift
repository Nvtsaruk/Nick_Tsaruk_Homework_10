import UIKit

protocol Coordinator {
    var update: Observable<Bool> { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    var updateClosure: (() -> Void)? { get set }
    func start()
}
