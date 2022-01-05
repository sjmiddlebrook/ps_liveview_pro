import Alpine from 'alpinejs';
window.Alpine = Alpine;
Alpine.start();

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import 'phoenix_html';
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from 'phoenix';
import { LiveSocket } from 'phoenix_live_view';

import './second';
import btc from '../logos/btc.svg';

let csrfToken = document
  .querySelector("meta[name='csrf-token']")
  .getAttribute('content');
let liveSocket = new LiveSocket('/live', Socket, {
  params: { _csrf_token: csrfToken },
});

// connect if there are any LiveViews on the page
liveSocket.connect();

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket;

const app = document.querySelector('#app');
if (app) {
  app.innerHTML = `
  <h1 class="text-3xl font-bold">Home Page</h1>
  <img class="h-8 w-8" src="${btc}">
`;
}
