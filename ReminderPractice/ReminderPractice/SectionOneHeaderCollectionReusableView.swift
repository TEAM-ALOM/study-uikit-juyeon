//
//  SectionOneHeaderCollectionReusableView.swift
//  ReminderPractice
//
//  Created by Sierra on 2023/04/03.
//

import UIKit

final class SectionOneHeaderCollectionReusableView: UICollectionReusableView{
    
    static let id = "SectionOneHeaderCollectionReusableView"
    
    private let searchBar : UITextField = {
        
        let tf = UITextField()
        tf.placeholder = "검색"
        tf.leftViewMode = .unlessEditing
        var searchImage = UIImageView()
        searchImage.image = UIImage(systemName: "magnifyingglass")
        tf.leftView = searchImage
        tf.attributedPlaceholder =  NSAttributedString(string: "검색", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        tf.layer.masksToBounds = true
        tf.layer.cornerRadius = 10
        tf.backgroundColor = .darkGray
        tf.textColor = .white
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .green  //헤더 너비 테스용 색상
        self.addSubview(searchBar)
        
        searchBar.snp.makeConstraints { make in
            make.leading.equalTo(self).offset(10)
            make.trailing.equalTo(self).offset(-10)
            make.top.equalTo(self)
            make.bottom.equalTo(self)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
