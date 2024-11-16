import { Application } from "@hotwired/stimulus"
import {cards} from "../cards"
const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
