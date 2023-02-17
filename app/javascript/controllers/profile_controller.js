import {Controller} from '@hotwired/stimulus'
import {application} from './application'



export default class extends Controller {

    static targets = ['select', 'link']

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
        const {selectTargets, linkTargets, profileValue} = this

        selectTargets.forEach(select => {
            select.value = profileValue
        })

        linkTargets.forEach(link => {
            link.classList.remove('active')

            if (link.dataset.profile === profileValue) {
                link.classList.add('active')
            }
        })
    }

    select (event) {
        application.updateProfile(event.currentTarget.value)
    }

    choose (event) {
        event.preventDefault()
        application.updateProfile(event.currentTarget.dataset.profile)
    }

    update (event) {
        this.profileValue = event.detail.profile
    }

}
