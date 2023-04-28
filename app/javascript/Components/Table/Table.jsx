import React, { useState, useEffect } from "react";
import ky from "ky";

export default function Table() {
  const [channels, setChannels] = useState([]);

  async function getAllChannels() {
    let result = await ky
      .get("/api/v1/armstrong")
      .json();
    setChannels(result);
  }

  const setLoop = async function () {
    const interval = setInterval(() => {
      getAllChannels();
    }, 10000);
    return () => clearInterval(interval);
  }

  useEffect(() => {
    getAllChannels();
    setLoop();
  }, []);

  return (
    <table className="table table-hover">
      <thead>
        <tr>
          <th>State</th>
          <th>SC</th>
          <th>Server</th>
          <th>Channel</th>
          <th>Name</th>
          <th>Device</th>
          <th>Room</th>
          <th>Location</th>
          <th>Value /s</th>
          <th>Value /ns</th>
          <th>Datetime</th>
          <th>Count</th>
        </tr>
      </thead>
      <tbody>
        {channels.map((channel) => (
          <tr key={channel.id}>
            <td>
              {channel.state === "normal"
                ? <i className="bi bi-circle-fill text-success" />
                : <i className="bi bi-circle-fill text-danger" />
              }
            </td>
            <td>
              <input type="checkbox" checked={channel.is_special_control === true ? "checked" : null} />
            </td>
            <td>{channel.server_id}</td>
            <td>{channel.channel_id}</td>
            <td>{channel.name}</td>
            <td>{channel.device_id}</td>
            <td>{channel.room_id}</td>
            <td>{channel.location_description}</td>
            <td>{channel.event_system_value.toExponential(3)}</td>
            <td>{channel.event_not_system_value.toExponential(3)}</td>
            <td>{channel.event_datetime}</td>
            <td>{channel.event_count}</td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}
