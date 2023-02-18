import {Controller} from '@hotwired/stimulus'
import {application} from './application'



export default class extends Controller {

    static values = {
        profile: {type: String, default: application.getData('profile')}
    }

    connect () {
        this.profileValue = application.getData('profile')
        this.updateListener = this.update.bind(this)
        window.addEventListener('profile-changed', this.update.bind(this))
    }

    disconnect () {
        window.removeEventListener('profile-changed', this.update.bind(this))
    }

    update (event) {
        this.profileValue = event.detail.profile
    }

}
