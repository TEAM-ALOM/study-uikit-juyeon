//
//  SectionTwoHeader.swift
//  ReminderPractice
//
//  Created by Sierra on 2023/04/05.
//

import UIKit

final class SectionTwoHeader: UICollectionReusableView {
    static let id = "SectionTwoHeader"
    
    private let myList : UILabel = {
        let label = UILabel()
        label.text = "나의 목록"
        label.textColor = .white
        label.textAlignment = . left
        label.font = UIFont.boldSystemFont(ofSize: 35)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .green  //헤더 너비 테스용 색상
        self.addSubview(myList)
        
        myList.snp.makeConstraints { make in
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



