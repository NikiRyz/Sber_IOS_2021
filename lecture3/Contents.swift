import UIKit

class Series {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct SeriesStruct {
    private var ref: Series
    init(name: String) {
        ref = Series(name: name)
    }
    var name: String {
        get { return ref.name}
        set {
            if (!isKnownUniquelyReferenced(&ref)) {
                ref = Series(name: newValue)
                return
            }
            ref.name = newValue
        }
    }
}

var seriesTest1 = SeriesStruct(name: "Lost")
print("seriesTest1.name= "+seriesTest1.name)
var seriesTest2 = seriesTest1
print("seriesTest2.name= "+seriesTest2.name)
seriesTest2.name="Castle"
print("After assigning a new value:")
print("seriesTest1.name= "+seriesTest1.name)
print("seriesTest2.name= "+seriesTest2.name)
