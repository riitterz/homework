import UIKit

var greeting = "Hello, playground"

//1// Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

//2// Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

import Foundation

enum TreeError: Error {
    case noFruitage(fruitageneed: Int)
    case treeFar
    case noTree
}
struct Tree {
    var fruitage: Int
    var tree: Int
}
class wildTree {
    var forest = [
        "Olive": Tree(fruitage:20, tree: 2),
        "Figs": Tree(fruitage:20, tree: 2),
        "Manzanita": Tree(fruitage:10, tree: 1),
    ]
    var treeFruitage = 0
    func errors(treeName name: String) throws {
        guard let trees = forest[name] else {
            throw TreeError.noTree
        }
        guard trees.tree > 0 else {
            throw TreeError.noTree
        }
        guard trees.fruitage <= treeFruitage else {
            throw TreeError.noFruitage(fruitageneed: trees.fruitage - treeFruitage)
        }
        treeFruitage -= trees.fruitage
        
        var someTrees = trees
        someTrees.fruitage -= 2
        forest[name] = someTrees
        
        print("У нас в лесу растет \(name)")
    }
}
let bloomingTrees = [
    "May": "Olive",
    "June": "Figs",
    "Fabruary": "Manzanita",
]
func bloom(month: String, Trees: wildTree) throws {
    let monthName = bloomingTrees[month] ?? "Figs"
    try Trees.errors(treeName: monthName)
}

var month = wildTree()
month.treeFruitage = 2

do {
    try bloom(month: "February", Trees: month)
} catch TreeError.noFruitage {
    print("Плодов нет.")
} catch TreeError.treeFar {
    print("Дерево далеко.")
} catch TreeError.noTree {
    print("В лесу такого дерева нет.")
}
