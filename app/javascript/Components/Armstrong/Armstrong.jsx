import React, { useEffect, useState } from "react";
import ky from "ky";
import moment from "moment-timezone";
import "moment-timezone";
import { sortBy } from "lodash";
import Table from "./Table/Table";
import Filter from "./Filter/Filter";

export default function Armstrong() {
  const [data, setData] = useState([]);
  const [filter, setFilter] = useState("");
  const [timeZone, setTimeZone] = useState("");

  useEffect(() => {
    setTimeZone(Intl.DateTimeFormat().resolvedOptions().timeZone);
    getData();
    setLoop();

    return () => {
      console.log("call returned");
      clearInterval(interval);
    };
  }, []);

  async function getData() {
    let result = await ky.get("/api/v1/armstrong").json();
    setData(normalizeData(sortBy(result, ["server_id", "channel_id"])));
    console.log(result);
  }

  const normalizeData = (data) => {
    let normAndSortedDate = [];

    data.map((channel) => {
      normAndSortedDate.push({
        state:
          channel.state === "normal" ? (
            <i className="bi bi-circle-fill text-success" />
          ) : (
            <i className="bi bi-circle-fill text-danger" />
          ),
        specialControl: (
          <input
            type="checkbox"
            checked={channel.is_special_control === true ? "checked" : null}
          />
        ),
        id: channel.id,
        serverId: channel.server_id,
        channelId: channel.channel_id,
        name: channel.name,
        deviceModel: channel.device.device_model.name,
        location: channel.room.name,
        locationDescription: channel.location_description,
        eventSystemValue: channel.event_system_value.toExponential(3),
        eventNotSystemValue: channel.event_not_system_value.toExponential(3),
        eventDatetime: moment.tz(channel.event_datetime, timeZone).format("HH:mm:SS"),
        eventCount: channel.event_count,
        eventImpulseValue: channel.event_impulse_value.toExponential(3),
      });
    });

    return normAndSortedDate;
  };

  const setLoop = async function () {
    const interval = setInterval(() => {
      getData();
    }, 10000);
    return () => clearInterval(interval);
  };

  const handleFilterChange = (event) => {
    setFilter(event.target.value);
  };

  const filteredData = data.filter(
    (item) =>
      item.name.toLowerCase().includes(filter.toLowerCase()) ||
      item.deviceModel.toLowerCase().includes(filter.toLowerCase()) ||
      String(item.serverId).toLowerCase().includes(filter.toLowerCase())
  );

  return (
    <>
      <div className="row mx-0">
        <div className="col-2 ps-0">
          <Filter filter={filter} onFilterChange={handleFilterChange} />
        </div>
        <div className="col-10 shadow rounded mb-4">
          <Table data={filteredData} />
        </div>
      </div>
    </>
  );
}
