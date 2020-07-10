//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by João Tribuzy on 30/06/20.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    withAnimation(.linear) {
                        self.viewModel.choose(card: card)
                    }
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
            Button(action: {
                withAnimation(.easeInOut) {
                    viewModel.resetGame()
                }
            }, label: { Text(LocalizedStringKey("New Game!")) })
                .padding(10)
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View{
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    @State private var animatedBonusRemainig: Double = 0
    
    private func startBonusTimeAnimastion() {
        animatedBonusRemainig = card.bonusRemaining
        withAnimation(.linear(duration: card.bonusTimeRemaining)) {
            animatedBonusRemainig = 0
        }
    }
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View{
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Group {
                    if card.isConsumingBonusTime {
                        Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(-animatedBonusRemainig * 360 - 90), clockwise: true)
                            .onAppear {
                                self.startBonusTimeAnimastion()
                            }
                    } else {
                        Pie(startAngle: Angle.degrees(0 - 90), endAngle: Angle.degrees(-card.bonusRemaining * 360 - 90), clockwise: true)
                    }
                }
                .padding(5)
                .opacity(0.4)
                .transition(.identity)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
            .transition(AnyTransition.scale.animation(.linear(duration: 0.3))) // TODO: Fly away cards !
        }
    }
    
    // MARK: - Drawing Constants
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.7
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
