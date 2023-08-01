import Foundation

protocol TeacherDetailViewModelProtocol {
    func rowCount() -> Int
    func cellData(index: Int) -> NSAttributedString
    func getStudents()
    func getTeachers()
    var teacher: [TeacherModel] { get set }
}

final class TeacherDetailViewModel: TeacherDetailViewModelProtocol {
    weak var coordinator: PersonCoordinator?
    var studentsArray: [StudentModel] = [] {
        didSet {
            
        }
    }
    var teacherId: Int
    var teacher: [TeacherModel] = []
    
    init(teacherId: Int) {
        self.teacherId = teacherId
    }
    
    func getTeachers() {
        studentsArray = CoreDataService.getStudentsArray(index: teacherId)
    }
    func getStudents() {
//        studentsArray = teacher.studentsArray.allObjects
        
        
    }
    func rowCount() -> Int {
        return studentsArray.count
    }
    func cellData(index: Int) -> NSAttributedString {
        let cellDataString = TextDecoration.getDecoratedString(firstWord: studentsArray[index].name, secondWordInt: studentsArray[index].age, style: .list)
        return cellDataString
    }
    
}
