A ruby client for the game [generals.io][generals-web], intended as a Ruby platform for
the development of bots. If you use this client (like I do) then all you should
have to worry about is writing the logic for your bot.

# What?

A `generals.io` client not written in JavaScript?

Believe it. ;)


# Alpha warning!

**The client is currently in alpha development. PRs welcome.**

Questions about using this client should be written as issues on this repo.

This repo current relies upon a customized version of
[socket.io-client-simple-1.2.1][socket.io-client]. I had to customize it because
the official repo disconnects from the generals.io client after 60 secdons. If
you know of a better way, or a better library, I'm open to suggestions.


## Overview

### Supports:

* Will join custom games (so you can play against your bot and test it)
* `API` module that's easy to use (see `lib/client.rb` for examples)
* Logs all API messages (sent/received) via the `API` module
  `STDOUT` so you can easily see what's happening
* `Logger` module that will let you log whatever you want to `STDOUT` (i.e.
  whatever actions your bot is taking, if you want to log that)
* Creating your own bot logic


### Does NOT currently support:

* Any server other than the bot server
* Anything other than custom games (easily changed if you want to write a PR for
  it - I'll eventually add it myself once my first bot is ready for public play
  if no one else gets to it before then)
* Setting a custom username / user_id doesn't seem to work currently. Not really
  sure why. PRs welcome.


## Usage

```plaintext
  ruby start <user_id> <username> <game_id>
```

The client will join your custom game as denoted by `game_id`, trigger a
force-start, and play through it with the default (makes no moves) bot until the
game is over. When the game ends the client will reconnect to the same custom
game so you can play over and over until you manually kill the client (i.e. via
`Ctrl-C`).

## B.Y.O.B.

Bring your own bot.

All you need to do to create your own generals.io bot is to add your code to
[`lib/bot_interface.rb`][bot_interface]. See the documentation there to get
started.

If you'd rather keep your bot logic in its own folder, change the value in
`config.yml` to point to your bot logic.

  [generals-web]: http://dev.generals.io/
  [bot_interface]: https://github.com/jefflunt/ruby-generals.io-client/blob/master/lib/bot_interface.rb
  [socket.io-client]: https://github.com/jefflunt/socket.io-client-simple-1.2.1-custom
