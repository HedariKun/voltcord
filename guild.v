module voltcord

struct Guild {
pub:
	id string
	name string
	icon string
	splash string
	owner bool
	owner_id string
	permissions int
	region string
	//afk_channel_id 
	//afk_timeout
	//...
	verification_level int
	// roles
	// emojis
	joined_at string // ToDo change to time
	large bool
	// members
	channels []Channel
	description string
}
