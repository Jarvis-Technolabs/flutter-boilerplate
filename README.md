Project is having 2 main layers:-

1.) Core 

2.) Feature

This layer is divided into 3 main part per module:-


A.)Data:- 
         Takes care of how data will be fetched [remote/local data source!].
         Contains  1.)Entitites,
                   2.)Repositories[remote/local]

B.)Domain:- 
           Takes care of core business logic and provides data repositories. Hence it is unaware of core implementation
           of how data is fetched.
C.)Presentation:-
            Takes care of presenting data using blocs. 



Block architecture all demos:-

1.)https://github.com/felangel/bloc/tree/master/examples/flutter_login/lib/login
2.)https://pub.dev/packages/flutter_bloc  [provides multiple bloc/listener methods]

Clean architecture explanation:-
https://pub.dev/packages/flutter_clean_architecture

Note:-
Just took concept of clean architecture.



Pending tasks:-
1.) add crashalytics
2.) add product build flavour
3.) Screenutils