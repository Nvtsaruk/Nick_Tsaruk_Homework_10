import CoreData


final class CoreDataService {
    
    static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    static private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Nick_Tsaruk_Homework_10")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error),  \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(error),  \(nserror.userInfo)")
            }
        }
    }
    static func getStudents() -> [StudentModel] {
        var studentsArray: [StudentModel] = []
        let request = Student.fetchRequest()
        let students = try? CoreDataService.context.fetch(request)
        guard let students = students else { return [] }
        students.forEach { student in
            guard let teacherStudents = student.teacher?.students else { return }
            studentsArray.append(StudentModel(name: student.name ?? "", age: student.age, teacher: TeacherModel(name: student.teacher?.name ?? "", lastname: student.teacher?.lastname ?? "", studentsArray: teacherStudents)))
        }
        return studentsArray
    }
    static func getTeachers() -> [TeacherModel] {
        var teachersArray: [TeacherModel] = []
        let request = Teacher.fetchRequest()
        let teachers = try? CoreDataService.context.fetch(request)
        guard let teachers = teachers else { return [] }
        teachers.forEach { teacher in
            teachersArray.append(TeacherModel(name: teacher.name ?? "", lastname: teacher.lastname ?? "", studentsArray: teacher.students))
        }
        return teachersArray
    }
    static func getStudentsArray(index: Int) -> [StudentModel] {
        var studentsArray: [StudentModel] = []
        let request = Teacher.fetchRequest()
        let teachers = try? CoreDataService.context.fetch(request)
        for student in teachers?[index].students as! Set<Student> {
            studentsArray.append(StudentModel(name: student.name ?? "", age: student.age, teacher: TeacherModel(name: student.teacher?.name ?? "", lastname: student.teacher?.lastname ?? "", studentsArray: student.teacher?.students ?? NSSet())))
        }
        return studentsArray
        
    }
    static func saveStudent(name: String, age: Int16, teacherId: Int) {
        context.performAndWait {
            let newStudent = Student(context: context)
            newStudent.name = name
            newStudent.age = age
            let request = Teacher.fetchRequest()
            let teachers = try? CoreDataService.context.fetch(request)
            guard let teachers  = teachers else { return }
            newStudent.teacher = teachers[teacherId]
//            teachers[teacherId].students?.adding(newStudent)
//            teachers[teacherId].addToStudents(newStudent)
            CoreDataService.saveContext()
        }
    }
}

