#include "contiki.h"
#include "net/rime/rime.h"
#include "random.h"
#include <stdio.h>
#include <string.h>

PROCESS(gateway_process, "Gateway AI");
AUTOSTART_PROCESSES(&gateway_process);

static struct broadcast_conn broadcast;

const char *classes[] = {"Human", "Animal", "Vehicle"};

static void broadcast_recv(struct broadcast_conn *c, const linkaddr_t *from) {
  char msg[128];
  strcpy(msg, (char *)packetbuf_dataptr());

  // Classify randomly
  const char *cls = classes[random_rand() % 3];
  printf("GATEWAY RECEIVED: %s → Classified as %s\n", msg, cls);
}

static const struct broadcast_callbacks broadcast_call = {broadcast_recv};

PROCESS_THREAD(gateway_process, ev, data)
{
  PROCESS_EXITHANDLER(broadcast_close(&broadcast);)
  PROCESS_BEGIN();

  broadcast_open(&broadcast, 129, &broadcast_call);

  while(1) {
    PROCESS_WAIT_EVENT();
  }

  PROCESS_END();
}
