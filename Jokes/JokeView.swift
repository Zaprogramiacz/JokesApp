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
    VStack {
      Image("header")

      VStack(alignment: .center) {
        Text(joke.setup)
        Text("⤵️")
        Text(joke.punchline)
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
