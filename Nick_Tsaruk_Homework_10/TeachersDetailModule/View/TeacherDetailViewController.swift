import UIKit

final class TeacherDetailViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    var viewModel: TeacherDetailViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel?.getStudentsArray()
    }
    
    private func setupUI() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "Cell")
        nameLabel.attributedText = TextDecoration.getDecoratedString(firstWord: "Name:", secondWordString: viewModel?.teacher.name, style: .details)
        lastnameLabel.attributedText = TextDecoration.getDecoratedString(firstWord: "Name:", secondWordString: viewModel?.teacher.lastname, style: .details)
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
