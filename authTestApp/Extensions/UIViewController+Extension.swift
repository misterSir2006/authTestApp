//
//  UIViewController+Extension.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

extension UIViewController {

   public func hideKeyboardGesture() {
       let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
       tap.cancelsTouchesInView = false
       self.view.addGestureRecognizer(tap)
   }

   @objc private func hideKeyboard() {
       self.view.endEditing(true)
   }
}
