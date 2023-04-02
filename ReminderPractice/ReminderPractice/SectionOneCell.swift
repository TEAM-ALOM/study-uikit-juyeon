//
//  SectionOneCell.swift
//  ReminderPractice
//
//  Created by Sierra on 2023/04/02.
//

import UIKit
import SnapKit

class SectionOneCell: UICollectionViewCell {
    
    var view = UIView()
    var count: UILabel = {
        var count = UILabel()
        count.text = "\(0)"
        count.textColor = .white
        count.font = .boldSystemFont(ofSize: 25)
        return count
    }()
    
    var title: UILabel = {
        var title = UILabel()
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 15)
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        view.addSubview(count)
        view.addSubview(title)
        self.contentView.addSubview(view)
        
        count.snp.makeConstraints { make in
            make.trailing.equalTo(view).offset(-10)
            make.top.equalTo(view).offset(15)
        }
        
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
