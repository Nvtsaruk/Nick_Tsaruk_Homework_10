import Foundation

protocol TeacherDetailViewModelProtocol {
    func rowCount() -> Int
    func cellData(index: Int) -> NSAttributedString
    func getStudentsArray()
    var teacher: TeacherModel { get set }
}

final class TeacherDetailViewModel: TeacherDetailViewModelProtocol {
    //MARK: - Variables
    weak var coordinator: PersonCoordinator?
    var studentsArray: [StudentModel] = []
    var teacherId: Int
    var teacher: TeacherModel
    
    init(teacher: TeacherModel, teacherId: Int) {
        self.teacherId = teacherId
        self.teacher = teacher
    }
    
    func getStudentsArray() {
        studentsArray = CoreDataService.getStudentsArray(index: teacherId)
    }
    
    func rowCount() -> Int {
        return studentsArray.count
    }
    
    func cellData(index: Int) -> NSAttributedString {
        let cellDataString = TextDecoration.getDecoratedString(firstWord: studentsArray[index].name, secondWordInt: studentsArray[index].age, style: .list)
        return cellDataString
    }
    
}
