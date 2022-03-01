//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

struct Contact {
    var firstName: String
    var lastName: String
    var phoneNumber: String
}

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        return label
    }()
    
    private let phoneNumberLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.font = label.font.withSize(12)
        return label
    }()
    
    private let VStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()
    
    func configure(using contact: Contact) {
        nameLabel.text = contact.firstName + " " + contact.lastName
        phoneNumberLabel.text = contact.phoneNumber
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(VStack)
        VStack.addArrangedSubview(nameLabel)
        VStack.addArrangedSubview(phoneNumberLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        VStack.frame = bounds
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class MyViewController : UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        return tableView
    }()
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        self.view = view
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}
extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.configure(using: Contact(firstName: "Michael", lastName: "Amiro", phoneNumber: "0706664400"))
        return cell
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
