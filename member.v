module voltcord

struct Member {
pub:
	user User
	nick string
	roles []string
	joined_at string
	premium_since string
	deaf bool
	mute bool
}
