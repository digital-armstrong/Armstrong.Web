import React from 'react';
import PropTypes from 'prop-types';
import TableBody from './TableBody';
import TableHead from './TableHead';

export default function Table({ data, openModal }) {
  const columns = [
    { label: 'Chart', accessor: 'chart' },
    { label: 'State', accessor: 'state' },
    { label: 'SC', accessor: 'specialControl' },
    { label: 'Server', accessor: 'serverId' },
    { label: 'Channel', accessor: 'channelId' },
    { label: 'Name', accessor: 'name' },
    { label: 'DB', accessor: 'deviceModel' },
    { label: 'Room', accessor: 'location' },
    { label: 'Description', accessor: 'locationDescription' },
    { label: 'S. value', accessor: 'eventSystemValue' },
    { label: 'Not S. value', accessor: 'eventNotSystemValue' },
    { label: 'Time', accessor: 'eventDatetime' },
    { label: 'Count', accessor: 'eventCount' },
    { label: 'Impulses', accessor: 'eventImpulseValue' },
  ];

  return (
    <div className="table-responsive">
      <table className="table table-hover">
        <caption>Таблица мониторинга системы ARMStrong</caption>
        <TableHead columns={columns} />
        <TableBody columns={columns} data={data} openModal={openModal} />
      </table>
    </div>
  );
}

Table.propTypes = {
  data: PropTypes.arrayOf(
    PropTypes.shape({
      id: PropTypes.number.isRequired,
      serverId: PropTypes.number,
      channelId: PropTypes.number,
      name: PropTypes.string,
      deviceModel: PropTypes.string,
      location: PropTypes.string,
      locationDescription: PropTypes.string,
      eventSystemValue: PropTypes.string,
      eventNotSystemValue: PropTypes.string,
      eventDatetime: PropTypes.string,
      eventCount: PropTypes.number,
      eventImpulseValue: PropTypes.string,
    }),
  ).isRequired,
  openModal: PropTypes.func.isRequired,
};
