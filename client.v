module voltcord

import http
import json

const ( base_url = 'https://discordapp.com/api')

struct Client {
	token string
}

pub fn new_client(token string) *Client {
	return &Client{token: token}
}

pub fn (c Client) get_channel_by_id(id string) Channel {
	res := request('GET', c.token, 'channels/$id', 'application/json')
	mut channel := json.decode(Channel, res.body) or {
		return Channel{}
	}
	channel.token = c.token
	return channel
}

pub fn (c Client) get_guild_by_id(id string) Guild {
	res := request('GET', c.token, 'guilds/$id', 'application/json')
	guild := json.decode(Guild, res.body) or {
		return Guild{}
	}
	return guild
}

pub fn (c Client) get_user_by_id(id string) User {
	res := request('GET', c.token, 'users/$id', 'application/json')
	user := json.decode(User, res.body) or {
		return User{}
	}
	return user
}

pub fn (c Client) get_current_user() User {
	res := request('GET', c.token, 'users/@me', 'application/json')
	user := json.decode(User, res.body) or {
		return User{}
	}
	return user
}

fn request(method, token, path, content_type string) http.Response {
	mut req := http.new_request(method, '$base_url/$path', '')  
	req.add_header('Authorization', 'Bot $token')
	resp := req.do()
	return resp
}

