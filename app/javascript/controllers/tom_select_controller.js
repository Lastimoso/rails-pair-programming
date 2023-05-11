import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select";

export default class extends Controller {
  static targets = ["input"]
  static values = {
    create: Boolean,
    hideSelected: Boolean,
    maxItems: Number,
    maxOptions: Number,
    placeholder: String,
    plugins: Array,
    valueField: String,
    labelField: String,
    searchField: String,
    baseUrl: String,
  }

  connect() {
    console.log("TomSelectController#connect");
    new TomSelect(this.selectable, {
      create: this.hasCreateValue ? this.createValue : true,
      persist: false,
      maxItems: this.hasMaxItemsValue ? this.maxItemsValue : null,
      maxOptions: this.hasMaxOptionsValue ? this.maxOptionsValue : null,
      hideSelected: this.hasHideSelectedValue ? this.hideSelectedValue : true,
      placeholder: this.placeholder,
      plugins: this.pluginsValue,
      hidePlaceholder: true,
      copyClassesToDropdown: false,
      loadThrottle: 300,
      onItemAdd: (_value, _item) => { this.clearInputControl() },
      ...(this.hasValueFieldValue && { valueField: this.valueFieldValue }),
      ...(this.hasLabelFieldValue && { labelField: this.labelFieldValue }),
      ...(this.hasSearchFieldValue && { searchField: this.searchFieldValue }),
      ...(this.hasBaseUrlValue && { load: (query, callback) => { this.getOptions(query, callback) } }),
    });

  }

  // private

  getOptions(query, callback) {
    var url = this.baseUrlValue.replace(/:query/g, encodeURIComponent(query));
    fetch(url).then(response => response.json())
      .then(json => { callback(json); })
      .catch(()=>{  callback(); });
  }

  clearInputControl() {
    const modifiedId = `${this.selectable.id}-tomselected`;
    const inputControl = document.getElementById(modifiedId);
    if (inputControl) { inputControl.value = ""; }
  }

  get selectable() {
    return this.hasInputTarget ? this.inputTarget : this.element
  }

  get placeholder() {
    if (this.hasPlaceholderValue) {
      return this.placeholderValue;
    } else {
      const placeholderText = this.selectable.getAttribute('placeholder');
      return placeholderText ? placeholderText : "Select ...";
    }
  }
}
