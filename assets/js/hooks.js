import flatpickr from 'flatpickr';

export default {
  DatePicker: {
    mounted() {
      this.fp = flatpickr(this.el, {
        defaultDate: this.el.dataset.datetime,
        enableTime: true,
        altInput: true,
        altFormat: 'm-d-Y H:i',
        dateFormat: 'Z',
      });
      // Adds event listener to reset link to reset this field to
      // its default value
      let el = document.getElementById('reset-filters');
      el.addEventListener('click', this.resetInput.bind(this));
    },
    resetInput() {
      this.fp.setDate(this.el.dataset.datetime);
    },
  },
};
