#!/usr/bin/env python
"""
Wraps gpspipe in order to pass Chrome Native Messaging protocol messages.

Copyright 2016-2017 Michael Farrell <micolous+git@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

gpspipe must be in your PATH for this script to work.

ref: https://developer.chrome.com/extensions/nativeMessaging
"""
from os import environ
from os.path import dirname, realpath
from subprocess import Popen, PIPE
from struct import pack
from sys import stdout

# Make a copy of the environment, and stuff in extra places to try.
# On OSX, $PATH when launched from the Dock or Finder is sparse.
env = environ.copy()
env['PATH'] = ':'.join([
	env['PATH'],
	dirname(realpath(__file__)),
	'/usr/local/bin',
	'/usr/bin',
])

process = Popen(['gpspipe', '-w'], stdin=PIPE, stdout=PIPE, env=env)

try:
	while process.returncode is None:
		process.poll()
		line = process.stdout.readline()

		if len(line) == 0:
			# Drop empty lines
			continue

		# Lines from gpspipe are already json, yay!
		line = line.strip().encode('utf-8')

		# Protocol is to have a JSON blob preceeded with a uint32 in native byte
		# order.
		stdout.write(pack('=L', len(line)) + line)

		# Flush the output immediately.
		stdout.flush()
except KeyboardInterrupt:
	# Swallow the exception message
	pass
finally:
	# Make sure the child process is dead.
	try:
		process.kill()
	except:
		pass
