import React, { useEffect, useState } from 'react';
import ky from 'ky';
import moment from 'moment-timezone';
import 'moment-timezone';
import { sortBy } from 'lodash';
import Table from './Table/Table';
import Filter from './Filter/Filter';
import Modal from './Modal/Modal';

export default function Armstrong() {
  const [data, setData] = useState([]);
  const [filter, setFilter] = useState('');
  const [timeZone, setTimeZone] = useState('');
  const [isModalOpen, setModalOpen] = useState(false);
  const [isChartOpen, setChartOpen] = useState(false);
  const [selectedChannelId, setSelectedChannelId] = useState(0);

  const openModal = (event) => {
    const channelId = event.target.dataset.channelid;
    setSelectedChannelId(channelId);
    setModalOpen(true);
  };
  const closeModal = () => {
    setModalOpen(false);
    setChartOpen(true);
  };

  const hindleConfirm = () => {
    setChartOpen(true);
  };
  const closeChart = () => setChartOpen(false);

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
        serverId: channel.server_id,
        channelId: channel.channel_id,
        name: channel.name,
        deviceModel: channel.device.device_model.name,
        location: channel.room.name,
        locationDescription: channel.location_description,
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
        <Table data={filteredData} openModal={openModal} closeModal={closeModal} />
        {isModalOpen && <Modal closeModal={closeModal} onClose={() => setModalOpen(false)} onConfirm={hindleConfirm} />}
        {isChartOpen && <Modal closeChart={closeChart} channelId={selectedChannelId} onClose={() => setChartOpen(false)} />}
      </div>
    </div>
  );
}
