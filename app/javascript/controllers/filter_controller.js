import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["resetButton"]

  connect() {
    this.toggleResetButton()
  }

  submit() {
    this.toggleResetButton()
    this.element.requestSubmit()
  }

  search() {
    this.toggleResetButton()
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      this.element.requestSubmit()
    }, 250)
  }

  reset(event) {
    event.preventDefault()
    this.element.querySelectorAll("input[type=text], input[type=search]").forEach(input => input.value = "")
    this.element.querySelectorAll("select").forEach(select => select.selectedIndex = 0)
    this.toggleResetButton()
    this.element.requestSubmit()
  }

  toggleResetButton() {
    if (!this.hasResetButtonTarget) return
    const hasValues = Array.from(this.element.elements).some(el => {
      if ((el.tagName === "INPUT" && (el.type === "text" || el.type === "search")) && el.value.trim() !== "") return true
      if (el.tagName === "SELECT" && el.value !== "") return true
      return false
    })
    this.resetButtonTarget.style.display = hasValues ? "inline-flex" : "none"
  }
}
