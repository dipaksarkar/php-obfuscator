import os

# Configure colors for printing messages
YELLOW = '\033[93m'
BLUE = '\033[94m'
GREEN = '\033[92m'
RED = '\033[91m'
RESET = '\033[0m'

# Configure YakPro packages path (use full path and ensure it's correct)
YAKPRO = [os.path.expanduser(
    "/Volumes/Work/php-obfuscator/yakpro-po/yakpro-po.php"), "-o"]

# Log filename
log_filename = 'app.log'
