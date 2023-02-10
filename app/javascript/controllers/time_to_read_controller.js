import {Controller} from "@hotwired/stimulus"
import getReadingTime from "../libs/reading_time.js"


export default class extends Controller {
    connect() {
        const readingTime = getReadingTime(this.element.parentElement.innerText)
        this.element.textContent = `${readingTime}min`
    }
}
