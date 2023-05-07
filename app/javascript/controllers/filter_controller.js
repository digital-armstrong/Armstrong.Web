import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import ky from "ky";

export default class extends Controller {
  connect() {
    let $filtrator = $(this.element).attr('data-filtrator-class')
    this.doFilter(`#${$filtrator}`);
  }

  disconnect() {
  }

  filter(obj) {
    this.doFilter($(obj.target));
  }

  async doFilter(obj) {
    console.log(obj)
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
          if ($obj.attr("data-filtrator-class") == 'filtrator-class-index') {
            $to_filter.append($("<option/>", { value: "" }).text("Не учитывать"));
          }
          for (var i = 0; i < data.length; i++) {
            $to_filter.append(
              $("<option/>", { value: data[i].id }).text(data[i].name)
            );
          }
          $to_filter.prop("disabled", false);
        },
        failure: function (data) {
          console.log(data);
        },
      });
  }
}
