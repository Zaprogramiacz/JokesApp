//
//  Created by Maciej Gomółka.
//

import Foundation

enum JokeState {
  case loading
  case loaded(joke: Joke)
  case failure
}
