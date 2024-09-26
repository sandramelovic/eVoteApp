import UIKit

class KeyboardHandler {
    private weak var view: UIView?

    init(view: UIView) {
        self.view = view
        addKeyboardObservers()
    }

    deinit {
        removeKeyboardObservers()
    }

    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
              let view = view else {
            return
        }
        let keyboardHeight = keyboardFrame.height
        view.frame.origin.y = -keyboardHeight + 50
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        view?.frame.origin.y = 0
    }
}
