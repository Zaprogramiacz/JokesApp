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
