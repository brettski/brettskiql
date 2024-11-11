package resolver

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.56

import (
	"context"

	graphql1 "github.com/brettski/brettskiql/graphql"
	"github.com/brettski/brettskiql/graphql/model"
)

// User is the resolver for the user field.
func (r *todoResolver) User(ctx context.Context, obj *model.Todo) (*model.User, error) {
	return &model.User{
		ID:   obj.UserID,
		Name: "user " + obj.UserID,
	}, nil
}

// Todo returns graphql1.TodoResolver implementation.
func (r *Resolver) Todo() graphql1.TodoResolver { return &todoResolver{r} }

type todoResolver struct{ *Resolver }