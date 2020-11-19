# T2A2 - Marketplace: The Cardboard Cache

### **R7 - The Problem:**

For many members in the board game community, a large number of board games in every collection end up sitting on the shelf collecting dust. Due to high frequency of new game releases, board game enthusiasts tend to pick up more games than they can reasonably get to the tabletop. Additionally, a lot of games have an immense set of rules to learn, which provides a barrier to entry for new players and gaming groups. Consequently, more complex games or games that a group hasn't already learned the rules for rarely end up seeing any play time.

There is already a very active community of board game enthusiasts, many of which use existing platforms to buy and sell second hand board games. While it is possible to sell board games on existing platforms, there are a number of drawbacks to using them:
- eBay: Great general platform for buying and selling, but not very well tailored to board game sales, and includes transaction fees for sellers
- Facebook Marketplace: No transaction fees, but even less suitable for board game sales than eBay
- Geek Market (an existing board game marketplace, provided by 'Board Game Geeks'): Tailored for board game sales, but includes transaction fees for sellers

In addition to these platform specific issues, the second hand board game market is stifled by expensive shipping costs, due to the size and weight of most games, making sales not worthwhile for sellers and too expensive for buyers.

<br>

### **R8 - Why does it need solving?**

What if there was a way to trade board games, for free, with other board game enthusiasts without having to pay any additional shipping?

**This would allow all of the abandoned board games to finally get back to the tabletop, as originally intended by their creators.**

A key strategy for this approach would be to focus on board game trades between users, to encourage board game enthusiasts to try many different games they would otherwise not be able to afford (or fit in their game shelves).

<br>

### **R9 - Deployed Application:**
- https://the-cardboard-cache.herokuapp.com/

<br>

### **R10 - GitHub Repo:**
- https://github.com/waldowred5/the-cardboard-cache

<br>

### **R11 - Overview:**
- Purpose:
    - The Cardboard Cache has been designed to allow local board game enthusiasts to swap games with each other. This allows users to refresh their board game collections without having to constantly purchase new games, and ensures old games get the tabletop more often
- Functionality & Features:
    - **User Accounts:** Users can create an account where they can save information about their board games collections and wishlists, as well as interact with other users
    - **Top Games & the Board Game Geek (BGG) API:** Users can browse the top board game titles as found on the BGG website (currently only the top 100 games are able to be imported by the API, with any number from 30-100 games loading in based on BGG API request load, auto loading of more titles coming in a future release). Users can view each of these titles for more detailed information about the game, as well as adding the game to their collections and wishlists
    - **Collections:** Users can save any games found on BGG (which includes a list of over 100,000 titles), to a digital collection of games they own, and set the status of those games to either a 'tradeable' game or a game 'not for trade', as well as a trade value (price) which they are willing to trade the game for
    - **Wishlists:** Users are able to pick games from the BGG database that they wish to own
    - **Trades:** Users can search for potential trade matches with other users. These trade matches include a succesfful trade, where User A has a game in their collection that User B has in their wishlist, and vice versa. Users can then request to trade these 2 games, which are listed as successful trades when both parties have accepted the trade (currently in Trades functionality only includes searches for successful trades, requesting/accepting trades coming in a future release)
- Sitemap:

- Screenshots:

- Target Audience:
    - The primary audience for The Cardboard Cache is anyone who is a board game enthusiast and interested in trading their older games for games that other users are willing to trade
