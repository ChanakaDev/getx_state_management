# Flutter State Management (with GetX)

A Flutter state management project with GetX and MVC architecture. 

## Getting Started

MVC Architecture:

- View: This is an entity that creates a request and receives the response and visualize the interface.
- Controller: This is the entity that sits in between view and model. This is an entity that receives the request of View and give the response back.
- Model: Deals with all the rest of the works. That means processing the request, dealing with data, creating objects, calling external API, accessing db etc.

- From a system if you remove controllers and views what remains is Model. So Model is not just data model or business logic model. It may also consists of the other parts like security, validation, processing, filtering etc.

References:

- [Youtube: CodX](https://www.youtube.com/watch?v=ZnevdXDH25Q&list=PL3wGb9_yWsvJ-QUBbkXvhjhQFRsb4wqbY&index=2)
- [Package: GetX](https://pub.dev/packages/get)
- [StackOverflow: MVC](https://stackoverflow.com/questions/4221632/mvc-what-is-a-model)