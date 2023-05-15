import React from "react";
import TableBody from "./TableBody";
import TableHead from "./TableHead";

export default function Table({data}) {
  const columns = [
    { label: "State", accessor: "state" },
    { label: "SC", accessor: "specialControl" },
    { label: "Server", accessor: "serverId" },
    { label: "Channel", accessor: "channelId" },
    { label: "Name", accessor: "name" },
    { label: "DB", accessor: "deviceModel" },
    { label: "Room", accessor: "location" },
    { label: "Description", accessor: "locationDescription" },
    { label: "S. value", accessor: "eventSystemValue" },
    { label: "Not S. value", accessor: "eventNotSystemValue" },
    { label: "Time", accessor: "eventDatetime" },
    { label: "Count", accessor: "eventCount" },
    { label: "Impulses", accessor: "eventImpulseValue" },
  ];

  return (
    <>
      <table className="table table-hover">
        <caption>Таблица мониторинга системы ARMStrong</caption>
        <TableHead columns={columns} />
        <TableBody columns={columns} data={data} />
      </table>
    </>
  );
}
