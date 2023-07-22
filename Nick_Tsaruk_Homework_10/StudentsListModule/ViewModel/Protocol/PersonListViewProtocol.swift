protocol PersonListViewModelProtocol: AnyObject {
    func loadInfo()
    func setTitle()
    func reloadTableV()
    func switchToAddEntity()
    func removeEntity(index: Int)
    var reloadTable: Observable<Bool> { get set }
    var viewTitle: Observable<String> { get set }
    var entityArray: Observable<[PersonModel]> { get set }
}
