# brettskiql

Playing round with GraphQL in Golang

Graphs and gophers anyone?

## Summary

This project uses gqlgen, [https://github.com/99designs/gqlgen](https://github.com/99designs/gqlgen), a GraphQL library for go. It is a schema-first library. I prefer schema-first coming from Apollo GraphQL experience.

The schema and resolver files have been broken up into directories for better organization. Unfortunately, gqlgen doesn't support adding a type to a generated resolver file name, causing query and mutation resolvers to be in the same file. Something I prefer to be separate.

Used a top folder name of `graphql` instead of the default `graph`. This created some odd side-affects in the generated resolvers. Looking at [root.resolvers.go](./graphql/resolver/root.resolvers.go) gqlgen set a variable of `graphql1` to the input of `"github.com/brettski/brettskiql/graphql"`. The code works fine if `graphql` is used, but for some reason gqlgen changes it to `graphql1`.

## Structure

graphql/
  |
  model/
  resolver/
  typedefs/
    |
    datatypes/
      |
      inputs/
    mutations/
    queries/
