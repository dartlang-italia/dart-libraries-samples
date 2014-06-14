# dart:mirrors

Basic reflection in Dart,
with support for introspection and dynamic evaluation.

*Introspection* is that subset of reflection by which a running
program can examine its own structure. For example, a function
that prints out the names of all the members of an arbitrary object.

*Dynamic evaluation* refers the ability to evaluate code that
has not been literally specified at compile time, such as calling a method
whose name is provided as an argument (because it is looked up
in a database, or provided interactively by the user).

## How to interpret this library's documentation

As a rule, the names of Dart declarations are represented using
instances of class [Symbol]. Whenever the doc speaks of an object *s*
of class [Symbol] denoting a name, it means the string that
was used to construct *s*.

The documentation frequently abuses notation with
Dart pseudo-code such as [:o.x(a):], where
o and a are defined to be objects; what is actually meant in these
cases is [:o'.x(a'):] where *o'* and *a'* are Dart variables
bound to *o* and *a* respectively. Furthermore, *o'* and *a'*
are assumed to be fresh variables (meaning that they are
distinct from any other variables in the program).

Sometimes the documentation refers to *serializable* objects.
An object is serializable across isolates if and only if it is an instance of
num, bool, String, a list of objects that are serializable
across isolates, or a map with keys and values that are all serializable across
isolates.

## Status: Unstable

The dart:mirrors library is unstable and its API might change slightly as a
result of user feedback. This library is platform dependent and therefore it
has implementations for both dart2js and the Dart VM. Both are under
development and may not support all operations yet.
