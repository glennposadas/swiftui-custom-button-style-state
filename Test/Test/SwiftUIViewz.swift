import SwiftUI

struct MyButton: View {
  let title: String
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(self.title)
        .padding()
    }.buttonStyle(MyButtonStyle())
  }
}

struct SwiftUIViewz: View {
  @State var isSelected = false

  var body: some View {
    MyButton(title: "BBcccc") {
      isSelected.toggle()
    }
    .environment(\.isSelected, isSelected)
  }
}

private struct MyButtonKey: EnvironmentKey {
  static let defaultValue: Bool = false
}

extension EnvironmentValues {
  var isSelected: Bool {
    get { self[MyButtonKey.self] }
    set { self[MyButtonKey.self] = newValue }
  }
}

struct SwiftUIViewz_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIViewz()
  }
}

extension Color {
  static let defaultBlue = Color(red: 0, green: 97 / 255.0, blue: 205 / 255.0)
  static let paleBlue = Color(red: 188 / 255.0, green: 224 / 255.0, blue: 253 / 255.0)
  static let paleWhite = Color(white: 1, opacity: 179 / 255.0)
}

struct MyButtonStyle: ButtonStyle {
  func makeBody(configuration: Self.Configuration) -> some View {
    MyButtonStyleView(configuration: configuration)
  }
}

private extension MyButtonStyle {
  struct MyButtonStyleView: View {
    @Environment(\.isSelected) var isSelected
    let configuration: MyButtonStyle.Configuration

    var body: some View {
      return configuration.label
        .foregroundColor(isSelected ? .white : .paleWhite)
        .background(RoundedRectangle(cornerRadius: 5)
          .fill(isSelected ? Color.defaultBlue : Color.paleBlue)
        )
        .opacity(configuration.isPressed ? 0.8 : 1.0)
        .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
  }
}
