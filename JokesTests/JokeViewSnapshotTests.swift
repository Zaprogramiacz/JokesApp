@testable import Jokes
import SnapshotTesting
import SwiftUI
import XCTest

final class JokeViewSnapshotTests: XCTestCase {

  func test_JokeView_DisplaysJoke() {
    let controller = UIHostingController(rootView: JokeViewPreviewProvider.jokeView)
    assertSnapshot(
      of: controller,
      as: .image(drawHierarchyInKeyWindow: true, size: ViewImageConfig.iPhone13Pro.size)
    )
  }

}
