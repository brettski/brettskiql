package resolver

import "github.com/brettski/brettskiql/graphql/model"

// This file will not be regenerated automatically.
//
// It serves as dependency injection for your app, add any dependencies you require here.

type Resolver struct {
	todos []*model.Todo
	// users []*model.User
	users map[string]*model.User
}

func NewResolver() *Resolver {
	return &Resolver{
		users: make(map[string]*model.User),
	}
}
