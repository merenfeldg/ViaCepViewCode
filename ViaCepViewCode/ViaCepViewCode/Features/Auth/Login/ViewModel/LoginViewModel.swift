//
//  LoginViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

struct LoginViewModel {
    weak var state: LoginStateProtocol?
    private let unknownErrorMessage = "Erro desconhecido"
    
    func login(_ model: LoginModel) {
        guard let state else { return }
        
        if case .failure(let error) = FormValidatorHelper.isEmailValid(model.email) {
            state.loginFailed(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidatorHelper.isPasswordValid(model.password) {
            state.loginFailed(message: error.errorDescription ?? unknownErrorMessage)
        }
        
        state.loginSuccessed()
    }
}
