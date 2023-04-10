import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'
import ky from 'ky'

export default class extends Controller {
  async filter(obj){
      let id = obj.target.value
      $.ajax({
        type: "GET",
        url: `/api/filters?id=${id}`,
        success: function (data) {
          var $test = $("#test")
          console.log(data)
          $test.empty();
          for(var i = 0; i<data.length; i++){
            $test.append($('<option/>', { value: data[i].id })
            .text(data[i].name))
          }
        }
    })
  }
}