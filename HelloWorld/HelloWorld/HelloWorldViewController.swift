//
//  ViewController.swift
//  HelloWorld
//
//  Created by Sierra on 2023/04/01.
//

import UIKit
import SnapKit

class HelloWorldViewController: UIViewController {
    
    
    //MARK: - helloWorldLabel 생성
    private lazy var helloWorldLabel: UILabel = {
        var label = UILabel()
        
        label.text = "Hello World!!"
        label.textAlignment = . center
        label.layer.cornerRadius = 10
        label.layer.masksToBounds = true
        label.layer.borderWidth = 3
        label.backgroundColor = .white
        
        view.addSubview(label)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI(){
        view.backgroundColor = .systemCyan
        
        helloWorldLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
            make.leading.equalTo(45)
            make.trailing.equalTo(-45)
            make.top.equalTo(300)
            
            make.height.equalTo(100)
        }
    }

}

