//
//  ViewController.swift
//  ReminderPractice
//
//  Created by Sierra on 2023/04/02.
//

import UIKit
import SnapKit

final class ReminderViewController: UIViewController {
 
    
    
    //MARK: - 네비게이션바
    private lazy var navigationBar : UINavigationBar = {
        let navigationBar = UINavigationBar()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        
        let navItem = UINavigationItem()
        let rightButton = UIBarButtonItem(title: "편집", style: .plain, target: self, action: nil)
        navItem.rightBarButtonItem = rightButton
        
        navigationBar.setItems([navItem], animated: true)
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .black
        
        navigationBar.standardAppearance = appearance
        
        return navigationBar
    }()
    
    
    //MARK: - 바텀뷰 (H스택)
    private lazy var bottomRightButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("새로운 미리 알림", for: .normal)
        
        var image = UIImage(systemName: "plus.circle.fill")
        button.setImage(image, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    
    private lazy var bottomLefttButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("목록 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [bottomRightButton, bottomLefttButton])
        stack.spacing = 100
        stack.axis = .horizontal
        stack.alignment = .fill
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        
        
    }
    
    
    //MARK: - UI 셋업
    func setUI(){
        self.view.backgroundColor = .black
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(bottomStackView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        navigationBar.snp.makeConstraints { make in
            make.top.equalTo(safeArea)
            make.leading.equalTo(safeArea)
            make.trailing.equalTo(safeArea)
        }
        
        bottomStackView.snp.makeConstraints { make in
            make.bottom.equalTo(safeArea)
            make.leading.equalTo(safeArea)
            make.trailing.equalTo(safeArea)
        }
        
        bottomRightButton.snp.makeConstraints { make in
            make.leading.equalTo(bottomStackView).offset(30)
        }
        
        bottomLefttButton.snp.makeConstraints { make in
            make.trailing.equalTo(bottomStackView).offset(30)
        }
        
        
        }
    

    
    
}

