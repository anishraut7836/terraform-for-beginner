## sensitive file while executing terraform plan and apply content will not show on terminal.

resource "local_sensitive_file" "games" {
  filename     = "/root/favorite-games"
  content  = "FIFA 21"

}

