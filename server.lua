	pin = 4
    gpio.mode(pin,gpio.OUTPUT)
    
	srv=net.createServer(net.TCP)
    srv:listen(80,function(conn)
      conn:on("receive",function(conn,payload)
        print(payload)
        gpio.write(pin,gpio.HIGH)
        conn:send("<h1> Hello, NodeMcu.</h1>")
      end)
      conn:on("sent",function(conn) conn:close() end)
    end)