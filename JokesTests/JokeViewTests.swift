//
//  Created by Maciej Gomółka on 22.07.2024.
//

@testable import Jokes
import XCTest
import ViewInspector

class JokeViewTests: XCTestCase {

  func test_whenTappingOnTheButton_ItTriggersRequest() throws {
    let expectation = XCTestExpectation(description: "Wait for request being executed")
    let urlSessionSpy = URLSessionSpy()
    urlSessionSpy.dataForRequestExpectation = expectation
    let sut = JokeView(state: .loaded(joke: .udp), urlSession: urlSessionSpy)

    try sut.inspect().find(button: "Tell me another!").tap()

    wait(for: [expectation], timeout: 0.1)

    XCTAssertEqual(
      urlSessionSpy.dataInvokedWithRequest.map(\.url?.absoluteString),
      ["https://official-joke-api.appspot.com/random_joke"]
    )
  }

}

private extension Joke {

  static var udp: Joke {
    .init(
      setup: "The punchline often arrives before the set-up.",
      punchline: "Do you know the problem with UDP jokes?"
    )
  }

}

class URLSessionSpy: URLSessionProtocol {

  var dataForRequestExpectation: XCTestExpectation?
  private(set) var dataInvokedWithRequest: [URLRequest] = []

  func data(for request: URLRequest, delegate: (any URLSessionTaskDelegate)?) async throws -> (Data, URLResponse) {
    dataInvokedWithRequest.append(request)
    dataForRequestExpectation?.fulfill()

    return (Data(), URLResponse())
  }

}
