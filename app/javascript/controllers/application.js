import {Application} from '@hotwired/stimulus'
import {saveData, getData, setDefaultData} from '../libs/storage'


const application = Application.start()
window.Stimulus   = application


Object.assign(application, {
    debug: false,

    name:  'undead',

    storageKey (key) {
        return `${this.name}_${key}`
    },

    saveData (key, value) {
        saveData(this.storageKey(key), value)
    },

    getData (key) {
        return getData(this.storageKey(key))
    },

    setDefaultData (key, value) {
        setDefaultData(this.storageKey(key), value)
    },

    updateProfile (profile) {
        this.saveData('profile', profile)
        const event = new CustomEvent('profile-changed', {
            detail: {profile}
        })

        window.dispatchEvent(event)
    }
})


application.setDefaultData('profile', 'Beginner')



export {application}
