//
//  TeacherListViewModel.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 21.07.23.
//

import Foundation
class TeacherListViewModel: PersonListViewModelProtocol {
    func reloadTableV() {
        
    }
    
    var reloadTable: Observable<Bool> = Observable(nil)
    
    func removeEntity(index: Int) {
        
    }
    
    func switchToAddEntity() {
        
    }
    
    var entityArray: Observable<[PersonModel]> = Observable(nil)
    
    func addEntity(name: String, lastname: String?, age: Int16?) {
        
    }
    
    func loadInfo() {
        
    }
    
    
    
    var viewTitle: Observable<String> = Observable(nil)
    
    weak var coordinator: PersonCoordinator?
    func switchToStudents() {
        
    }
    
    func switchToTeachers() {
        
    }
    
    func setTitle() {
        self.viewTitle.value = "Teachers"
    }
    
    
}
