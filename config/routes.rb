App::Application.routes.draw do
  get  "/"           => "main#root"
  get  "/appraisalfees"     => "main#index"
  get  "/appraisalfees/:id" => "main#show"

  get  "/admin/login"      => "admin#login"
  post "/admin/login"      => "admin#login_post"
  get  "/admin/logout"     => "admin#logout"

  get  "/admin/appraisalfees"     => "admin#index"
  post "/admin/appraisalfees"     => "admin#index_post"
  get  "/admin/appraisalfees/new" => "admin#new"
  post "/admin/appraisalfees/new" => "admin#new_post"
  get  "/admin/appraisalfees/:id" => "admin#edit"
  post "/admin/appraisalfees/:id" => "admin#edit_post"
end
