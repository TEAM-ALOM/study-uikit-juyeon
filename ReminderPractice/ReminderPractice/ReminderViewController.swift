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
    let sectionOneCellTitle: [String] = ["오늘", "예정", "전체", "깃발 표시"]
    let sectionTwoCellTitle: [String] = ["미리알림", "St", "Life"]
    
    private lazy var collectionView: UICollectionView = {
        
        //MARK: - 컬렉션뷰의 flowlayout
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.headerReferenceSize = .init(width: 0, height: 50)
        
        let collectionView = UICollectionView(frame: .init(), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .black
        
        return collectionView
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
        collectionView.register(SectionOneHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionOneHeader.id)
        collectionView.register(SectionTwoCell.self, forCellWithReuseIdentifier: "\(SectionTwoCell.self)")
        collectionView.register(SectionTwoHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionTwoHeader.id)
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
            make.leading.equalTo(safeArea)
            make.trailing.equalTo(safeArea)
            make.bottom.equalTo(bottomStackView).offset(-40)
        }
        
    }
    
}


// MARK: - 컬렉션뷰 extension
extension ReminderViewController: UICollectionViewDataSource {
    
    //섹션 개수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){
            return sectionOneCellTitle.count
        }
        else{
            return sectionTwoCellTitle.count
        }
    }
    
    //셀 생성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(indexPath.section == 0){
            
            guard let cell: SectionOneCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SectionOneCell.self)", for: indexPath) as? SectionOneCell else {
                return UICollectionViewCell()
            }
            
            cell.backgroundColor = .darkGray
            cell.layer.cornerRadius = 10
            cell.title.text = sectionOneCellTitle[indexPath.item]
            
            return cell
            
        }
        else{
            guard let cell: SectionTwoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SectionTwoCell.self)", for: indexPath) as? SectionTwoCell else {
                return UICollectionViewCell()
            }
            
            cell.backgroundColor = .darkGray
            cell.layer.cornerRadius = 10
            
            
            cell.title.text = sectionTwoCellTitle[indexPath.item]
            
            return cell
        }
    }
    
    //헤더 생성
    func collectionView( _ collectionView: UICollectionView,viewForSupplementaryElementOfKind kind: String,at indexPath: IndexPath) -> UICollectionReusableView {
        if(indexPath.section == 0){
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: SectionOneHeader.id,for: indexPath) as! SectionOneHeader
            return supplementaryView
            
        }
        
        else{
            let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,withReuseIdentifier: SectionTwoHeader.id,for: indexPath) as! SectionTwoHeader
            return supplementaryView
        }
        

    }
}

extension ReminderViewController: UICollectionViewDelegate {
    //셀 선택시 실행될 동작 - 목업화면으로 기능 없음
}

extension ReminderViewController: UICollectionViewDelegateFlowLayout {
    //셀 사이즈 간격 설정 - 컬렉션뷰 생성 클로저에 flowLayout을 설정하는 방법 사용
    
    //셀 크기 설정 - 섹션마다 셀의 크기가 달라야 함으로 여기서 설정(컬렉션뷰 생성 클로저에 flowLayout에서 설정하면 섹션마다 설정불가)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize : CGFloat = UIScreen.main.bounds.width
        if(indexPath.section == 0){
            return CGSize(width: screenSize/2 - 20  , height: 100)
        }
        
        else{
            return CGSize(width: screenSize - 20  , height: 50)
        }
    }
}
