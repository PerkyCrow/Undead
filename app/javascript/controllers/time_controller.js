import BaseController from './base_controller'
import getReadingTime from '../libs/reading_time.js'


export default class extends BaseController {

    connect () {
        super.connect()
        setTimeout(this.updateTime.bind(this))
    }

    updateTime () {
        const readingTime = getReadingTime(this.element.parentElement.innerText)
        this.element.textContent = `${readingTime}min`
    }

    profileValueChanged () {
        setTimeout(this.updateTime.bind(this))
    }

}
