//
//  SectionTwoCell.swift
//  ReminderPractice
//
//  Created by Sierra on 2023/04/05.
//

import UIKit

class SectionTwoCell: UICollectionViewCell {
    var view = UIView()
    
    var title: UILabel = {
        var title = UILabel()
        title.textColor = .white
        title.font = .systemFont(ofSize: 20)
        title.textAlignment = . left
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        view.addSubview(title)
        self.contentView.addSubview(view)
        
        title.snp.makeConstraints { make in
            make.leading.equalTo(view).offset(10)
            make.bottom.equalTo(view).offset(-5)
        }
        view.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.centerY.equalTo(contentView)
            make.height.equalTo(contentView)
            make.width.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
