import { Controller } from "@hotwired/stimulus";
import $ from "jquery";
import ky from "ky";

export default class extends Controller {
  connect() {
    this.doFilter($("#filtrator"));
  }

  filter(obj) {
    this.doFilter(obj.target);
  }

  async doFilter(obj) {
      let $obj = $(obj);
      let id = $($obj).val();
      $.ajax({
        type: "GET",
        url: `/api/v1/filters?id=${id}`,
        success: function (data) {
          var $filter = $("#filter");
          $filter.prop("disabled", true);
          $filter.empty();
          if ($obj.attr("data-info") != undefined) {
            $filter.append($("<option/>", { value: "" }).text("Не учитывать"));
          }
          for (var i = 0; i < data.length; i++) {
            $filter.append(
              $("<option/>", { value: data[i].id }).text(data[i].name)
            );
          }
          $filter.prop("disabled", false);
        },
        failure: function (data) {
          console.log(data);
        },
      });
  }
}
