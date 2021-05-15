protocol CatProtocol {
    var catColor:String
    var catSize: String
}

class Cat: CatProtocol {
    var catColor: String
    var catSize: String
    
    init(catColor: String, catSize: String) {
        self.catColor = catColor
        self.catSize = catSize
    }
}

protocol NewCatProtocol {
    func setColor(color:String)
    func setSize(color: String)
    func createCat() -> CatProtocol?
}

class NewCat: NewCatProtocol {
    private var catColor: String?
    private var catSize: String?
    
    func setColor(color: String) {
        self.catColor = color
    }
    
    func setSize(size: String) {
        self.catSize = size
    }
    
    func createCat() -> CatProtocol? {
        guard let catColor = catColor, let catSize = catSize else { return nil }
        return Cat(catColor: catColor, catSize: catSize)
    }
}

let builder = NewCat()
builder.setSize(color: "small")
builder.setColor(color: "black")
let cat = builder.createCat()