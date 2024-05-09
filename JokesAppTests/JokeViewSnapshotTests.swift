@testable import JokesApp
import SnapshotTesting
import SwiftUI
import XCTest

final class JokeViewSnapshotTests: XCTestCase {

  func test_JokeView_DisplaysJoke() {
    let joke = Joke(
      setup: "The punchline often arrives before the set-up.",
      punchline: "Do you know the problem with UDP jokes?"
    )
    let sut = JokeView(joke: joke)
    let controller = UIHostingController(rootView: sut)
    assertSnapshot(of: controller, as: .image(on: .iPhone13Pro), record: true)
  }

}
