-- producer
local userinfo_get = {}

function userinfo_get.foo(userID)

  -- Operation to obtain user information

  return userinfo

end

return userinfo_get

-- consumer
local new = require "userinfo_get"
local cjson = require "cjson"
local userinfo=new.foo(1)

ngx.log(ngx.INFO,cjson.encode(userinfo))

local result = cjson.encode({resultCode = "1001"})
ngx.log(ngx.INFO,"<result>" .. result)
ngx.say(result)
return ngx.exit(ngx.HTTP_OK)



-- After testing,this approach can deal with concurrency problems.