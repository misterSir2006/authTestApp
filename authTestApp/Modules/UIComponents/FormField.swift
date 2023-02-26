//
//  FormField.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

class FormField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func fill() {
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.font = .boldSystemFont(ofSize: 12)
        self.textColor = .black
        self.setLeftPadding(20)

        self.layer.shadowColor = UIColor(red: 0.027, green: 0.016, blue: 0.016, alpha: 0.08).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 15
        self.layer.shadowOffset = CGSize(width: 2, height: 3)
    }

}
