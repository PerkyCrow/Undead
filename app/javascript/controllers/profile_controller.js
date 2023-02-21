import BaseController from 'controllers/base_controller'
import {application} from 'controllers/application'


export default class extends BaseController {

    static targets = ['select', 'link']

    profileValueChanged () {
        const {selectTargets, linkTargets, profileValue} = this

        selectTargets.forEach(select => {
            select.value = profileValue
            select.classList.add('changed')
            setTimeout(() => select.classList.remove('changed'), 200)
        })

        linkTargets.forEach(link => {
            link.classList.remove('active')

            if (link.dataset.profile === profileValue) {
                link.classList.add('active')
                link.classList.add('changed')
                setTimeout(() => link.classList.remove('changed'), 200)
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

}
