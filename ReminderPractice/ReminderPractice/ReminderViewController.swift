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
    
    
    //MARK: - 컬렉션뷰
    let cellTitles: [String] = ["오늘", "예정", "전체", "깃발 표시"]
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .black
        
        return collectionView
    }()
    
    private lazy var collectionViewHeader: UITextField = {
       let textField = UITextField()
        textField.placeholder = "검색"
    }()
    
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    
    //MARK: - UI 셋업
    func setUI(){
        self.view.backgroundColor = .black
        
        self.view.addSubview(navigationBar)
        self.view.addSubview(bottomStackView)
        self.view.addSubview(collectionView)
        collectionView.register(SectionOneCell.self, forCellWithReuseIdentifier: "\(SectionOneCell.self)")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        //MARK: - 오토레이아웃
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
         
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar).offset(40)
            make.leading.equalTo(safeArea).offset(20)
            make.trailing.equalTo(safeArea).offset(-20)
            make.height.equalTo(240)
        }
        
    }

}


// MARK: - 컬렉션뷰 extension
extension ReminderViewController: UICollectionViewDataSource {
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: SectionOneCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SectionOneCell.self)", for: indexPath) as? SectionOneCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .gray
        cell.layer.cornerRadius = 10
        cell.title.text = cellTitles[indexPath.item]
        
        return cell
    }
    
    
}

extension ReminderViewController: UICollectionViewDelegate {
    //셀 선택시 실행될 동작
}

extension ReminderViewController: UICollectionViewDelegateFlowLayout {
     //셀 사이즈 간격 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width

        let width = collectionViewWidth / 2.1

        let height = width / 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
