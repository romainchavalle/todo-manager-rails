import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["email", "password"]

  fillManager(event) {
    event.preventDefault()
    this.emailTarget.value = "manager@example.com"
    this.passwordTarget.value = "password123"
  }

  fillEmployee(event) {
    event.preventDefault()
    this.emailTarget.value = "alice@example.com"
    this.passwordTarget.value = "password123"
  }
}
