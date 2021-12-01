import flatpickr from 'flatpickr';

export default {
  DatePicker: {
    mounted() {
      console.log(this.el.dataset.datetime);
      this.fp = flatpickr(this.el, {
        defaultDate: this.el.dataset.datetime,
        enableTime: true,
        altInput: true,
        altFormat: 'm-d-Y H:i',
        dateFormat: 'Z',
      });
    },
    updated() {
      console.log('Updated...');
    },
  },
};
