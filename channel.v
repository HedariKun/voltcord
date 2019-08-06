module voltcord

import json

struct Channel {
mut:
	token string // fix later

pub:
	id string
	type int
	guild_id string
	// ToDo: add operation_overwrites
	name string
	topic string
	nsfw bool
	last_message_id bool
	//rate_limit_per_user int
	// ToDo: add recipients
	icon string
	owner_id string
	parent_id string
}

pub fn (c Channel) delete() {
	resp := request('DELETE', c.token, 'channels/' + c.id, 'application/json')
	println(resp.body)
}

//Todo: make it possible to get a message before, after, or around a certin message
// will implement using an option struct that holds these data beside limit
pub fn (c Channel) get_messages() []Message {
	resp := request('GET', c.token, 'channels/' + c.id + '/messages', 'application/json')
	messages := json.decode([]Message, resp.body) or {
		panic('failed to get messages')
		return []Message{}
	}
	return messages
}

pub fn (c Channel) get_message_by_id(id string) Message {
	resp := request('GET', c.token, 'channels/' + c.id + '/messages/$id', 'application/json')
	message := json.decode(Message, resp.body) or {
		println('failed to get message')
		return Message{}
	}
	return message
}	
