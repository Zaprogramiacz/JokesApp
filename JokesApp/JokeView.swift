import SwiftUI

struct Joke {
  let setup: String
  let punchline: String
}

struct JokeView: View {
  let joke: Joke

  init(joke: Joke) {
    self.joke = joke
  }

  var body: some View {
    Text("Hello world")
  }
}

enum JokeViewPreviewProvider: PreviewProvider {

  // MARK: - PreviewProvider

  static var previews: some View {
    jokeView
  }

  // MARK: - Views

  static let jokeView = JokeView(joke: joke)

  // MARK: - Models

  static let joke = Joke(
    setup: "The punchline often arrives before the set-up.",
    punchline: "Do you know the problem with UDP jokes?"
  )

}
