import sys
import json
import requests


class BrokerInfo:
  
  def __init__(self, host: str, port: int, user: str, password: str):
    self.host = host
    self.port = port
    self.user = user
    self.password = password

def get_definitions(broker: BrokerInfo): 
    print(f"{broker.host}:{broker.port} - Downloading definitions")
    url = f"http://{broker.host}:{broker.port}/api/definitions"
    resp = requests.get(url, auth=(broker.user, broker.password))
    if resp.status_code != 200:
        print(f"[ERROR] Failed to get definitions: {resp.status_code} {resp.text}")
        sys.exit(1)
    print(resp.text)
    return resp.json()


def import_definitions(broker: BrokerInfo, definitions: dict):
    print(f"{broker.host}:{broker.port} - importing definitions")
    url = f"http://{broker.host}:{broker.port}/api/definitions"
    headers = {"Content-Type": "application/json"}
    resp = requests.post(url, auth=(broker.user, broker.password),
                         headers=headers, data=json.dumps(definitions))
    if resp.status_code != 204:
        print(f"[ERROR] Failed to import definitions: {resp.status_code} {resp.text}")
        sys.exit(1)
    print("[+] Definitions successfully imported to Amazon MQ")

def normalize_bindings(bindings) -> set:
    bindings_normalized = set()
    for binding in bindings:
        bindings_normalized.add(f"binding:{binding['source']}-{binding['destination']}-{binding['destination_type']}-{binding['routing_key']}")
    return bindings_normalized

def normalize_exchanges(exchanges) -> set:
    exchanges_normalized = set()
    for exchange in exchanges:
        exchanges_normalized.add(f"exchange:{exchange['name']}-{exchange['type']}-{exchange['durable']}-{exchange['auto_delete']}")
    return exchanges_normalized

def normalize_queues(queues) -> set:
    queues_normalized = set()
    for queue in queues:
        queues_normalized.add(f"queue:{queue['name']}-{queue['durable']}-{queue['auto_delete']}")
    return queues_normalized


def compare(source_definitions: dict, target_definitions: dict) -> bool:

    source = normalize_bindings(source_definitions['bindings']) | normalize_exchanges(source_definitions['exchanges']) | normalize_queues(source_definitions['queues'])
    target = normalize_bindings(target_definitions['bindings']) | normalize_exchanges(target_definitions['exchanges']) | normalize_queues(target_definitions['queues'])

    return (source - target)


def migrate(broker1: BrokerInfo, broker2: BrokerInfo):
    print("** Starting **")
    source = get_definitions(broker1)
    target = get_definitions(broker2)

    print('Copying exchanges, bindings and queues from source to target')
    target['bindings']  = source['bindings']
    target['exchanges'] = source['exchanges']
    target['queues']    = source['queues']

    import_definitions(broker2, target)
    target_updated = get_definitions(broker2)

    print("## Validating Migration")
    not_found_items = compare(source, target_updated)

    print(f"{len(not_found_items)} items not found in target broker")
    for item in not_found_items:
        print(item)
    print("=========================")

if __name__ == "__main__":
    broker1 = BrokerInfo('localhost', 15672, 'admin', '123456')
    broker2 = BrokerInfo('localhost', 15673, 'guest', 'guest')
    migrate(broker1, broker2)