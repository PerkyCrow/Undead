import hljs from 'highlight.js'
import {Controller} from '@hotwired/stimulus'




export default class extends Controller {

    static targets = ['code', 'copy']

    connect () {
        this.sourceCode = this.codeTarget.innerText
        hljs.highlightElement(this.codeTarget)
    }

    copy () {
        navigator.clipboard.writeText(this.sourceCode)
        this.copyTarget.classList.add('copied')
        setTimeout(() => this.copyTarget.classList.remove('copied'), 150)
    }

}
