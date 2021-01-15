//
//  ViewController.swift
//  animationNav
//
//  Created by Takamiya Kengo on 2021/01/12.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate{
    
    let cellId = "friends"
 
    var friendsList:[String] = []
    
    var openOrClose = false
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let openButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.blue, for: .normal)
//        button.backgroundColor = .black
        button.titleLabel?.font = button.titleLabel?.font.withSize(30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let openview:UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//    let stackV: UIStackView = {
//        let stack = UIStackView()
//        stack.backgroundColor = .lightGray
//            stack.axis = .vertical
//        stack.distribution = .fill
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//
    let stackH: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .orange
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let pic1:UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "joey")
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    let pic2:UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "monica")
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    let pic3:UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "rachel")
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    let pic4:UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "ross")
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    let pic5:UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "chandler")
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    let pic6:UIImageView = {
        let pic = UIImageView()
        pic.image = UIImage(named: "phoebe")
        pic.translatesAutoresizingMaskIntoConstraints = false
        return pic
    }()
    
    let label1:UILabel = {
        let label = UILabel()
        label.text = "Friends"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(40)

        return label
    }()
    
    let label2:UILabel = {
        let label = UILabel()
        label.text = "Add Friend"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(40)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(friendsTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.dataSource = self
               tableView.delegate = self
        
        openview.addSubview(openButton)
//        view.addSubview(stackH)
        openview.addSubview(stackH)
//        view.addSubview(pic1)
//        view.addSubview(pic2)
//        view.addSubview(pic3)
//        view.addSubview(pic4)
//        view.addSubview(pic5)
//        view.addSubview(pic6)
        openview.addSubview(label1)
        
        openview.addSubview(label2)
        label2.isHidden = true
        view.addSubview(tableView)
        view.addSubview(openview)
//        openview.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 300)
        NSLayoutConstraint.activate([
         
        openview.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
        openview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        openview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        openview.heightAnchor.constraint(equalToConstant: 150),
//        view.addConstraint(NSLayoutConstraint(item: openview, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 200)
//)
            tableView.topAnchor.constraint(equalTo: openview.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            openButton.topAnchor.constraint(equalTo: openview.topAnchor, constant: 40),
            openButton.trailingAnchor.constraint(equalTo: openview.trailingAnchor, constant: -10),
            stackH.bottomAnchor.constraint(equalTo: openview.bottomAnchor, constant: 0),
            stackH.leadingAnchor.constraint(equalTo: openview.leadingAnchor, constant: 0),
            stackH.trailingAnchor.constraint(equalTo: openview.trailingAnchor, constant: 0),
            stackH.heightAnchor.constraint(equalToConstant: 44),
            stackH.widthAnchor.constraint(equalTo: view.widthAnchor),
            label1.topAnchor.constraint(equalTo: openview.topAnchor, constant: 40),
            label1.centerXAnchor.constraint(equalTo: openview.centerXAnchor),
            label2.topAnchor.constraint(equalTo: openview.topAnchor, constant: 40),
            label2.centerXAnchor.constraint(equalTo: openview.centerXAnchor)
        ])

//        openButton.topAnchor.constraint(equalTo: openview.topAnchor, constant: 40).isActive = true
//        openButton.trailingAnchor.constraint(equalTo: openview.trailingAnchor, constant: -10).isActive = true
        openButton.addTarget(self, action: #selector(openFriends), for: .touchUpInside)

//        stackV.topAnchor.constraint(equalTo: openview.topAnchor, constant: 0).isActive = true
//        stackV.leadingAnchor.constraint(equalTo: openview.leadingAnchor, constant: 0).isActive = true
//        stackV.trailingAnchor.constraint(equalTo: openview.trailingAnchor, constant: 0).isActive = true
//        stackV.heightAnchor.constraint(equalToConstant: 240).isActive = true
//        stackV.widthAnchor.constraint(equalTo: openview.widthAnchor).isActive = true
//        stackV.addSubview(openButton)
//        stackV.addSubview(label1)
//        stackV.addSubview(label2)
//        stackV.addSubview(stackH)

//        stackH.bottomAnchor.constraint(equalTo: openview.bottomAnchor, constant: 0).isActive = true
//        stackH.leadingAnchor.constraint(equalTo: openview.leadingAnchor, constant: 0).isActive = true
//        stackH.trailingAnchor.constraint(equalTo: openview.trailingAnchor, constant: 0).isActive = true
//        stackH.heightAnchor.constraint(equalToConstant: 44).isActive = true
//        stackH.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        stackH.addArrangedSubview(pic1)
        stackH.addArrangedSubview(pic2)
        stackH.addArrangedSubview(pic3)
        stackH.addArrangedSubview(pic4)
        stackH.addArrangedSubview(pic5)
        stackH.addArrangedSubview(pic6)
        stackH.isHidden = true
//
//        label1.topAnchor.constraint(equalTo: openview.topAnchor, constant: 40).isActive = true
//        label1.centerXAnchor.constraint(equalTo: openview.centerXAnchor).isActive = true
//
//        label2.topAnchor.constraint(equalTo: openview.topAnchor, constant: 90).isActive = true
//        label2.centerXAnchor.constraint(equalTo: openview.centerXAnchor).isActive = true

        pic1.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pic2.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pic3.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pic4.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pic5.widthAnchor.constraint(equalToConstant: 60).isActive = true
        pic6.widthAnchor.constraint(equalToConstant: 60).isActive = true

        pic1.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pic2.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pic3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pic4.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pic5.heightAnchor.constraint(equalToConstant: 60).isActive = true
        pic6.heightAnchor.constraint(equalToConstant: 60).isActive = true

//        tableView.topAnchor.constraint(equalTo: openview.bottomAnchor, constant: 0).isActive = true
//        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
//        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
//        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        let tapGestureRecognizer1 = UITapGestureRecognizer(target: self, action: #selector(hello1))
        pic1.isUserInteractionEnabled = true
        pic1.addGestureRecognizer(tapGestureRecognizer1)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(hello2))
        pic2.isUserInteractionEnabled = true
        pic2.addGestureRecognizer(tapGestureRecognizer2)
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(hello3))
        pic3.isUserInteractionEnabled = true
        pic3.addGestureRecognizer(tapGestureRecognizer3)
        let tapGestureRecognizer4 = UITapGestureRecognizer(target: self, action: #selector(hello4))
        pic4.isUserInteractionEnabled = true
        pic4.addGestureRecognizer(tapGestureRecognizer4)
        let tapGestureRecognizer5 = UITapGestureRecognizer(target: self, action: #selector(hello5))
        pic5.isUserInteractionEnabled = true
        pic5.addGestureRecognizer(tapGestureRecognizer5)
        let tapGestureRecognizer6 = UITapGestureRecognizer(target: self, action: #selector(hello6))
        pic6.isUserInteractionEnabled = true
        pic6.addGestureRecognizer(tapGestureRecognizer6)
    }
    @objc func hello1() {
        friendsList.append("Joey")
        tableView.insertRows(at: [IndexPath(row: friendsList.count-1,section: 0)], with: .automatic)
        tableView.reloadData()
    }
    @objc func hello2() {
        friendsList.append("Monica")
        tableView.insertRows(at: [IndexPath(row: friendsList.count-1,section: 0)], with: .automatic)
        tableView.reloadData()
    }
    @objc func hello3() {
        friendsList.append("Rachel")
        tableView.insertRows(at: [IndexPath(row: friendsList.count-1,section: 0)], with: .automatic)
        tableView.reloadData()
    }
    @objc func hello4() {
        friendsList.append("Ross")
        tableView.insertRows(at: [IndexPath(row: friendsList.count-1,section: 0)], with: .automatic)
        tableView.reloadData()
    }
    @objc func hello5() {
        friendsList.append("Chandler")
        tableView.insertRows(at: [IndexPath(row: friendsList.count-1,section: 0)], with: .automatic)
        tableView.reloadData()
    }
    @objc func hello6() {
        friendsList.append("Phoebe")
        tableView.insertRows(at: [IndexPath(row: friendsList.count-1,section: 0)], with: .automatic)
        tableView.reloadData()
    }
    
    @objc func openFriends() {
        if openOrClose == false {
            UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseInOut, animations: { [self] in self.openButton.transform = CGAffineTransform(rotationAngle: .pi*3/4);
                            NSLayoutConstraint.activate([openview.heightAnchor.constraint(equalToConstant: 400)]);self.view.layoutIfNeeded();self.stackH.isHidden = false;label1.isHidden = true; label2.isHidden = false},
                           completion: nil)
            openOrClose = true
            print("hola")
        } else {
            UIView.animate(withDuration: 3.0, delay: 0.1, usingSpringWithDamping: 0.1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [self] in self.openButton.transform = .identity;self.label2.isHidden = true; self.label1.isHidden = false;NSLayoutConstraint.activate([openview.heightAnchor.constraint(equalToConstant: 200)]);self.view.layoutIfNeeded();self.stackH.isHidden = true }, completion: nil)
            print("hello")
            openOrClose = false
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Num: \(indexPath.row)")
            print("Value: \(friendsList[indexPath.row])")
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

         return 50
     }

}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return friendsList.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! friendsTableViewCell
    cell.textLabel?.text = friendsList[indexPath.row]
    return cell
  }
}


