//
//  RegisterViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

struct RegisterViewModel {
    weak var delegate: RegisterViewModelDelegate?
    private let unknownErrorMessage = "Erro desconhecido"
    
    func registerUser(_ model: RegisterModel) {
        guard let delegate else { return }
        
        if case .failure(let error) = FormValidator.isValidName(model.name) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidator.isEmailValid(model.email) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidator.isPasswordValid(model.password) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
        }
        
        if case .failure(let error) = FormValidator.isConfirmPasswordValid(password: model.password, otherPassowrd: model.confirmPassword) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        delegate.didRegister()
    }
    
    mutating func setDelegate(_ delegate: RegisterViewModelDelegate) {
        self.delegate = delegate
    }
}
