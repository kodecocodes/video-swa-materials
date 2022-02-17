/// Copyright (c) 2022 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  private struct AnimationData: Equatable {
    let offset: CGSize
    let color: Color

    static let array: [Self]  = [
      .init(
        offset: .init(width: 0, height: 0),
        color: .green
      ),
      .init(
        offset: .init(width: 100, height: 0),
        color: .blue
      ),
      .init(
        offset: .init(width: 100, height: -100),
        color: .red
      ),
      .init(
        offset: .init(width: -100, height: -100),
        color: .orange
      ),
      .init(
        offset: .init(width: -100, height: 0),
        color: .yellow
      )
    ]
  }

  @State private var animationData = AnimationData.array[0]

  var body: some View {
    Circle()
      .scaleEffect(0.5)
      .foregroundColor(animationData.color)
      .animation(.default, value: animationData)
      .offset(animationData.offset)
      .padding()
      .onAppear {
        for (index, data) in AnimationData.array.enumerated().dropFirst() {
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(index)) {
            animationData = data
          }
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
