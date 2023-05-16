import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import ky from "ky";

export default class extends Controller {
  connect() {
    let $filtrator = $(this.element).attr("data-filtrator-class");
    if ($filtrator != null) this.doFilter(`#${$filtrator}`, $(this.element));
  }

  filter(obj) {
    this.doFilter($(obj.target), obj);
  }

  async doFilter(obj, fullObj) {
    let $obj = $(obj);
    let id = $($obj).val();
    let to_filter_id = $obj.attr("data-to-filter-class");
    $.ajax({
      type: "GET",
      url: `/api/v1/filters?id=${id}`,
      success: function (data) {
        var $to_filter = $(`#${to_filter_id}`);
        $to_filter.prop("disabled", true);
        $to_filter.empty();
        
        if ($obj.attr("data-filtrator-class") == "filtrator-class-index") {
          $to_filter.append($("<option/>", { value: "" }).text("Не учитывать"));
        }
        for (var i = 0; i < data.length; i++) {
          $to_filter.append(
            $("<option/>", { value: data[i].id }).text(data[i].name)
          );
        }

        let prevMeasurementClassVal = $(fullObj).attr("data-prev-mc-val");
        if (prevMeasurementClassVal != null) {
          $to_filter.val(prevMeasurementClassVal);
        }

        $to_filter.prop("disabled", false);
      },
      failure: function (data) {
        console.log(data);
      },
    });
  }
}
