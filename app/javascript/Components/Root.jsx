import React, { useEffect } from 'react';
import Armstrong from './Armstrong/Armstrong';

export default function Root() {
  useEffect(() => {
    document.body.setAttribute('data-turbo', 'false');
    return () => {
      document.body.removeAttribute('data-turbo');
    };
  }, []);

  return <Armstrong />;
}
