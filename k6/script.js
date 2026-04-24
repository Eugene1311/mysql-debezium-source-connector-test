import sql from 'k6/x/sql';
import driver from 'k6/x/sql/driver/mysql';

const db = sql.open(driver, 'user:password@tcp(localhost:3306)/inventory');

export const options = {
  scenarios: {
    devices: {
      executor: 'constant-vus',
      vus: 50,
      duration: '2m',
    },
  },
};

export function setup() {
}

export default function () {
  db.exec("INSERT INTO device(name) VALUES ('Test device');");
}

export function teardown() {
  db.close();
}
