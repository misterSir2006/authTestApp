//
//  ApiService.swift
//  authTestApp
//
//  Created by Илья Шахназаров on 26.02.2023.
//

import UIKit

final class ApiService {

    enum NetworkMethods: String {
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case put = "PUT"
    }

    static func call<T: Codable>(for: T.Type = T.self,
                                 token: String?,
                                 url: String, method: NetworkMethods,
                                 completionHandler: @escaping (Result<T, ApiError>) -> Void) {
        guard let requestUrl = URL(string: url) else { return }
        var request = URLRequest(url: requestUrl)

        if let token = token {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")

        URLSession.shared.dataTask(with: request) { data, _, error in
            guard data != nil else {
                completionHandler(.failure(.httpError))
                return
            }

            if let decodedData = try? JSONDecoder().decode(T.self, from: data!) {
                DispatchQueue.main.async {
                    completionHandler(.success(decodedData))
                }
            } else {
                let error = try? JSONDecoder().decode(ErrorObject.self, from: data!)
                guard let error = error else { return }
                completionHandler(.failure(.serviceError(error)))
            }
        }.resume()
    }

    // MARK: Error object
    struct ErrorObject: Codable {
        var resultMessage: String

        enum CodingKeys: String, CodingKey {
            case resultMessage = "result_message"
        }
    }

    enum ApiError: Error {
        case serviceError(ErrorObject)
        case httpError
    }
}
