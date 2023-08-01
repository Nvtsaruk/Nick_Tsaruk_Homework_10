import Foundation
protocol AddStudentViewModelProtocol: AnyObject {
    func addStudent(name: String, age: Int16)
    func addTeacher()
    var teacherId: Int { get set }
    var teacher: TeacherModel { get set }
    var updateClosure: (() -> Void)? { get set }
}

final class AddStudentViewModel: AddStudentViewModelProtocol {
    //MARK: - Variables
    weak var coordinator: PersonCoordinator?
    var teacherId: Int = 0
    var teacher: TeacherModel = TeacherModel(name: "", lastname: "", studentsArray: NSSet()) {
        didSet {
            updateClosure?()
        }
    }
    var updateClosure: (() -> Void)?
    func addStudent(name: String, age: Int16) {
        CoreDataService.saveStudent(name: name, age: age, teacherId: teacherId)
        coordinator?.popToPrevious()
    }
    
    func addTeacher() {
        coordinator?.showTeachers(state: TeachersViewModelState.AddTeacherToStudent)
    }
    
}
