import subprocess


def get_pass(key):
    command = "pass {}".format(key)
    return subprocess.check_output(command, shell=True).decode().strip()
