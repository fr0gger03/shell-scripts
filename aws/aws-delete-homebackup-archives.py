#!/usr/bin/env python3

import json
import subprocess
import time

json_file='home-backup-output.json'
account_id='936384142737'
vault_name='home-backup_001132521C59_1'

with open(json_file) as f:
    data = json.load(f)

for item in data['ArchiveList']:
    cmd = "aws glacier delete-archive --account-id %s --vault-name %s --archive-id=\'%s\'" % (account_id, vault_name, item['ArchiveId'])
    returned_value = subprocess.call(cmd, shell=True)
#     print('cmd: %s || returned value: %s') % (cmd, str(returned_value))
    time.sleep(0.1)