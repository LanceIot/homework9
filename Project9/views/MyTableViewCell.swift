//
//  MyTableViewCell.swift
//  Project9
//
//  Created by Админ on 11.01.2023.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "MyTableViewCell"
    
    private lazy var leftView = UIView()
    
    private lazy var myHeaderText: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = "Test"
        label.textColor = UIColor(red: 13/255, green: 13/255, blue: 13/255, alpha: 1)
        return label
    }()
    
    private lazy var myPriceText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .systemBlue
        return label
    }()
    
    private lazy var myImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "trash.fill")
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setHeaderText(with newHeaderText: String) {
        myHeaderText.text = newHeaderText
    }
    
    func setPriceText(with newPriceText: String) {
        myPriceText.text = newPriceText
    }
    
    func setImage(with newImage: String) {
        myImage.image = UIImage(named: newImage)
        myImage.contentMode = .scaleAspectFit
    }
}

//MARK: - Setup views and constraints methods

private extension MyTableViewCell {
    
    func setupViews() {
        contentView.addSubview(leftView)
        leftView.addSubview(myHeaderText)
        leftView.addSubview(myPriceText)
        
        contentView.addSubview(myImage)
    }
    
    func setupConstraints() {
        
        leftView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.6)
        }
        
        myHeaderText.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(5)
            make.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.3)
        }
        
        myPriceText.snp.makeConstraints { make in
            make.top.equalTo(myHeaderText.snp.bottom)
            make.leading.equalToSuperview().inset(5)
            make.trailing.bottom.equalToSuperview()
        }
        
        myImage.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview().inset(10)
            make.leading.equalTo(leftView.snp.trailing)
        }
    }
}
