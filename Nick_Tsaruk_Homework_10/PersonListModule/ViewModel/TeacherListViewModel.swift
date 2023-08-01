import Foundation

enum TeachersViewModelState {
    case ViewTeachers
    case AddTeacherToStudent
}


final class TeacherListViewModel: PersonListViewModelProtocol {
    
    var reloadTable: Observable<Bool> = Observable(false)
    weak var coordinator: PersonCoordinator?
    var updateClosure: (() -> Void)?
    var viewTitle: Observable<String> = Observable(nil)
    var entityArray: [TeacherModel] = [] {
        didSet {
            updateClosure?()
        }
    }
    
    var state: TeachersViewModelState
    
    init (state: TeachersViewModelState) {
        self.state = state
    }
    
    func loadInfo() {
        DispatchQueue.main.async {
            self.entityArray = CoreDataService.getTeachers()
            if self.reloadTable.value == false {
                self.coordinator?.update.bind { update in
                    self.reloadTable.value = true
                }
            }
        }
    }
    
    func rowCount() -> Int {
        return entityArray.count
    }
    
    func setTitle() {
        self.viewTitle.value = "Teachers"
    }
    func switchToAddEntity() {
        switch state {
            case .ViewTeachers:
                self.coordinator?.showAddTeacher(state: .ViewTeachers)
            case .AddTeacherToStudent:
                self.coordinator?.showAddTeacher(state: .AddTeacherToStudent)
        }
        
    }
    func cellData(index: Int) -> NSAttributedString {
        let cellDataString = TextDecoration.getDecoratedString(firstWord: entityArray[index].name, secondWordString: entityArray[index].lastname, style: TextDecorationVariant.list)
        return cellDataString
    }
    func removeEntity(index: Int) {
        DispatchQueue.main.async {
            let request = Teacher.fetchRequest()
            let teachers = try? CoreDataService.context.fetch(request)
            guard let teachers = teachers else { return }
            CoreDataService.context.delete(teachers[index])
            CoreDataService.saveContext()
        }
        entityArray.remove(at: index)
    }
    func selectEntity(index: Int) {
        switch state {
            case .ViewTeachers:
                coordinator?.showTeacherDetails(teacherId: index)
            case .AddTeacherToStudent:
                coordinator?.popToStudents(teacher: entityArray[index], teacherId: index)
        }
    }
}
