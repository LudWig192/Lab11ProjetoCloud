# ─────────────────────────────────────────────
# Dockerfile – AgroVerde One-Page
# Case 2: Agronegócio · Agroindústria
# LAB11 – Projeto Cloud · UNISENAI Jun/2026
# ─────────────────────────────────────────────

# Imagem base leve com Nginx
FROM nginx:1.27-alpine

# Metadados da imagem
LABEL maintainer="agroverde-devops"
LABEL description="AgroVerde One-Page – Case 2 Agronegócio"
LABEL version="1.0"

# Remove a página padrão do Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia a one-page para o diretório raiz do Nginx
COPY index.html /usr/share/nginx/html/index.html

# Ajusta permissões
RUN chmod 644 /usr/share/nginx/html/index.html

# Expõe a porta 80
EXPOSE 80

# Healthcheck: verifica se o Nginx está respondendo
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

# Inicia o Nginx em modo foreground (obrigatório para Docker)
CMD ["nginx", "-g", "daemon off;"]
