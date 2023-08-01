import Foundation
protocol AddTeacherViewModelProtocol: AnyObject {
    func addTeacher(name: String, lastname: String)
}

class AddTeacherViewModel: AddTeacherViewModelProtocol {
  
    weak var coordinator: PersonCoordinator?
    
    func addTeacher(name: String, lastname: String) {
        let context = CoreDataService.context
        context.perform {
            let newTeacher = Teacher(context: context)
            newTeacher.name = name
            newTeacher.lastname = lastname
            CoreDataService.saveContext()
        }
        coordinator?.popToPrevious()
    }
    
}
