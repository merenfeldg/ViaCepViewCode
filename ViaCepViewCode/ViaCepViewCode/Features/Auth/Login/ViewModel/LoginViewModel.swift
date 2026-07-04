//
//  LoginViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

struct LoginViewModel {
    weak var state: LoginStateProtocol?
    
    func login(_ model: LoginModel) {
        guard let state else { return }
        
        guard FormValidatorHelper.isEmailValid(model.email) else {
            state.loginFailed(message: "Digite um email válido")
            return
        }
        
        guard FormValidatorHelper.isPasswordValid(model.password) else {
            state.loginFailed(message: "Senha incorreta")
            return
        }
        
        state.loginSuccessed()
    }
}
