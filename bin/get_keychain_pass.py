#!/usr/bin/env python
import sys
from skroll import security

print security.get_keychain_pass( sys.argv[1], sys.argv[2] )



