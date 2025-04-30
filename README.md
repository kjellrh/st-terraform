
Arbeidskrav 1: Terraform og Azure



1. Installer nødvendige verktøy

Du må ha følgende på maskinen din:

- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

--------------------------------------------------------------------------------------------------------------------------------------------------------------

2. Last ned Github filene til foreksempel c:\Terraform\

3. Start Powershell som administrator og skriv "az login". Du får da opp ett innloggingsbilde hvor du velger den Microsoft kontoen du har Azure på.

4. Gå til mappen som Terraform filene ligger (f.eks C:\Terraform)

5. Skriv "terraform init"

6. Skriv "terraform apply"

Skriv yes når du blir spurt.
Dette vil opprette:
-Ressursgruppe
-VNet og subnet
-Webserver + 2 database-VM-er
-NSG-regler
-Apache installert på webserver

7.  Finn public IP til webserver-VM (fra Terraform-output eller Azure Portal)

Åpne IP-en i en nettleser: http://<public-ip>
Du skal se meldingen: "Hallo fra Laerdal"

8. Hvis man ønsker å fjerne alt fra Azure igjen skriver man "terraform destroy"
