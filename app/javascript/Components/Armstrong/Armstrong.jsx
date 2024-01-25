import React, { useEffect, useState } from 'react';
import ky from 'ky';
import moment from 'moment-timezone';
import 'moment-timezone';
import { sortBy } from 'lodash';
import Table from './Table/Table';
import Filter from './Filter/Filter';
import ModalComponent from './Modal/ModalComponent';

export default function Armstrong() {
  const [data, setData] = useState([]);
  const [filter, setFilter] = useState('');
  const [timeZone, setTimeZone] = useState('');
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [selectedId, setSelectedId] = useState(0);
  const [selectedPointName, setSelectedPointName] = useState('');

  const openModal = (event) => {
    setSelectedId(event.currentTarget.dataset.id);
    setSelectedPointName(event.currentTarget.dataset.pointname);
    setIsModalOpen(true);
  };

  const setChannelColor = (state) => {
    switch (state) {
      case 'normal':
        return <i className="bi bi-circle-fill text-success" />;
      case 'warning':
        return <i className="bi bi-circle-warning" />;
      case 'danger':
        return <i className="bi bi-circle-fill text-danger" />;
      default:
        return <i className="bi bi-circle-fill text-primary" />;
    }
  };

  const normalizeData = (rawData) => {
    const normAndSortedDate = [];

    rawData.forEach((channel) => {
      normAndSortedDate.push({
        state: setChannelColor(channel.state),
        specialControl: <input type="checkbox" checked={channel.is_special_control === true ? 'checked' : null} />,
        id: channel.id,
        serverId: channel.server.id,
        channelId: channel.channel_id,
        name: channel.control_point.name,
        deviceModel: channel.control_point.device.device_model.name,
        location: channel.control_point.room.name,
        locationDescription: channel.control_point.description,
        eventSystemValue: channel.event_system_value.toExponential(3),
        eventNotSystemValue: channel.event_not_system_value.toExponential(3),
        eventDatetime: moment.tz(channel.event_datetime, timeZone).format('HH:mm:SS'),
        eventCount: channel.event_count,
        eventImpulseValue: channel.event_impulse_value.toExponential(3),
      });
    });

    return normAndSortedDate;
  };

  async function getData() {
    const result = await ky.get('/api/v1/armstrong').json();
    setData(normalizeData(sortBy(result, ['server_id', 'channel_id'])));
  }

  const setLoop = async () => {
    const interval = setInterval(() => {
      getData();
    }, 10000);
    return () => clearInterval(interval);
  };

  useEffect(() => {
    setTimeZone(Intl.DateTimeFormat().resolvedOptions().timeZone);
    getData();
    setLoop();

    return () => {
      // eslint-disable-next-line no-undef
      clearInterval(interval);
    };
  }, []);

  const handleFilterChange = (event) => {
    setFilter(event.target.value);
  };

  const filteredData = data.filter(
    (item) =>
      item.name.toLowerCase().includes(filter.toLowerCase()) ||
      item.deviceModel.toLowerCase().includes(filter.toLowerCase()) ||
      String(item.serverId).toLowerCase().includes(filter.toLowerCase()),
  );

  return (
    <div className="row mx-0">
      <div className="shadow rounded mb-4 pt-3">
        <Filter className="ps-0 pe-0 mb-3" filter={filter} onFilterChange={handleFilterChange} />
        <Table data={filteredData} openModal={openModal} />
        {isModalOpen && (
          <ModalComponent
            selectedId={selectedId}
            pointName={selectedPointName}
            show={isModalOpen}
            handleClose={() => setIsModalOpen(false)}
          />
        )}
      </div>
    </div>
  );
}
