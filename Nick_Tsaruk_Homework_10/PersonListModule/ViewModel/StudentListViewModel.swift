import Foundation

final class StudentListViewModel: PersonListViewModelProtocol {
    
    var reloadTable: Observable<Bool> = Observable(false)
    weak var coordinator: PersonCoordinator?
    var updateClosure: (() -> Void)?
    var viewTitle: Observable<String> = Observable(nil)
    var entityArray: [StudentModel] = [] {
        didSet {
            updateClosure?()
        }
    }
    func loadInfo() {
        DispatchQueue.main.async {
            self.entityArray = CoreDataService.getStudents()
        }
        
    }
    
    func rowCount() -> Int {
        coordinator?.updateClosure = { [weak self] in
            self?.loadInfo()
        }
        return entityArray.count
    }
    
    func cellData(index: Int) -> NSAttributedString {
        let cellDataString = TextDecoration.getDecoratedString(firstWord: entityArray[index].name, secondWordInt: entityArray[index].age, style: TextDecorationVariant.list)
        return cellDataString
    }
    
    func setTitle() {
        self.viewTitle.value = "Students"
    }
    func switchToAddEntity() {
        self.coordinator?.showAddStudent()
    }
    func removeEntity(index: Int) {
        DispatchQueue.main.async {
            let request = Student.fetchRequest()
            let students = try? CoreDataService.context.fetch(request)
            guard let students = students else { return }
            CoreDataService.context.delete(students[index])
            CoreDataService.saveContext()
        }
        entityArray.remove(at: index)
    }
    
    func selectEntity(index: Int) {
        coordinator?.showStudentDetails(student: entityArray[index])
    }
    
}
