//
//  Created by Maciej Gomółka
//

enum JokeViewPreviewProvider {

  // MARK: - Views

  static let jokeView = JokeView(state: .loaded(joke: joke)) {}
  static let loadingView = JokeView(state: .loading) {}
  static let jokeLoadingFailure = JokeView(state: .failure) {}

  // MARK: - Models

  static let joke = Joke(
    setup: "The punchline often arrives before the set-up.",
    punchline: "Do you know the problem with UDP jokes?"
  )

}
