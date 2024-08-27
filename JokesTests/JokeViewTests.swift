//
//  Created by Maciej Gomółka on 22.07.2024.
//

@testable import Jokes
import XCTest
import ViewInspector

class JokeViewTests: XCTestCase {

  func test_whenTappingOnTheButton_ItTriggersRequest() throws {
    var requestExecutorInvokedWithRequest: URLRequest?
    let expectation = XCTestExpectation(description: "Wait for request being executed")
    let sut = JokeView(state: .loaded(joke: .udp)) { request, _ in
      requestExecutorInvokedWithRequest = request
      expectation.fulfill()

      return (Data(), URLResponse())
    }

    try sut.inspect().find(button: "Tell me another!").tap()

    wait(for: [expectation], timeout: 0.1)

    XCTAssertEqual(requestExecutorInvokedWithRequest?.url, .init(URL(string: "https://official-joke-api.appspot.com/random_joke")!))
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
