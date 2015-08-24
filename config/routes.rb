Routes = Router.new
Routes.add_route(method: "GET", path: "/programmers", handler: "ProgrammersController#index")
Routes.add_route(method: "GET", path: "/programmers/:id", handler: "ProgrammersController#show")
Routes.add_route(method: "GET", path: "/", handler: "HomeController#index")
