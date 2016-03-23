# Description:
#   Interactive zundoko script.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot ズン - storages zundoko talk
#   hubot ドコ - displays "キ・ヨ・シ!!" if you talk with valid zundoko format

#
# Author:
#   tomoki1207
   

module.exports = (robot) ->
  zdk = (zun1)->
    zun2 = yield zun1 is 'ズン'
    zun3 = yield zun2 is 'ズン'
    zun4 = yield zun3 is 'ズン'
    doko1 = yield zun4 is 'ズン'
    delete robot.zdk
    if doko1 is 'ドコ' then 'キ・ヨ・シ!!' else false

  nextZdk = (input)->
    robot.zdk.next(input).value

  robot.respond /(ズン|ドコ)$/i, (msg)->
    unless robot.zdk
      robot.zdk = zdk(msg.match[1])
    res = nextZdk msg.match[1]
    if typeof res is 'string'
      msg.send res
    else
      unless res
        delete robot.zdk
