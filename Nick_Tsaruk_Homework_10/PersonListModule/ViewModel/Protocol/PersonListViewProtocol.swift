import Foundation
protocol PersonListViewModelProtocol: AnyObject {
    func loadInfo()
    func setTitle()
    func rowCount() -> Int
    func cellData(index: Int) -> NSAttributedString
    func switchToAddEntity()
    func removeEntity(index: Int)
    func selectEntity(index: Int)
    var reloadTable: Observable<Bool> { get set }
    var viewTitle: Observable<String> { get set }
    var updateClosure: (() -> Void)? { get set }
}
