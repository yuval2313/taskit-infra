resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true
  wait             = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.52.1"
  
  values = [
    "${file(var.values_path)}"
  ]
}

resource "kubectl_manifest" "bootstrap_application" {
  depends_on = [helm_release.argocd, kubernetes_secret.taskit_gitops_repo_cred, kubernetes_secret.taskit_secret]

  yaml_body = file(var.bootstrap_application_path)
}