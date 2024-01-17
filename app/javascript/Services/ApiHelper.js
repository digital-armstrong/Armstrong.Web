import ky from 'ky';

export default async function ApiHelper(route) {
  const data = ky.get(route).json();
  return data;
}
