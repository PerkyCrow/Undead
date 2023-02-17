import {Controller} from '@hotwired/stimulus'
import {application} from './application'



export default class extends Controller {

    static targets = ['curious', 'beginner', 'developer']

    static values = {
        profile: {type: String, default: application.getData('profile')}
    }

    connect () {
        this.updateListener = this.update.bind(this)
        window.addEventListener('profile-changed', this.update.bind(this))
    }

    disconnect () {
        window.removeEventListener('profile-changed', this.update.bind(this))
    }

    profileValueChanged () {
        const {targets} = this.constructor
        const profile   = this.profileValue.toLowerCase()

        targets.forEach(name => this[`${name}Targets`].forEach(hide))

        this[`${profile}Targets`].forEach(show)

        // maybe ?
        // if (profile === 'beginner') {
        //     this.developerTargets.forEach(show)
        // }
    }

    update (event) {
        this.profileValue = event.detail.profile
    }

}


function hide (target) {
    target.classList.add('hidden')
}


function show (target) {
    target.classList.remove('hidden')
}
