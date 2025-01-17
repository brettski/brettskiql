package resolver

// This file will be automatically regenerated based on the schema, any resolver implementations
// will be copied through when generating and any unknown code will be moved to the end.
// Code generated by github.com/99designs/gqlgen version v0.17.56

import (
	"context"

	graphql1 "github.com/brettski/brettskiql/graphql"
	"github.com/brettski/brettskiql/graphql/model"
	"github.com/brettski/brettskiql/transform"
)

// All is the resolver for the all field.
func (r *usersQueryResolver) All(ctx context.Context, obj *model.UsersQuery) ([]*model.User, error) {
	return transform.MapValuesToSlice(r.users), nil
}

// User is the resolver for the user field.
func (r *usersQueryResolver) User(ctx context.Context, obj *model.UsersQuery, id string) (*model.User, error) {
	u := r.users[id]
	return u, nil
}

// UsersQuery returns graphql1.UsersQueryResolver implementation.
func (r *Resolver) UsersQuery() graphql1.UsersQueryResolver { return &usersQueryResolver{r} }

type usersQueryResolver struct{ *Resolver }
