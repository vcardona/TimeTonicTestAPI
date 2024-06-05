//
//  UIViewController+Alerts.swift
//  TimeTonicTestAPI
//
//  Created by Victor Cardona on 4/06/24.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert<T: CustomStringConvertible>(with response: T, title: String = "API Response") {
        showAlert(title: title, message: response.description)
    }
    
    func showAlert(with error: Error) {
        showAlert(title: "Error", message: error.localizedDescription)
    }
}

// Conform CustomStringConvertible for each response type
extension CreateAppkeyResponse: CustomStringConvertible {
    var description: String {
        return """
        Status: \(status)
        Appkey: \(appkey)
        ID: \(id)
        CreatedVNB: \(createdVNB)
        Req: \(req)
        """
    }
}

extension CreateOauthkeyResponse: CustomStringConvertible {
    var description: String {
        return """
        Status: \(status)
        Oauthkey: \(oauthkey)
        ID: \(id)
        O_U: \(o_u)
        CreatedVNB: \(createdVNB)
        Req: \(req)
        """
    }
}

extension CreateSesskeyResponse: CustomStringConvertible {
    var description: String {
        return """
        Status: \(status)
        Sesskey: \(sesskey)
        ID: \(id)
        Restrictions: \(restrictions)
        AppName: \(appName)
        CreatedVNB: \(createdVNB)
        Req: \(req)
        """
    }
}

extension GetAllBooksResponse: CustomStringConvertible {
    var description: String {
        let booksList = allBooks.books.map { "\($0.ownerPrefs?.title ?? "Unknown Title")" }.joined(separator: "\n")
        return """
        Status: \(status)
        Books:
        \(booksList)
        """
    }
}

