//
//  Created by Maciej Gomółka.
//

import SwiftUI

struct JokeView: View {
  @State var state: JokeState
  private let urlSession: URLSessionProtocol

  init(
    state: JokeState,
    urlSession: URLSessionProtocol = URLSession.shared
  ) {
    self.state = state
    self.urlSession = urlSession
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
        case .failure:
          Text("I couldn't come up with a good joke. Can I get another try? 🤔")
        }
      }.multilineTextAlignment(.center)
      .frame(height: 180)
      .padding(.horizontal, 64)
      .padding(.top, 16)

      Button(action: { fetchNewJoke() }) {
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

  func fetchNewJoke() {
    let url = URL(string: "https://official-joke-api.appspot.com/random_joke").unsafelyUnwrapped
    let request = URLRequest(url: url)
    Task {
      try! await urlSession.data(for: request, delegate: nil)
    }
  }

}

#Preview {
  JokeViewPreviewProvider.jokeView
}

#Preview {
  JokeViewPreviewProvider.loadingView
}

#Preview {
  JokeViewPreviewProvider.jokeLoadingFailure
}