- Tech Stack:
    - Frontend: HTML5 (21.1%), SCSS (5.2%), Javascript (2.8%), CSS3 (0.5%)
    - Backend: Ruby 2.7.1 on Rails 6.0.3.4 (70.4%)
    - Database: PostgreSQL 12.3
    - Deployment: Heroku
    - Project Management: Github (Git), Trello
    - Design: Balsamiq Wireframes, Draw.io (ERD/Sitemap)
    - 3rd Party: Board Game Geek API ([BGG XML API2](https://boardgamegeek.com/wiki/page/BGG_XML_API2)), AWS (S3, IAM)

<br>

### **R13 - Wireframes:**

<br>

### **R12 - User Stories:**
- Users should be able to list games they own in a collection, and tag games they are willing to trade
- Users should be able to create a wishlist of board games
- Users that have games on their wishlist that match games in other users 'trade' list should show up as potential matches for a board game trade (prompting both users of the match)
- Users should be able to set the distance they are willing to travel for a board game trade, and see board game matches that are closest to their location first
- Users should be given a suggested fair price for their game based on RRP, condition, availability, etc.
- Users should be able to sort their wishlists/collections by; rank, weight, rating, year published, playing time, # players
- User A should be given recommendations for other games to trade when matched with User B if current trade has a large price gap between users
    - e.g. User A has Game A on their wishlist and Game B in their collection available for trade with a recommended price of $150
    - User B has Game B on their wishlist and Game A in their collection available for trade with a recommended price of $50
    - User A would be given a suggestion with a list of the other games User B had in their trade list to try and balance the final trade amount
- Users should be able to set their preference for buying new games or trading existing games (to tailer whether they see more sales vs trades)
- Users should be able to see a list of popular and new games they might want to add to their wishlist (index page - top rated board games + new board games)
- Users should be given suggestions for local board game stores (or other suitable locations) to complete board game trades (benefit, stores may be able to use board game trades as opportunities to upsell users, and users can buy any accessories/expansions they may want for their new game)
- If a user enters a game into their wishlist that is already in their collection they will be prompted of this and asked if they wish to move this game from their collection to their wishlist (and vice versa)

<br>

### **R14 - ERD:**

**Users:** 

**Addresses:** 

**Board Games:**
- Categories (Thing)
- Publisher (Thing)
- Designer (Thing)
- Overall rank
- Avg. rating
- Name
- Year Published
- Min/Max Players
- Min/Max Playing time
- Age
- Complexity

**Wishlists:**

**Collections:**

**Trades:**

**Messages:**

<br>

### **R15 - Components:**

<br>

### **R16 - 3rd Party Services:**

<br>

### **<a name="txt17.1">R17</a> - Models:**

" Rails supports six types of associations:
- belongs_to
- has_one
- has_many
- has_many :through
- has_one :through
- has_and_belongs_to_many "

*Sourced from [[17.1.1]](#ref17.1.1)*

**List of all models:**

| | |
--- | ---
**Users** | Board game enthusiasts
**Addresses** | Physical address of a user
**Address Table Dependencies** | Cities, States, Countries
**Board Games** | Library of all board games
**Board Game Table Dependencies** | Publishers, Designers, Categories, Accessories
**Wishlists** | Lists of all board games a user wishes to acquire
**Collections** | Lists of all board games a user owns
**Trades** | Transactions between users trading games with each other
**Matches** | A list of all board game matches between wishlists and collections from different users
**Messages** | Users can message each other

<br>

Relationships:
- A User `has_one` Address, an Address `belongs_to` a user
- A User `has_many` Board Games `:through` Wishlists
- A User `has_many` Board Games `:through` Collections
- A User `has_one` Wishlist, a Wishlist `belongs_to` a user
- A User `has_one` Collection, a Collection `belongs_to` a user

- A User `has_many` Trades, a Trade




<br>

### **R18 - Database Relations:**

<br>

### **R19 - Database Schema Design:**

<br>

### **R20 - Task Management:**

<br>

<br>

<br>

### *References:*

[^](#txt17.1)<a name="ref17.1.1">17.1.1 - </a>Rails Guides. 2012. Active Record Associations. [ONLINE] Available at: [Link](https://guides.rubyonrails.org/association_basics.html). [Accessed 6 November 2020].

<br>

Notes:

[^](#txtX.1)<a name="refX.1.X">X.1.X - </a>WebsiteName. Year. WebPageTitle. [ONLINE] Available at: [Link](). [Accessed 6 November 2020].

<a name="txt11.1">Question 11</a>

*References: [[11.1.1]](#ref11.1.1), [[11.1.2]](#ref11.1.2), [[11.1.3]](#ref11.1.3)*