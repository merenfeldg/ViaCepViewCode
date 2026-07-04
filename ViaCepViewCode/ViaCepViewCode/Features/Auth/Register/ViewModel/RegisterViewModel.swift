//
//  RegisterViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

struct RegisterViewModel {
    weak var state: RegisterStateProtocol?
    
    func registerUser(_ model: RegisterModel) {
        guard let state else { return }
        
        guard FormValidatorHelper.isValidName(model.name) else {
            state.registerFailed(message: "Digite um nome válido")
            return
        }
        
        guard FormValidatorHelper.isEmailValid(model.email) else {
            state.registerFailed(message: "Digite um email válido")
            return
        }
        
        guard FormValidatorHelper.isPasswordValid(model.password) else {
            state.registerFailed(message: "Senha incorreta")
            return
        }
        
        guard model.password == model.confirmPassword else {
            state.registerFailed(message: "As senhas não coincidem")
            return
        }
        
        state.registerSuccessed()
    }
}
