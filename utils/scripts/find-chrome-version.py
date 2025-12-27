import subprocess

def get_chrome_version():
    try:
        # Works for standard Chrome installation
        output = subprocess.check_output(
            r'reg query "HKEY_CURRENT_USER\Software\Google\Chrome\BLBeacon" /v version',
            shell=True
        )
        version = output.decode().strip().split()[-1]
        return version
    except Exception as e:
        print("Could not detect Chrome version:", e)

print(get_chrome_version())

