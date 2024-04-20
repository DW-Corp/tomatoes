db.createUser({
    user: 'tomatoes_dw',
    pwd: 'productive_freak25$$',
    roles: [
      {
        role: 'readWrite',
        db: 'tomatoes_app_development'
      },
      {
        role: 'readWrite',
        db: 'tomatoes_app_test'
      }
    ]
  });
  