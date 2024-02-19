import React from 'react';
import PropTypes from 'prop-types';

export default function Filter({ filter, onFilterChange }) {
  return (
    <div>
      <input
        className="form-control rounded mb-2"
        type="text"
        placeholder="Поиск..."
        value={filter}
        onChange={onFilterChange}
      />
    </div>
  );
}

Filter.propTypes = {
  filter: PropTypes.string.isRequired,
  onFilterChange: PropTypes.func.isRequired,
};
