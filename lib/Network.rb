require 'socket'
require 'json'

class Network
	attr_reader :pdata
	attr_reader :IsConnected

	def self.init
		@pdata = ""
		@IsConnected = false
	end

	def self.open(ip, port)
		@sock = TCPSocket.open(ip, port)
		@IsConnected = true
	end

	def self.send(data)
		return if not @IsConnected
		json_data = JSON.generate(data)
		msg = "\0" * (json_data.size + 4)
		msg[0] = [json_data.size >> 24 & 0xff].pack("U*")
		msg[1] = [json_data.size >> 16 & 0xff].pack("U*")
		msg[2] = [json_data.size >>  8 & 0xff].pack("U*")
		msg[3] = [json_data.size       & 0xff].pack("U*")
		msg.gsub!("(", "")
		for i in 0...json_data.size
			msg[4+i] = json_data[i]
		end
		#p msg
		@sock.send msg, 0
	end

	def self.close
		@sock.close
	end

	def self.update
		return if not @IsConnected
		if @sock.ready?
			temp, plen = @sock.recv(0xffff)
			@pdata = @pdata + temp[0...plen]
		end
		@pdata.gsub!("\u0000", "")
		while @pdata.size > 2
			sIndex = 0
			eIndex = 0
			for i in 0...@pdata.size
				if @pdata[i] == "{"
          			sIndex = i
        		end
        		if @pdata[i] == "}"
         			eIndex = i
          		break
        		end
      		end
      		if sIndex < eIndex
        		data = @pdata[sIndex..eIndex]
        		self.recv(JSON.load(data))
      		end
      		@pdata = @pdata[(eIndex + (eIndex == 0 ? 0 : 1))...@pdata.size]
    	end
    end
 end





