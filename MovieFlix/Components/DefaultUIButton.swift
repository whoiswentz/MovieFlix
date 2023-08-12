//
//  DefaultUIButton.swift
//  MovieFlix
//
//  Created by Vinicios Wentz on 12/08/23.
//

import UIKit

class DefaultUIButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    private func setupButton() {
        layer.borderColor = UIColor.systemBackground.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 5
        translatesAutoresizingMaskIntoConstraints = false
    }
}
