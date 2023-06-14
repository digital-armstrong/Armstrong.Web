import React from 'react';
import PropTypes from 'prop-types';

export default function Modal({ closeModal }) {
  return (
    <div
      style={{
        position: 'fixed',
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        backgroundColor: 'white',
        padding: '1em',
        zIndex: 1000,
      }}
    >
      <h2>Modal Window</h2>
      <p>This is a modal window.</p>
      <button type="button" className="btn btn-light" onClick={closeModal}>
        Close
      </button>
    </div>
  );
}

Modal.propTypes = {
  closeModal: PropTypes.func.isRequired,
};
