import UIKit

final class PersonListViewController: UIViewController {
    
    //MARK: - IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    
    var viewModel: PersonListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        //MARK: - tableView setup
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
        
        let longTap = UILongPressGestureRecognizer(target: self, action: #selector(didLongTap(_:)))
        tableView.addGestureRecognizer(longTap)
        viewModel?.setTitle()
        viewModel?.loadInfo()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEntity(_:)))
        viewModel?.viewTitle.bind { [weak self] viewTitle in
            guard let self = self else { return }
            self.title = viewTitle
        }
        viewModel?.entityArray.bind { [ weak self ] entityArray in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    @objc private func didLongTap(_ sender: UIGestureRecognizer) {
        tableView.isEditing = true
    }
    
    @objc private func addEntity(_ sender: UIButton) {
        viewModel?.switchToAddEntity()
    }

}

extension PersonListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.entityArray.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? TableViewCell else { return UITableViewCell()}
        cell.labelText.attributedText = TextDecoration.getDecoratedString(name: viewModel?.entityArray.value?[indexPath.row].name ?? "", lastname: viewModel?.entityArray.value?[indexPath.row].lastname ?? "", age: viewModel?.entityArray.value?[indexPath.row].age)
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            viewModel?.removeEntity(index: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension PersonListViewController: UITableViewDelegate {
    
}
