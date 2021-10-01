# Design patterns (GoF) using Dart language

[![Build Status](https://github.com/arturdm/design_patterns_in_dart/actions/workflows/test.yml/badge.svg)](https://github.com/arturdm/design_patterns_in_dart/actions/workflows/test.yml)

This repository contains sample implementations of GoF design patterns in Dart.

Inspired by https://github.com/dbacinski/Design-Patterns-In-Kotlin.

## Table of contents
* [Creational design patterns](#creational-design-patterns)
    * [Abstract Factory](#abstract-factory)
    * [Prototype](#prototype)
    * [Builder](#builder)
    * [Factory Method](#factory-method)
    * [Singleton](#singleton)
* [Structural design patterns](#structural-design-patterns)
    * [Adapter](#adapter)
    * [Bridge](#bridge)
    * [Composite](#composite)
    * [Decorator](#decorator)
    * [Facade](#facade)
    * [Flyweight](#flyweight)
    * [Proxy](#proxy)
* [Behavioural design patterns](#behavioural-design-patterns)
    * [Chain Of Responsibility](#chain-of-responsibility)
    * [Command](#command)
    * [Observer](#observer)

## Creational design patterns

### Abstract Factory

Still have to find a way to print some object it pointed by a reference.

### Prototype

There is a nice way of creating objects with a named constructor just 
like with static factory methods in Java.

### Builder

There is no support for inner classes.

### Factory Method

This one can be done using factory constructor.

### Singleton

This singleton implementation utilizes lazy loading of global variables.
There is also a way of implementing a singleton with a factory 
constructor that always returns the same instance.

## Structural design patterns

### Adapter

Provides a link between two incompatible types by wrapping one type 
with a class that supports the interface required by the client.

### Bridge

### Composite

### Decorator

### Facade

### Flyweight

### Proxy

## Behavioural design patterns

### Chain Of Responsibility

### Command

Used to express a request including the call to be made and the required 
parameters in a command object. It may then be executed immediately or 
held for later use.

### Interpreter

### Iterator

### Mediator

### Memento

### Observer

The observer pattern is used to allow an object to publish changes to its state.
Other objects subscribe to be immediately notified of any changes.

[code](test/behavioural/observer_test.dart)

### State

### Strategy

### Template Method

### Visitor
