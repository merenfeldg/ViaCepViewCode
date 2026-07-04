//
//  RegisterViewModel.swift
//  ViaCepViewCode
//
//  Created by Gabriel Merenfeld on 04/07/26.
//

struct RegisterViewModel {
    weak var state: RegisterStateProtocol?
    private let unknownErrorMessage = "Erro desconhecido"
    
    func registerUser(_ model: RegisterModel) {
        guard let state else { return }
        
        if case .failure(let error) = FormValidatorHelper.isValidName(model.name) {
            state.registerFailed(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidatorHelper.isEmailValid(model.email) {
            state.registerFailed(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        if case .failure(let error) = FormValidatorHelper.isPasswordValid(model.password) {
            state.registerFailed(message: error.errorDescription ?? unknownErrorMessage)
        }
        
        if case .failure(let error) = FormValidatorHelper.isConfirmPasswordValid(password: model.password, otherPassowrd: model.confirmPassword) {
            state.registerFailed(message: error.errorDescription ?? unknownErrorMessage)
            return
        }
        
        state.registerSuccessed()
    }
}
