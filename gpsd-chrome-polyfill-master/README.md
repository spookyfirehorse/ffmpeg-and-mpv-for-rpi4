# gpsd-chrome-polyfill is no longer maintained

**This software hasn't been maintained since about 2017.**

I don't use Chrome or Chromium-based browsers anymore, so I have no interest in maintaining it.

*If you'd like to take this over, email me, and I'll pop a link to your repository here.* :)

There are two significant *functional* issues with the extension today (in 2025):

* The software uses Manifest V2. [Chrome disabled this by default from 2025-03-31][mv2], and support will be removed completely in Chrome 139 (estimated release date is 2025-08-05).
* `gpspipew.py` (wrapper for `gpspipe` to make it compatible with Chromium's Native Messaging Protocol) targets Python 2.x.

Because [Chromium doesn't have a location provider API][provider-api], the only way to plug things into it is by monkey-patching browser APIs.

When extensions monkey-patch APIs, it bypasses all of the browser's permissions systems, which is a *significant security weakness*. The extension tries to mitigate this by requiring manual activation (injection), but [this has usability issues](https://github.com/micolous/gpsd-chrome-polyfill/issues/1). Working around this with our own allow-list comes with a bunch of security risks that are difficult to manage, and means the extension would have its own location permission UI which duplicates what's presented by the browser (and would always be out of sync).

If you don't like this situation, go complain to Chromium developers about it. [They've had a bug open since 2016 to provide a better API][provider-api], and they have teams of people who are paid to work on keeping everyone happy and secure. ;)

This isn't the only type of extension to have these sorts of problems – third-party password manager extensions currently rely on monkey-patching too ([especially for WebAuthn support][webauthn]), and it's a security nightmare which can just be broken if the website loads faster than the extension.

This extension was only ever intended as a stop-gap, but it has survived a lot longer than I expected.

[mv2]: https://developer.chrome.com/docs/extensions/develop/migrate/mv2-deprecation-timeline
[provider-api]: https://issues.chromium.org/issues/41243892
[webauthn]: https://github.com/w3c/webauthn/issues/1976

# Original README

A Google Chrome/Chromium extension providing a HTML5 Geolocation API polyfill which connects to gpsd.

This uses the [Chrome Native Messaging API](https://developer.chrome.com/extensions/nativeMessaging) in order to connect `gpspipe` to Chrome.  This doesn't use libgps as [it consistently breaks ABI compatibility](https://bugs.chromium.org/p/chromium/issues/detail?id=99177).

This consists of two parts:

1. A Python wrapper script (gpspipew) which wraps gpspipe's newline seperated message format into using the [Chrome Native Messaging protocol](https://developer.chrome.com/extensions/nativeMessaging#native-messaging-host-protocol).

2. [A Chrome extension which provides a Geolocation API polyfill.](https://chrome.google.com/webstore/detail/gpsd-chrome-polyfill/dmfdcjlppdohhegplckcbohgbbfcdfjd)

The Chrome extension is configured to use the `activeTab` permission model in lieu of implementing all of the permission handling for the Geolocation API, and then trying to get access to all websites.

As a result, it'll only work on web pages which call `navigator.geolocation.*` **after** you have activated the extension.  If the page prompts you for location access immediately on load, it will **not work** with this extension.

This is tested on Linux x86_64, but should also work on other architectures and systems which support gpsd and Chrom{e,ium}.

## Usage instructions

1. Install and configure gpsd, and ensure it is getting position information correctly.
2. Install gpspipew (see below).
3. If Chrom{e,ium} is currently running, restart it.
4. Install the Chrome extension.
5. Click the icon (satellite icon) on the page you want to share location with.
6. Press the "current location", "show my location", etc. button on the page
7. The page should show your current location.

Using [OpenStreetMap](https://openstreetmap.org) is a good test.

### Troubleshooting

If location is not showing, check the background page console log.

*If it says "Disconnected, trying to reconnect"*, then you need to:

* Check that gpspipew is installed properly, it probably doesn't have the native messaging manifest.
* Restart Chrome.
* Try running `gpspipe -w` and see if you get GPS data.

*No lat/long messages show in the console*

* Check gpsd configuration and make sure you get a location with other programs using gpsd.
* Make sure your GPS has a clear view of the sky in order to ensure it gets a fix.
* Sometimes power cycling your GPS and restarting gpsd helps.

*Have GPS messages, but the page doesn't show a location*

* Make sure it uses the HTML5 Geolocation API
* You should only activate location services after clicking the "Share GPS location with page" button
* Navigating to other pages in the tab will remove the script, so you will need to click it again for each page
* If the page activates location services on page load, *this extension will not work with it*.

*How do I limit access to location to particular pages?*

Location is shared temporarily with a page.  It will bypass the Chrome Location Services limits as a result.

## Installing `gpspipew` (the Python wrapper script)

**Note:** If this component isn't installed, the Chrome extension **will not work**.  This also requires `gpspipe`, which is in the `gpsd-clients` package.

To install the Python code, run the following:

```
sudo make install
```

This will install the script and the needed Native Messaging configuration for Chrome and Chromium.  The gory bits of that are in `gpspipew/install.sh`.  It should work on Linux and OS X.

You will need to restart Chrome after doing this.

You can test the script works with `/usr/local/bin/gpspipew.py` and it should start spitting out some binary and JSON at your terminal.

## Chrome extension

~~[Available from the Chrome Web Store.](https://chrome.google.com/webstore/detail/gpsd-chrome-polyfill/dmfdcjlppdohhegplckcbohgbbfcdfjd)~~ ***That version requires Manifest V2, and will completely stop working in Chrome 139 and later.***

### Building the ZIP

This is used to upload the package to the Chrome web store.

```sh
make gpsd-chrome-polyfill.zip
```

### Hacking

You can point Chrome an the unpacked extension directory if you're just hacking around on the code.

If you're playing with this yourself, you'll notice that the extension ID has changed, as that is tied to my private key.

If you want to test something without gpsd attached, you can enter the background page console (in chrome://extensions) and enter the following code into the console:

```javascript
setInterval(function() { gpsd_port_messageHandler({class:'TPV',tag:'RMC', lat:-33.85717, lon:151.21502, mode:2, epy:50, epx:50, time:(new Date()).getTime()}); }, 1000);
```

This will send a GPS message every second with your location as the [Sydney Opera House](https://en.wikipedia.org/wiki/Sydney_Opera_House).

### Using with other extensions

I've limited gpspipew to only work with my version of the extension.  You may have to change the allowed extension IDs in order to work with your development version.

I'm happy to open this native messaging pipe to other open source Chrome extensions in my mainline version.

If you want to use the service for a non-OSS Chrome Extension, you'll need to package your own version of `gpspipew`.

## Licenses

Application code licensed under [the Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

The application icon (`icon\d+.png`, `icon.svg`) is [CC-BY Edward Boatman @ The Noun Project](https://thenounproject.com/search/?similar=625&i=625).

Before 2025-06-09, application code was licensed under the Lesser General Public License v3 or later. The change of license should make it easier for others to publish their own forks of this extension.

I ask that if you are publishing your own fork:

* you make it clear that your version is a fork of this project (eg: by including your name in the title, rather than just calling it `gpsd-chrome-polyfill`)
* you publish with your own extension ID and native messaging host IDs (ie: don't use `au.id.micolous.gpspipe`, or anything else under my domain name)
* any extension or package listings point at your own code repository, issue tracker, website, etc.
* you let me know (email me) so I can mention it here :)
