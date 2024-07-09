module "flask_app" {
  source = "./k3s_ns_module"

  namespace         = "flask-app"
  resource_quota    = {
    cpu    = "0.5"
    memory = "256M"
  }
  role_name         = "flask-app-role"
  role_binding_name = "flask-app-role-binding"
  user_name         = "flask-app-user"
}
