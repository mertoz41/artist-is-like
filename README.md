# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



Our Specialty Methods

Model Methods

Artist (Enrique)
	<!-- Most Influenced --
		Artist with most liker_id -->
	<!-- Top Influential --
		Artist with most liked_id --> -->
	Most Original
		Artist with least liker_id
	Least Influential
		Artist with least liked_id
	Average Influences
		return average number of influences that Artists have
	Count_Artists
		return how many artists are hosted on the site 
	Most followed Artist
		Artist that most users follow 
		[Artist, # of Users following]

Comments (jesse)
	Top Commenter
		User with most comments
	Most Recent Comment
		Return most recent comment
	Recent Activity
		Return 3 most recent comments
	Most Talked About
		most comments on an IsLike


User (mert)
	<!-- Follows_artist ---
	    Shows artist that are being followed -->
	Top User -- 
		Follows most Artists
		returns [User, # of artists followed]
	Full name --
		returns first and last name together
	Full Name with First Initial Last Name --
		Return the first name and first initial capitalized with a period
	Count_Users --
		return how many users are created on the site 
	Count_Comments --
		return how many comments a user has made on the site
	Newest User --
		return newest User
	Rank_User -- 
		Return a rank based on amount of IsLIkes

IsLike (jesse)
	Count_IsLIkes
		return how many IsLikes are created on the site 
	Most Recent IsLIke
		return the newest IsLike
	