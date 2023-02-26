//
//  UrlBuilder.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import Foundation

final class UrlBuilder {

    static func buildUrl(path: Constants.Paths) -> String {
        let baseUrl = Constants.API.baseUrl
        let string = baseUrl + path.rawValue

        return string
    }
}
