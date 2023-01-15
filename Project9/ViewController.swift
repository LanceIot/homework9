//
//  ViewController.swift
//  Project9
//
//  Created by Админ on 11.01.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let myTitles: [String] = ["Violin", "Classical guitar", "Bass guitar"]
    private let myProducts: [[String]] = [["Скрипка 4/4 Tayste", "Скрипка R. Empire 2/4", "Скрипка Sonata 4/4", "Скрипка Stagg 4/4"], ["Grape GP-C40 RDS", "Smiger CG-500S", ], ["Kaysen Bass", "Smiger Jazz Bass", "Fender Jazz Bass"]]
    private let myPrices: [[String]] = [["36 000 ₸", "80 000 ₸", "49 000 ₸", "75 000 ₸"], ["39 900 ₸", "63 500 ₸"], ["73 000 ₸", "94 000 ₸", "301 000 ₸"]]
    private let myImages: [[String]] = [["product1.1", "product1.2", "product1.3", "product1.4"], ["product2.1", "product2.2"], ["product3.1", "product3.2", "product3.3"]]
    
    private lazy var myTableView: UITableView = {
       let tableView = UITableView()
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: MyTableViewCell.IDENTIFIER)
        tableView.backgroundColor = UIColor(red: 254/255, green: 249/255, blue: 248/255, alpha: 1)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        myTableView.dataSource = self
        myTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
}

//MARK: - Table view data source methods

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myTitles.count
    }
    
    //Здесь задаем height для хэдэра тайтла
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    //Здесь мы создаем новый view и меняем ему задний фон и font, чтобы использовать его как header нашего Table View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 238/255, green: 146/255, blue: 115/255, alpha: 1) //Использовал rgb вместо обычный .systemcolors
        
        let titleLabel = UILabel()
        titleLabel.text = myTitles[section]
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        titleLabel.textColor = UIColor.white
        headerView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myProducts[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.IDENTIFIER, for: indexPath) as! MyTableViewCell 
        cell.setHeaderText(with: "\(indexPath.row + 1). \(myProducts[indexPath.section][indexPath.row])")
        cell.setPriceText(with: myPrices[indexPath.section][indexPath.row])
        cell.setImage(with: myImages[indexPath.section][indexPath.row])
        return cell
    }
}

//MARK: - Table view delegate methods

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

//MARK: - Setup views and constraints methods

private extension ViewController {
    func setupViews() {
        view.addSubview(myTableView)
    }
    
    func setupConstraints() {
        myTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}



