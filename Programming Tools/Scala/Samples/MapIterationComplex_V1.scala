// Given a map specifying Twitter users mentioned in a set of tweets,
// and number of times each user was mentioned, look up the users
// in a map of known politicians, and return a new map giving only the
// Democratic politicians (as objects, rather than strings).
val dem_mentions = for {
    (mention, times) <- mentions
    account          <- accounts.get(mention)
    if account.party == "Democratic"
  } yield (account, times)
