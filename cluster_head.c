#include "contiki.h"
#include "net/rime/rime.h"
#include <stdio.h>
#include <string.h>

PROCESS(cluster_head_process, "Cluster Head");
AUTOSTART_PROCESSES(&cluster_head_process);

static struct broadcast_conn broadcast;

static void broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from) {
  char buf[128];
  sprintf(buf, "FORWARD from %d.%d: %s",
          from->u8[0], from->u8[1],
          (char *)packetbuf_dataptr());
  packetbuf_copyfrom(buf, strlen(buf) + 1);
  broadcast_send(&broadcast);
  printf("Cluster Head forwarded: %s\n", buf);
}

static const struct broadcast_callbacks broadcast_call = {broadcast_recv};

PROCESS_THREAD(cluster_head_process, ev, data)
{
  PROCESS_EXITHANDLER(broadcast_close(&broadcast);)
  PROCESS_BEGIN();

  broadcast_open(&broadcast, 129, &broadcast_call);

  while(1) {
    PROCESS_WAIT_EVENT();
  }

  PROCESS_END();
}
