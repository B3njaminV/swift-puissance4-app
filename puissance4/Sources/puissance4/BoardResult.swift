import Foundation

public enum BoardResult {
    case unknown
    case ok
    case failed(FailedReason)
}

public enum FailedReason {
    case unknown
    case columnNil
    case outOfBounds
    case columnFull
    case boardFull
}
