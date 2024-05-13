import SwiftUI

enum JokeState {
  case loading
  case loaded(joke: Joke)
}

struct Joke {
  let setup: String
  let punchline: String
}

struct JokeView: View {
  let state: JokeState

  init(state: JokeState) {
    self.state = state
  }

  var body: some View {
    VStack {
      Image("header")

      VStack(alignment: .center) {
        switch state {
        case .loading:
          Text("Making up a joke 🤭")
        case .loaded(let joke):
          Text(joke.setup)
          Text("⤵️")
          Text(joke.punchline)
        }
      }.multilineTextAlignment(.center)
      .frame(height: 180)
      .padding(.horizontal, 64)
      .padding(.top, 16)

      Button(action: { print("Button tapped") }) {
        Text("Tell me another!")
          .tint(.black)
          .padding(.vertical, 10)
      }.frame(maxWidth: .infinity)
        .background(Color("ButtonBackground"))
        .clipShape(Capsule())
        .overlay(Capsule().stroke(style: StrokeStyle(lineWidth: 3)))
        .padding(.horizontal, 32)
        .padding(.top, 16)
    }
  }
}

enum JokeViewPreviewProvider: PreviewProvider {

  // MARK: - PreviewProvider

  static var previews: some View {
    Group {
      jokeView
      loadingView
    }
  }

  // MARK: - Views

  static let jokeView = JokeView(state: .loaded(joke: joke))
  static let loadingView = JokeView(state: .loading)

  // MARK: - Models

  static let joke = Joke(
    setup: "The punchline often arrives before the set-up.",
    punchline: "Do you know the problem with UDP jokes?"
  )

}
