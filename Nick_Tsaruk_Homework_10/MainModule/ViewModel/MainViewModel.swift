import Foundation

protocol MainViewModelProtocol: AnyObject {
    func switchToStudents()
    func switchToTeachers()
}

class MainViewModel: MainViewModelProtocol {
    weak var coordinator: ApplicationCoordinator?
    func switchToStudents() {
        self.coordinator?.showStudentsList()
    }
    
    func switchToTeachers() {
        self.coordinator?.showTeachersList()
    }
    
    
}
