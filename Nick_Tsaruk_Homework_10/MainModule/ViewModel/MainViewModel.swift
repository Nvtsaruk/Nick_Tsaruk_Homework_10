import Foundation

protocol MainViewModelProtocol: AnyObject {
    func switchToStudents()
    func switchToTeachers()
}

final class MainViewModel: MainViewModelProtocol {
    
    //MARK: - Variables
    weak var coordinator: ApplicationCoordinator?
    func switchToStudents() {
        self.coordinator?.showStudentsList()
    }
    
    func switchToTeachers() {
        self.coordinator?.showTeachersList()
    }
}
