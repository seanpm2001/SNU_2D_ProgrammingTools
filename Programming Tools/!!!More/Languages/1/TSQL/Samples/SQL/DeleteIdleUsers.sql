DELETE u
  FROM users AS u
  INNER JOIN user_flags AS f
    ON u.id = f.id
    WHERE f.name = 'idle';
