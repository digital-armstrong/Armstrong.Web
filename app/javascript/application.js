// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "./custom_actions/dispatch_event"
import * as bootstrap from "bootstrap"
import LocalTime from "local-time"
LocalTime.config.i18n["ru"] = {
  formats: {
      default: "%d.%m.%Y",
      short: "%d %b",
      long: "%d %B %Y",
  },
  date: {
    dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
    standaloneMonthNames: ["Январь", "Февраль", "Март", "Апрель", "Май", "Июнь", "Июль", "Август", "Сентябрь", "Октябрь", "Ноябрь", "Декабрь"],
    monthNames: ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"]
  }
}
if(I18n != "ru") LocalTime.config.locale = "en"
else LocalTime.config.locale = "ru"
LocalTime.start()