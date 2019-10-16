document.addEventListener('turbolinks:load', function () {
    let control = document.querySelectorAll('input[type=password]')
    
    if (control) { Array.from(control).forEach(password => {password.addEventListener('input', checkConfPassword)}) }
})

function checkConfPassword() {
    let form = document.querySelector('form')
    let pass_input_1 = form.querySelector('#user_password')
    let pass_input_2 = form.querySelector('#user_password_confirmation')
    let password1 = pass_input_1.value
    let password2 = pass_input_2.value

    if (password2 === password1) {
        pass_input_1.classList.remove('is-invalid')
        pass_input_2.classList.remove('is-invalid')
        pass_input_1.classList.add('is-valid')
        pass_input_2.classList.add('is-valid')
    } else if (password2.length === 0) {
        pass_input_1.classList.remove('is-invalid')
        pass_input_2.classList.remove('is-invalid')
        pass_input_1.classList.remove('is-valid')
        pass_input_2.classList.remove('is-valid')
    } else {
        pass_input_1.classList.remove('is-valid')
        pass_input_2.classList.remove('is-valid')
        pass_input_1.classList.add('is-invalid')
        pass_input_2.classList.add('is-invalid')
    }
}
