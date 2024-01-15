# Task-it GitOps Repo Credentials

data "aws_secretsmanager_secret" "taskit_gitops_repo_cred_secret" {
  arn = "arn:aws:secretsmanager:eu-central-1:644435390668:secret:taskit-gitops-repo-cred-cueWXJ"
}

data "aws_secretsmanager_secret_version" "taskit_gitops_repo_cred_current" {
  secret_id = data.aws_secretsmanager_secret.taskit_gitops_repo_cred_secret.id
}

resource "kubernetes_secret" "taskit_gitops_repo_cred" {
  depends_on = [helm_release.argocd]

  metadata {
    name      = "taskit-gitops-repo-cred"
    namespace = "argocd"

    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    name          = "taskit-gitops-repo-cred"
    type          = "git"
    url           = "git@github.com:yuval2313/taskit-gitops.git"
    sshPrivateKey = data.aws_secretsmanager_secret_version.taskit_gitops_repo_cred_current.secret_string
  }
}

# Task-it DB Credentials

data "aws_secretsmanager_secret" "taskit_db_cred_secret" {
  arn = "arn:aws:secretsmanager:eu-central-1:644435390668:secret:taskit-db-cred-7osDZC"
}

data "aws_secretsmanager_secret_version" "taskit_db_cred_current" {
  secret_id = data.aws_secretsmanager_secret.taskit_db_cred_secret.id
}

resource "kubernetes_namespace" "taskit" {
  metadata {
    name = "taskit"
  }
}

resource "kubernetes_secret" "taskit_secret" {
  depends_on = [kubernetes_namespace.taskit]
  
  metadata {
    name = "taskit-secret"
    namespace = "taskit"
  }

  data = {
    postgres-user-password  = jsondecode(data.aws_secretsmanager_secret_version.taskit_db_cred_current.secret_string)["DB_PASSWORD"]
    postgres-admin-password = ""
    postgres-repl-password  = ""
  }
}
