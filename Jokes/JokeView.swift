//
//  Created by Maciej Gomółka
//

import SwiftUI

enum JokeState {
  case loading
  case loaded(joke: Joke)
  case failure
}

struct Joke {
  let setup: String
  let punchline: String
}

struct JokeView: View {
  @State var state: JokeState
  private let buttonAction: () -> Void

  init(state: JokeState, buttonAction: @escaping () -> Void) {
    self.state = state
    self.buttonAction = buttonAction
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

      Button(action: buttonAction) {
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

#Preview {
  JokeViewPreviewProvider.jokeView
}

#Preview {
  JokeViewPreviewProvider.loadingView
}

#Preview {
  JokeViewPreviewProvider.jokeLoadingFailure
}
