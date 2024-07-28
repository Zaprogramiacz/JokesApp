//
//  Created by Maciej Gomółka on 22.07.2024.
//

@testable import Jokes
import XCTest
import ViewInspector

class JokeViewTests: XCTestCase {

  func test_whenTappingOnTheButton_ItTriggersRequest() throws {
    var isActionTriggered = false
    let sut = JokeView(state: .loaded(joke: .udp)) {
      isActionTriggered = true
    }
    try sut.inspect().find(button: "Tell me another!").tap()

    XCTAssertTrue(isActionTriggered)
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
