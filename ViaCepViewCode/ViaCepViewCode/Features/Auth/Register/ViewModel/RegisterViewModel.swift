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
        
        if case .failure(let error) = FormValidatorHelper.isValidName(model.name) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidatorHelper.isEmailValid(model.email) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidatorHelper.isPasswordValid(model.password) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
        }
        
        if case .failure(let error) = FormValidatorHelper.isConfirmPasswordValid(password: model.password, otherPassowrd: model.confirmPassword) {
            delegate.didFailToRegister(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        delegate.didRegister()
    }
}
