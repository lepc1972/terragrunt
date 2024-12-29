# Proyecto Terragrunt

Este es un proyecto de infraestructura como código utilizando Terragrunt para gestionar recursos de AWS.

## Estructura del proyecto

El proyecto se divide en los siguientes módulos:

### VPC (Red Virtual Private Cloud)
- Configura una red virtual privada con subredes públicas y privadas.
- Implementa puertas de enlace NAT y VPN.

### EC2 Instances
- Crea instancias EC2 en la red virtual configurada.

## Requisitos previos

Antes de aplicar este proyecto, asegúrate de tener instalado:

- Terraform >= 1.0.0
- Terragrunt >= 0.27.0
- AWS CLI configurado con acceso a tu cuenta AWS

## Configuración

1. Clona el repositorio:

git clone https://github.com/lepc1972/terragrunt.git cd terragrunt


2. Ejecuta Terragrunt desde el directorio raíz:

terragrunt apply


## Variables de entrada

Puedes personalizar tus recursos modificando los archivos `terragrunt.hcl` en cada módulo. Algunas variables importantes son:

- `name`: Nombre del recurso
- `region`: Región AWS donde se crearan los recursos
- `tags`: Etiquetas adicionales para identificar tus recursos

## Consideraciones de seguridad

- Usa variables de entorno para secretos como claves de acceso AWS.
- Limita el acceso a tus recursos usando grupos de seguridad y políticas IAM.

## Contribuciones

Contribuciones de código, pruebas y documentación son bienvenidas. Por favor, abre una nueva issue o haz un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Ver el archivo LICENSE para detalles.



