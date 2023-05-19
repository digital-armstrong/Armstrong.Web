import { Controller } from '@hotwired/stimulus';
import $ from 'jquery';

export default class extends Controller {
  connect() {
    const $filtrator = $(this.element).attr('data-filtrator-class');
    if ($filtrator != null) this.doFilter(`#${$filtrator}`, $(this.element));
  }

  filter(obj) {
    this.doFilter($(obj.target), obj);
  }

  // eslint-disable-next-line class-methods-use-this
  async doFilter(obj, fullObj) {
    const $obj = $(obj);
    const id = $($obj).val();
    const toFilterId = $obj.attr('data-to-filter-class');
    $.ajax({
      type: 'GET',
      url: `/api/v1/filters?id=${id}`,
      success(data) {
        const $toFilter = $(`#${toFilterId}`);
        $toFilter.prop('disabled', true);
        $toFilter.empty();

        if ($obj.attr('data-filtrator-class') === 'filtrator-class-index') {
          $toFilter.append($('<option/>', { value: '' }).text('Не учитывать'));
        }
        for (let i = 0; i < data.length; i += 1) {
          $toFilter.append($('<option/>', { value: data[i].id }).text(data[i].name));
        }

        const prevMeasurementClassVal = $(fullObj).attr('data-prev-mc-val');
        if (prevMeasurementClassVal != null) {
          $toFilter.val(prevMeasurementClassVal);
        }

        $toFilter.prop('disabled', false);
      },
    });
  }
}
