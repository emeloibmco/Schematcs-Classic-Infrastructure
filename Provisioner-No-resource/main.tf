resource "null_resource" "prepare_app_zip" {
  triggers = {
    app_version = "${var.app_version}"
    git_repo    = "${var.git_repo}"
  }

  provisioner "local-exec" {
    command = <<EOF
        mkdir -p ${var.dir_to_clone}
        cd ${var.dir_to_clone}
        git init
        git remote add origin ${var.git_repo}
        git fetch
        git checkout -t origin/master
        zip -r ${var.app_zip} *
        
EOF

  }
}
