//
//  MemoryGame.swift
//  MatchGameApp
//
//  Created by 박지영 and 윤지민 on 2021/07/09.
//

import Foundation

struct Card {
    var open : Bool?
    let number : Int
}

class MemoryGame: ObservableObject {
    struct dimen {
        static let cols = 4
        static let rows = 5
    }
    var openIndex : Int?
    
    @Published var cards: [Card] = []
    @Published var flips = 0
    init() {
        start()
    }
    func start(){
        cards = []
        let max_num = dimen.cols * dimen.rows / 2
        for n in 1 ... max_num{
            cards.append(Card(open: false, number: n))
            cards.append(Card(open: false, number: n))
        }
        cards.shuffle()
        // cards = cards.shuffled  -> shuffled는 suffler과 똑같은데 새로운 함수 만들어냄
        flips = 0
        openIndex = nil
    }
    func card(row: Int, col: Int)-> Card {
        cards[row * dimen.cols + col]
    }
    func toggle(row: Int, col: Int) {
        let index = row * dimen.cols + col
        let card = cards[index]
        if card.open == nil || card.open! { return }
        
        cards[index].open!.toggle()
        guard let oidx = openIndex else {
            openIndex = index
            flips += 1
            return
        }
        let openCard = cards[oidx]
        if openCard.number != card.number{
            cards[oidx].open = false
            openIndex = index
            flips += 1
            return
        }
        
        remove(at: index)
        remove(at: openIndex!)
        openIndex = nil
    }
    func remove(at index: Int){
        cards[index].open = nil
    }
}
