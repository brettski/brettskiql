package resolver

import "github.com/brettski/brettskiql/graphql/model"

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

type Resolver struct {
	todos []*model.Todo
	users map[string]*model.User
}

func NewResolver() *Resolver {
	users := SeedUsers()
	return &Resolver{
		// users: make(map[string]*model.User),
		users: users,
	}
}

func SeedUsers() map[string]*model.User {

	users := map[string]*model.User{
		"U2112": {
			ID:    "U2112",
			Name:  "brettski",
			Email: func() *string { s := "brettski@example.com"; return &s }(),
		},
		"U111": {
			ID:    "U111",
			Name:  "brett",
			Email: func() *string { s := "brett@example.com"; return &s }(),
		},
	}

	return users
}
