//
//  TeacherDetailViewController.swift
//  Nick_Tsaruk_Homework_10
//
//  Created by Tsaruk Nick on 30.07.23.
//

import UIKit

final class TeacherDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: TeacherDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        viewModel?.getTeachers()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
//        nameLabel.text = viewModel?.teacher.name
//        lastnameLabel.text = viewModel?.teacher.lastname
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension TeacherDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.rowCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        cell.labelText.attributedText = viewModel?.cellData(index: indexPath.row)
        return cell
    }
    
    
}
