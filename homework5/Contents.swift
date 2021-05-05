import Foundation

//Direct dispatch
final class DirectClass {
    func sayDirect() {
        print("Direct")
    }
}

struct DirectStruct {
    func sayDirectStruct() {
        print("Direct struct")
    }
}

//Witness table
protocol VirtualWitnessDispatchProtocol {
    func say()
}

struct WitnessStruct: VirtualWitnessDispatchProtocol {
    func say() {
        print("Witness dispatch")
    }
}

// Virtual table
class VirtualClass: VirtualWitnessDispatchProtocol {
    func say() {
        print("Virtual dispatch")
    }
}

// Message Dispatch
class MessageClass {
    dynamic func sayMessageDispatch() {
        print("Message dispatch")
    }
}


