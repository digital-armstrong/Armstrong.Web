import React, { useState, useEffect } from "react";
import ky from "ky";
import moment from "moment";
import 'moment-timezone';

export default function Table() {
  const [channels, setChannels] = useState([]);
  const [timeZone, setTimeZone] = useState("");
  const [filter, setFilter] = useState('');

  async function getAllChannels() {
    let result = await ky
      .get("/api/v1/armstrong")
      .json();
    setChannels(result);
    console.log(result);
  }

  const setLoop = async function () {
    const interval = setInterval(() => {
      getAllChannels();
    }, 10000);
    return () => clearInterval(interval);
  }

  useEffect(() => {
    setTimeZone(Intl.DateTimeFormat().resolvedOptions().timeZone);
    getAllChannels();
    setLoop();

    return () => {
      console.log("call returned");
      clearInterval(interval);
    }
  }, []);

  const filterItems = (filter) => {
    return filter
      ? channels.filter(i => i.name.includes(filter))
      : channels
  }

  const items = filterItems(filter);

  const filterHandler = (event) => {
    setFilter(event.target.value)
  };

  return (
    <>
      <input className="form-control mt-3"
             type="text"
             placeholder="Имя канала, например ДКЗ-55"
             onChange={filterHandler} />
      <table className="table table-hover">
        <thead>
          <tr>
            <th>Сост.</th>
            <th>СК</th>
            <th>Серв.№</th>
            <th>Кан.№</th>
            <th>Точ. к.</th>
            <th>Модель БД</th>
            <th>Пом.</th>
            <th>Описание</th>
            <th>С.знач</th>
            <th>Не с.знач</th>
            <th>Время</th>
            <th>Кол.</th>
            <th>Имп/с</th>
          </tr>
        </thead>
        <tbody>
          {items.map((item) => (
            <tr key={item.id}>
              <td>
                {item.state === "normal"
                  ? <i className="bi bi-circle-fill text-success" />
                  : <i className="bi bi-circle-fill text-danger" />
                }
              </td>
              <td>
                <input type="checkbox" checked={item.is_special_control === true ? "checked" : null} />
              </td>
              <td>{item.server_id}</td>
              <td>{item.channel_id}</td>
              <td>{item.name}</td>
              <td>{item.device.device_model.name}</td>
              <td>{item.room.name}</td>
              <td>{item.location_description}</td>
              <td>{item.event_system_value.toExponential(3)}</td>
              <td>{item.event_not_system_value.toExponential(3)}</td>
              <td>{moment.tz(item.event_datetime, timeZone).format('HH:mm:SS')}</td>
              <td>{item.event_count}</td>
              <td>{item.event_impulse_value.toExponential(3)}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </>
  );
}
