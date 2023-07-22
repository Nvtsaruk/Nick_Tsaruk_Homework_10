import Foundation
protocol AddStudentViewModelProtocol: AnyObject {
    func addStudent(name: String, age: Int16, teacher: Teacher?)
    func addTeacher()
}

class AddStudentViewModel: AddStudentViewModelProtocol {
  
    
    weak var coordinator: PersonCoordinator?
    
    func addStudent(name: String, age: Int16, teacher: Teacher?) {
        let context = CoreDataService.context
        context.perform {
            let newStudent = Student(context: context)
            newStudent.name = name
            newStudent.age = age
            newStudent.teacher = teacher
            CoreDataService.saveContext()
        }
        coordinator?.popToPrevious()
    }
    
    func addTeacher() {
        
    }
}
