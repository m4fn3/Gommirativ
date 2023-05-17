from watchdog.events import PatternMatchingEventHandler
from watchdog.observers import Observer
import os
import scp
import paramiko
import time

with paramiko.SSHClient() as ssh:
    ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
    ssh.connect('192.168.11.21', port=22, username='root', password='alpine')
    client = scp.SCPClient(ssh.get_transport())


    def on_modified(event):
        filepath = event.src_path
        print(f"{filepath}")
        client.put(filepath, "/var/root/Gommirativ/")


    event_handler = PatternMatchingEventHandler(["Makefile", "Tweak.xm"])
    event_handler.on_modified = on_modified

    observer = Observer()
    observer.schedule(event_handler, ".", recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
