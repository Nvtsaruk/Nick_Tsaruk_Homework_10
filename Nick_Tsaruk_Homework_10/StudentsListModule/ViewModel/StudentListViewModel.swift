import Foundation

class StudentListViewModel: PersonListViewModelProtocol {
    var reloadTable: Observable<Bool> = Observable(nil)
    
    weak var coordinator: PersonCoordinator?
    var viewTitle: Observable<String> = Observable(nil)
    var entityArray: Observable<[PersonModel]> = Observable(nil)
    
    func loadInfo() {
        let request = Student.fetchRequest()
        let students = try? CoreDataService.context.fetch(request)
        var studentsArray: [PersonModel] = []
        students?.forEach { student in
            studentsArray.append(PersonModel(name: student.name ?? "", lastname: "", age: student.age, teacher: student.teacher, studentsArray: nil))
        }
        entityArray.value = studentsArray
        
    }
    func reloadTableV() {
        self.loadInfo()
    }
    func setTitle() {
        self.viewTitle.value = "Students"
    }
    func switchToAddEntity() {
        self.coordinator?.showAddStudent()
    }
    func removeEntity(index: Int) {
//        func addStudent(name: String, age: Int16, teacher: Teacher?) {
            let context = CoreDataService.context
        let studentToDelete = Student(context: context)
        studentToDelete.name = entityArray.value?[index].name
        studentToDelete.age = entityArray.value?[index].age ?? 0
        context.delete(studentToDelete)
        CoreDataService.saveContext()
        entityArray.value?.remove(at: index)
//        let
//        context.delete()
//            context.perform {
//                let newStudent = Student(context: context)
//
//                CoreDataService.saveContext()
//            }
//            coordinator?.popToPrevious()
//        }
        print(entityArray.value?[index].name)
    }
    
}
