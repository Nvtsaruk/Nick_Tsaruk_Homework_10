import Foundation


protocol StudentDetailsViewModelProtocol {
    var student: StudentModel { get set }
}

final class StudentDetailsViewModel: StudentDetailsViewModelProtocol {
    weak var coordinator: PersonCoordinator?
    var student: StudentModel
    
    init(student: StudentModel) {
        self.student = student
    }
        
}
