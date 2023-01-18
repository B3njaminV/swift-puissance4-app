//
// Created by etudiant on 18/01/2023.
//

import Foundation

enum BoardResult {
    case unknown
    case ok
    case failed(FailedReason)
}

enum FailedReason {
    case unknown
    case columnFull
    case boardFull
}
