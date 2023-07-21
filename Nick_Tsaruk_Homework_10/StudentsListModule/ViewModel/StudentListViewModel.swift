//
//  StudentsListViewModel.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 21.07.23.
//

import Foundation
protocol PersonListViewModelProtocol: AnyObject {
    func switchToStudents()
    func switchToTeachers()
}

class StudentListViewModel: PersonListViewModelProtocol {
    weak var coordinator: PersonCoordinator?
    func switchToStudents() {
        print("Students")
    }
    
    func switchToTeachers() {
        
    }
    
    
}
