#include "contiki.h"
#include "net/rime/rime.h"
#include "random.h"
#include <stdio.h>
#include <string.h>

static char gps_coords[32];

PROCESS(border_security_process, "Border Security Sensor");
AUTOSTART_PROCESSES(&border_security_process);

static void broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from) {
  printf("Sensor %d.%d got a message from %d.%d: %s\n",
         linkaddr_node_addr.u8[0], linkaddr_node_addr.u8[1],
         from->u8[0], from->u8[1],
         (char *)packetbuf_dataptr());
}

static const struct broadcast_callbacks broadcast_call = {broadcast_recv};
static struct broadcast_conn broadcast;

PROCESS_THREAD(border_security_process, ev, data)
{
  static struct etimer et;
  PROCESS_EXITHANDLER(broadcast_close(&broadcast);)
  PROCESS_BEGIN();

  broadcast_open(&broadcast, 129, &broadcast_call);

  // Assign fixed GPS based on node ID
  switch(linkaddr_node_addr.u8[0]) {
    case 1: strcpy(gps_coords, "12.9716,77.5946"); break;
    case 2: strcpy(gps_coords, "13.0827,80.2707"); break;
    case 3: strcpy(gps_coords, "19.0760,72.8777"); break;
    case 4: strcpy(gps_coords, "28.7041,77.1025"); break;
    case 5: strcpy(gps_coords, "26.9124,75.7873"); break;
    default: strcpy(gps_coords, "0.0000,0.0000"); break;
  }

  while(1) {
    etimer_set(&et, CLOCK_SECOND * (5 + random_rand() % 5));
    PROCESS_WAIT_EVENT_UNTIL(etimer_expired(&et));

    // 10% chance of intrusion
    if(random_rand() % 10 == 0) {
      char msg[64];
      sprintf(msg, "ALERT: Intrusion at [%s] from Node %d",
              gps_coords, linkaddr_node_addr.u8[0]);
      packetbuf_copyfrom(msg, strlen(msg) + 1);
      broadcast_send(&broadcast);
      printf("%s\n", msg);
    } else {
      printf("Node %d: No intrusion.\n", linkaddr_node_addr.u8[0]);
    }
  }

  PROCESS_END();
}
