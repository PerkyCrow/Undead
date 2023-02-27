import BaseController from 'controllers/base_controller'


export default class extends BaseController {

    static targets = ['curious', 'beginner', 'developer']

    profileValueChanged () {
        const {targets} = this.constructor
        const profile   = this.profileValue.toLowerCase()

        targets.forEach(name => this[`${name}Targets`].forEach(hide))

        this[`${profile}Targets`].forEach(show)
    }

}


function hide (target) {
    target.classList.add('hidden_content')
}


function show (target) {
    target.classList.remove('hidden_content')
}
