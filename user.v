module voltcord

struct User {
pub:
	id string
	username string
	discriminator string
	avatar string
	bot bool
	locale string
	verified bool
	email string
	flags int
	premium_type int
}
