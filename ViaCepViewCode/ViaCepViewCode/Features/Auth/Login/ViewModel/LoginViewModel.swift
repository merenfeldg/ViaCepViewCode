//
//  LoginViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

struct LoginViewModel {
    weak var delegate: LoginViewModelDelegate?
    private let unknownErrorMessage = "Erro desconhecido"
    
    func login(_ model: LoginModel) {
        guard let delegate else { return }
        
        if case .failure(let error) = FormValidatorHelper.isEmailValid(model.email) {
            delegate.didFailToLogin(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidatorHelper.isPasswordValid(model.password) {
            delegate.didFailToLogin(message: error.errorDescription ?? unknownErrorMessage)
        }
        
        delegate.didLogin()
    }
    
    mutating func setDelegate(_ delegate: LoginViewModelDelegate) {
        self.delegate = delegate
    }
}
