//
//  String+Extension.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

extension String {

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func matches(for regex: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in: self, range: NSRange(self.startIndex..., in: self))
            return results.map { String(self[Range($0.range, in: self)!]) }
        } catch {
            return []
        }
    }

    func base64ToImage() -> UIImage? {
        if let url = URL(string: self),
           let data = try? Data(contentsOf: url),
           let image = UIImage(data: data) {
            return image
        }

        return nil
    }

}
