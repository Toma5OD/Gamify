//
//  LoginView.swift
//  Gamify
//
//  Created by Tomás Ó Dálaigh on 03/12/2023.
//

import SwiftUI

struct LoginView: UIViewControllerRepresentable {
    @Binding var isLoggedIn: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        LoginViewController(loginStatus: $isLoggedIn)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}

