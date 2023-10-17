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
    * [Interpreter](#interpreter)

## Creational design patterns

### Abstract Factory

Still have to find a way to print some object it pointed by a reference.

[See code example](test/creational/abstract_factory_test.dart)

### Prototype

There is a nice way of creating objects with a named constructor just like with static factory
methods in Java.

[See code example](test/creational/prototype_test.dart)

### Builder

There is no support for inner classes.

[See code example](test/creational/builder_test.dart)

### Factory Method

This one can be done using factory constructor.

[See code example](test/creational/factory_method_test.dart)

### Singleton

This singleton implementation utilizes lazy loading of global variables. There is also a way of
implementing a singleton with a factory constructor that always returns the same instance.

[See code example](test/creational/singleton_test.dart)

## Structural design patterns

### Adapter

Provides a link between two incompatible types by wrapping one type with a class that supports the
interface required by the client.

[See code example](test/structural/adapter_test.dart)

### Bridge

[See code example](test/structural/bridge_test.dart)

### Composite

[See code example](test/structural/composite_test.dart)

### Decorator

[See code example](test/structural/decorator_test.dart)

### Facade

[See code example](test/structural/facade_test.dart)

### Flyweight

[See code example](test/structural/flyweight_test.dart)

### Proxy

[See code example](test/structural/proxy_test.dart)

## Behavioural design patterns

### Chain Of Responsibility

[See code example](test/behavioural/chain_of_responsibility_test.dart)

### Command

Used to express a request including the call to be made and the required parameters in a command
object. It may then be executed immediately or held for later use.

[See code example](test/behavioural/command_test.dart)

### Interpreter

Used to define the grammar for instructions that form part of a language or notation, whilst allowing the grammar to be easily extended.

[See code example](test/behavioural/interpreter_test.dart)

### Iterator

### Mediator

### Memento

The memento pattern is used to capture the current state of an object and store it in such a manner
that it can be restored at a later time without breaking the rules of encapsulation.

[See code example](test/behavioural/memento_test.dart)

### Observer

The observer pattern is used to allow an object to publish changes to its state. Other objects
subscribe to be immediately notified of any changes.

[See code example](test/behavioural/observer_test.dart)

### State

### Strategy

[See code example](test/behavioural/strategy_test.dart)

### Template Method

The template method pattern is used to define the basic steps of an algorithm and allow the
implementation of the individual steps to be changed.

[See code example](test/behavioural/template_method_test.dart)

### Visitor
