protocol Cat {
    func say()
}

class Kitty: Cat {
    func say() {
        print("Meow")
    }
}

class ScreamingСat: Cat {
    func say() {
        print("Meow Meow Meow")
    }
}

protocol Dog {
    func say()
}

class Puppy: Dog {
    func say() {
        print("Woof")
    }
}

class DuardDog: Dog {
    func say() {
        print("Woof Woof Woof")
    }
}

protocol Factory {
    func produceCat() -> Cat
    func produceDog() -> Dog
}

class SmallAnimal: Factory {
    func produceCat() -> Cat {
        print("Kitty is created")
        return Kitty()
    }
    
    func produceDog() -> Dog {
        print("Puppy is creates")
        return Puppy()
    }
}

class NoisyFactory: Factory {
    func produceCat() -> Cat {
        print("ScreamingСat is created")
        return ScreamingСat()
    }
    
    func produceDog() -> Dog {
        print("DuardDog is creates")
        return DuardDog()
    }
}

let smallAnimal = SmallAnimal()
smallAnimal.produceCat()

let noisyFactory = NoisyFactory()
noisyFactory.produceDog()