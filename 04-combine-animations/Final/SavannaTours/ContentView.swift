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

struct ContentView : View {
  @State var zoomed = false

  var body: some View {
    VStack(spacing: 0) {
      Image("hero")
        .resizable()
        .edgesIgnoringSafeArea(.top)
        .frame(height: 300)
      
      ZStack(alignment: .leading) {
        VStack(alignment: .leading) {
          Text("Savanna Trek")
            .font(.largeTitle)
            .fontWeight(.bold)
            .shadow(radius: 5)
            .foregroundColor(.white)

          Text("15-mile drive followed by an hour-long trek")
            .font(.caption)
            .foregroundColor(.white)
        }
        .offset(
          x: zoomed ? 500 : 30,
          y: -30
        )
        // MARK: - Update deprecated `animation` modifier
        //        .animation(.default)
        // Animate when `zoomed` changes
        .animation(.default, value: zoomed)

        GeometryReader { geometry in
          Image("thumb")
            .clipShape(
              RoundedRectangle(cornerRadius: zoomed ? 40 : 500)
            )
            .overlay(
              Circle()
                .fill(
                  zoomed
                  ? Color.clear
                  : Color(white: 1, opacity: 0.4)
                )
                .scaleEffect(0.8)
            )
            .saturation(zoomed ? 1 : 0)
            .position(
              x: zoomed ? geometry.frame(in: .local).midX : 600,
              y: 50
            )
            .scaleEffect((zoomed ? 4 : 1) / 3)
            .shadow(radius: 10)
          // MARK: - Update deprecated `animation` modifier
          //        .animation(.spring())
          // Animate when `zoomed` changes
            .animation(.spring(), value: zoomed)
            .onTapGesture { zoomed.toggle() }
        }
      }
      .background(Color(white: 0.1))
      
      List(0...4, id: \.self) { index in
        VStack(alignment: .leading) {
          Text("Milestone #\(index + 1)")
            .font(.title)
          HStack(alignment: .lastTextBaseline) {
            Text("Savanna National Park (\(index * 12 + 5)km)")
              .font(.subheadline)
            Image(systemName: "pin")
            Spacer()
            Text("South Africa")
              .font(.subheadline)
          }
        }
        .padding()
      }
    }
  }
}

struct ContentView_Previews : PreviewProvider {
  static var previews: some View { ContentView() }
}
