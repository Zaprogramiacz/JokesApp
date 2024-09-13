//
//  Created by Maciej Gomółka.
//

import Foundation

protocol URLSessionProtocol {
  func data(
    for request: URLRequest,
    delegate: (any URLSessionTaskDelegate)?
  ) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {}