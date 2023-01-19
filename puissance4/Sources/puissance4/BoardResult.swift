//
// Created by etudiant on 18/01/2023.
//

import Foundation

public enum BoardResult {
    case unknown
    case ok
    case failed(FailedReason)
}

public enum FailedReason {
    case unknown
    case columnFull
    case boardFull
}
